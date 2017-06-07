** work in progress **

# wifi-analytics
Sniffing WiFi data for advanced analytics, using a Raspberry Pi

## Hardware
This code was developed and tested using a Raspberry Pi 3 Model B and a Ralink RT5370 USB wireless adaptor. The internal wireless adaptor in the Pi v3 doesn't natively support monitor mode (see below), hence the adaptor.

## Software
The Pi microSD card was flashed with Hypriot OS 1.4.0, which includes Docker 17.03.0-ce, kernel 4.4.50. The rest of the software was configured using the Dockerfile, although it was necessary to manually setup the WiFi adaptor. Went with Ubuntu 14.04 (ARMv7 build) for simplicity, probably could have gone with a leaner ditstribution really.

## Setting up the Pi WiFi adapter:
To capture packets without being associated with a specific wireless access point requires a wireless adaptor that supports monitor mode. Unfortunately, the Raspberry Pi v3 internal wireless adaptor does not support monitor mode, but USB wireless adaptors based on the RT5370 chipset (among others) do tend to and can be found easily on Amazon or eBay. They will run hapilly on the Pi without further setup. The code below should be sufficient to set the adaptor to monitor mode (assuming the USB wireless adaptor is wlan1):

```
sudo ifconfig wlan1 down
sudo iwconfig wlan1 mode monitor
sudo ifconfig wlan1 up
```

## Setting up and running:
Clone the repository, build the Docker container, and run it in privilleged mode

```
git clone https://github.com/4OH4/wifi-analytics.git
cd wifi-analytics
docker build –t wifi-analytics .
docker run -ti --net=host --privileged wifi-analytics /bin/bash
```

## Capturing packets

```
tshark –i wlan1 -I
```

## Analytics
More to follow here...

## To do:
[Visitorflow](https://github.com/IMAmuseum/visitorflow)

## Inspired by:
[Pi + Kismet](https://holisticsecurity.io/2016/02/02/everything-generates-data-capturing-wifi-anonymous-traffic-raspberrypi-wso2-part-i/)
[Pi WiFi Analytics](https://mapdataservices.wordpress.com/2014/08/21/homemade-raspberry-pi-indoor-wi-fi-analytics/)
[Wireshark in Docker](https://hub.docker.com/r/manell/wireshark/)
[How to Dockerize Wireshark](https://hub.docker.com/r/costache2mihai/dockerizedwiresharkformsources/)