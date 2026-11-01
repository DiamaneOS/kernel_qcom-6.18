/*
 * ESWIN EPH861X series Touchscreen driver
 *
 *
 * This program is free software; you can redistribute  it and/or modify it
 * under  the terms of  the GNU General  Public License as published by the
 * Free Software Foundation;  either version 2 of the  License, or (at your
 * option) any later version.
 *
 */

// uncomment to enable the dev_dbg prints to dmesg
#define DEBUG
// uncomment to test with input forced open
//#define INPUT_DEVICE_ALWAYS_OPEN
#include <linux/types.h>



#include <uapi/asm-generic/errno-base.h>
#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/delay.h>
#include <linux/iopoll.h>
#include <linux/spi/spi.h>
#include <linux/dma-mapping.h>

#include "eswin_eph861x_tlv.h"
#include "eswin_eph861x_types.h"
#if (ESWIN_EPH861X_SPI)
#include "eswin_eph861x_spi.h"

#define TLV_RESERVED_INVALID_TYPE  0xFF



u8 spi_tx_dummy_buf[SPI_APP_BUF_SIZE_READ];




int __eph_spi_read(struct eph_data *ephdata, u16 len, u8 *val)
{
    int ret_val;
    struct spi_message  spimsg;
    struct spi_transfer spitr;

    //dev_info(&ephdata->commsdevice->dev, "%s\n", __func__);
    /* Read header - T(ype) and L(ength) */
    spi_message_init(&spimsg);
    memset(&spitr, 0,  sizeof(struct spi_transfer));


    if ((SPI_APP_BUF_SIZE_READ) < len)
    {
        dev_err(&ephdata->commsdevice->dev, "Error reading from spi: length greater than buffer size(%d)", len);
        return -ENOMEM;
    }

    /* Ensure dummy tx configured */
    memcpy(ephdata->comms_send_buf, &spi_tx_dummy_buf[0], len);


    /* Output 0xFFs when doing a read */
    spitr.tx_buf = ephdata->comms_send_buf;
    spitr.rx_buf = ephdata->comms_receive_buf;
    spitr.len = len;
#if 0
    spitr.tx_dma = ephdata->comms_dma_handle_tx;
    spitr.rx_dma = ephdata->comms_dma_handle_rx;
#if KERNEL_VERSION(6, 9, 0) >= LINUX_VERSION_CODE
    spimsg.is_dma_mapped = 1;
#endif
#endif
    spitr.cs_change = 0;

    //TODO Kernel version 5.5 introduces support for CS to CLK delay which will be useful when implementing low power sleep modes
    spi_message_add_tail(&spitr, &spimsg);
    ret_val = spi_sync(ephdata->commsdevice, &spimsg);

    if (ret_val < 0)
    {
        dev_err(&ephdata->commsdevice->dev, "Error reading from spi (%d)", ret_val);
        return ret_val;
    }


    /* include T and L */
    memcpy(val, ephdata->comms_receive_buf, len);
    return 0;
}


int __eph_spi_write(struct eph_data *ephdata, u16 len, const u8 *val)
{
    int ret_val;
    struct spi_message  spimsg;
    struct spi_transfer spitr;
 
    //dev_info(&ephdata->commsdevice->dev, "%s\n", __func__);

    if ((SPI_APP_BUF_SIZE_WRITE) < len)
    {
        dev_err(&ephdata->commsdevice->dev, "Error writing to spi: length greater than buffer size(%d)", len);
        return -ENOMEM;
    }

    /* SPI_WRITE */
    memcpy(ephdata->comms_send_buf, val, len);
    spi_message_init(&spimsg);
    memset(&spitr, 0,  sizeof(struct spi_transfer));
    spitr.tx_buf = ephdata->comms_send_buf;
    spitr.rx_buf = ephdata->comms_receive_buf;
    spitr.len = len;
#if (ESWIN_EPH861X_SPI_USE_DMA)
    spitr.tx_dma = ephdata->comms_dma_handle_tx;
    spitr.rx_dma = ephdata->comms_dma_handle_rx;
#if KERNEL_VERSION(6, 9, 0) >= LINUX_VERSION_CODE
    spimsg.is_dma_mapped = 1;
#endif
#endif
    spitr.cs_change = 0;
    spi_message_add_tail(&spitr, &spimsg);
    ret_val = spi_sync(ephdata->commsdevice, &spimsg);
    if (ret_val < 0)
    {
        dev_err(&ephdata->commsdevice->dev, "Error writing to spi (%d)", ret_val);
        return ret_val;
    }

    return 0;
}


