** work in progress **

# wifi-analytics
Sniffing WiFi data for advanced analytics, using a Raspberry Pi

## Hardware
This code was developed and tested using a Raspberry Pi Model B+ and a Ralink RT5370 USB wireless adaptor. It would also run on a more modern Pi, although the internal wireless adaptor in the Pi v3 doesn't natively support monitor mode (see below).

## Software
The Pi microSD card was flashed with Hypriot OS 1.4.0, which includes Docker 17.03.0-ce, kernel 4.4.50. The rest of the software was configured using the Dockerfile, although it was necessary to manually setup the WiFi adaptor.

## Setting up the Pi WiFi adapter:
To capture packets without being associated with a specific wireless access point requires a wireless adaptor that supports monitor mode. Unfortunately, the Raspberry Pi v3 internal wireless adaptor does not support monitor mode, but USB wireless adaptors based on the RT5370 chipset (among others) do tend to and can be found easily on Amazon or eBay. They will run hapilly on the Pi without further setup. The code below should be sufficient to set the adaptor to monitor mode:

```
sudo ifconfig wlan0 down
sudo iwconfig wlan0 mode monitor
sudo ifconfig wlan0 up
```

## Setting up and running:
Clone this repository, build the Docker container, and run it in privilleged mode