/* Command replies need not assert CHG. Poll their SPI response instead of
 * treating an empty FIFO after a startup report as an immediate transfer error.
 */
static int eph_spi_read_response(struct eph_data *ephdata, u16 len, u8 *buf,
                                 bool *response_ready)
{
    int ret = __eph_spi_read(ephdata, len, buf);

    *response_ready = !ret && !eph_is_report_null_report(buf) &&
                      buf[0] != TLV_RESERVED_INVALID_TYPE;
    return ret;
}

int eph_comms_read(struct eph_data *ephdata, u16 len, u8 *buf)
{
    bool response_ready;
    int ret, timeout;
    s64 timeout_us = 500000;

    if (len > SPI_APP_BUF_SIZE_READ)
        return -ENOMEM;

    /* A resume handshake shares one deadline across all of its SPI reads. */
    if (ephdata->comms_deadline) {
        timeout_us = min_t(s64, timeout_us,
                          ktime_us_delta(ephdata->comms_deadline, ktime_get()));
        if (timeout_us <= 0)
            return -ETIMEDOUT;
    }

    /* A real transport error stops immediately; only an empty response retries. */
    timeout = read_poll_timeout(eph_spi_read_response, ret, ret || response_ready,
                               200, timeout_us, false, ephdata, len, buf,
                               &response_ready);
    if (timeout) {
        dev_err(&ephdata->commsdevice->dev,
                "SPI response timed out len=%u data=%*ph\n",
                len, min_t(u16, len, 7), buf);
        return timeout;
    }
    if (ret)
        dev_err(&ephdata->commsdevice->dev, "Error reading SPI (%d)\n", ret);
    return ret;
}

int eph_comms_write(struct eph_data *ephdata, u16 len, u8 *buf)
{
    int ret_val = 0;

    ret_val = __eph_spi_write(ephdata,
                                  len,
                                  buf);


    return ret_val;
}


int eph_comms_specific_checks_spi(struct comms_device *commsdevice)
{
#if 0
    if ( (commsdevice->bits_per_word && commsdevice->bits_per_word != 8) ||
         !(commsdevice->mode & SPI_CPHA) ||
         !(commsdevice->mode & SPI_CPOL) )
    {
        dev_err(&commsdevice->dev, "unexpected spi device setup: SPI mode(%d), bits_per_word(%d) \n", commsdevice->mode, commsdevice->bits_per_word);
        return -EINVAL;
    }
#else
    printk("eswin eph skip check spi\n");
#endif

    /* initialise SPI dummy buffers */
    memset(&spi_tx_dummy_buf[0], 0xFF, SPI_APP_BUF_SIZE_READ);

    return spi_setup(commsdevice);
}

void eph_comms_driver_data_set_spi(struct comms_device *commsdevice, struct eph_data *ephdata)
{
#if KERNEL_VERSION(6, 8, 0) >= LINUX_VERSION_CODE
    snprintf(ephdata->phys, sizeof(ephdata->phys), "spi-%d/input0", commsdevice->master->bus_num);
#endif
    dev_info(&commsdevice->dev, "%s %s\n", __func__, ephdata->phys);
pr_err("eph_comms_driver_data_set_spi------\n");
    spi_set_drvdata(commsdevice, ephdata);
    if (0xff != spi_tx_dummy_buf[0])
    {
        memset(spi_tx_dummy_buf, 0xff, SPI_APP_BUF_SIZE_READ);
    }

  return;
}


struct eph_data* eph_comms_driver_data_get_spi(struct comms_device *commsdevice)
{

    struct eph_data *ephdata = (struct eph_data *)spi_get_drvdata(commsdevice);

  return ephdata;
}


struct comms_device* eph_comms_device_get_spi(struct device *dev)
{

    struct comms_device *commsdevice = to_spi_device(dev);


  return commsdevice;
}

int eph_comms_specific_bootloader_checks_spi(struct eph_data *ephdata)
{
    (void)ephdata;
    return 0;
}

bool eph_is_report_null_report(u8 *buff)
{

    bool is_null_report = false;

    if (0 == buff[0])
    {
        if((0 == buff[1]) && (0 == buff[2]))
        {
            is_null_report = true;
        }

    }

    return is_null_report;

}


#endif /*   ESWIN_EPH861X_SPI  */










