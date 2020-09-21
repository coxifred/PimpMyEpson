### **Welcome to the PimpMyEpson!**

![PimpMyEpson](https://github.com/coxifred/PimpMyEpson/blob/master/images_resources4wiki/title.png?raw=true)

## **Quick description**

The purpose is to build a mini wifi projector control module with a simple Wemos R1 mini (ESP8266) Module.

_All starts with a virtual overview:_

![virtualOverview](https://github.com/coxifred/PimpMyEpson/blob/master/images_resources4wiki/overview.jpg?raw=true)

## **Features**

_Here are the indispensables features i have implemented:_

**1.Control EPSON projector from wifi and get informations (like Lamp hour).

**2.Customs commands based on Epson documentation [Here](https://github.com/coxifred/PimpMyEpson/blob/master/ESCVP21_e_P.pdf)

**3.Json feedback.

**4.Custom network configuration (wifi,static dhcp..)

**5.Updateable on the air.

## **Installation**

Just plug the box in the RS232 of your projector and bring USB power to the box.

<img src="https://github.com/coxifred/PimpMyEpson/blob/master/images_resources4wiki/proj2.jpg?raw=true" width="350">

## **Configuration**

Very simple, at the first start, PimpMyEpson will provide a Wifi hotspot (Normally PimpMyEpson_***).
Connect to the device with a wifi phone or tablet.

You could choose in network menu wifi mode (Station or AccessPoint), and dhcp or static ip adress.

Wifi profile (Station or AccessPoint)

![wifi](https://github.com/coxifred/PimpMyEpson/blob/master/images_resources4wiki/wifis.jpg?raw=true)

Network profile (Static or DHCP)

![network](https://github.com/coxifred/PimpMyEpson/blob/master/images_resources4wiki/network.jpg?raw=true)


## **Hardware**

Less than 10euros, found on known electronics websites.

ESP Wemos Mini D1 mini
RS232 interface

![price](https://github.com/coxifred/PimpMyEpson/blob/master/images_resources4wiki/price.png?raw=true)

Box printed :

![printed](https://github.com/coxifred/PimpMyEpson/blob/master/images_resources4wiki/20171128_121402.jpg?raw=true)

[STL render box](https://github.com/coxifred/PimpMyEpson/blob/master/3d/PimpMyEpsonBoite.stl).

[STL render cover](https://github.com/coxifred/PimpMyEpson/blob/master/3d/PimpMyEpsonCouvercle.stl).

<img src="https://github.com/coxifred/PimpMyEpson/blob/master/images_resources4wiki/box.jpg?raw=true" width="350">
<br>
<img src="https://github.com/coxifred/PimpMyEpson/blob/master/images_resources4wiki/box2.jpg?raw=true" width="350">

This box has been printed and built with openScad, an excellent 3D software designer [OPENScad](http://www.openscad.org/).
No more click, you design your model with code, 3DAC (3D as code) :) (so easy to adjust).

Click [here](https://github.com/coxifred/PimpMyEpson/blob/master/3d/PimpMyEpson.scad) to download the openScad box file, as you see, very simple :

```
/**
Boite pour PimpMyEpson avec openScad
2017 (Fred)
**/

// La boite principale
module boite()

{   

     // Intersection trapeze USB et boite

    difference() {
        // Intersection trapeze RS232 et boite
        difference() {
            // Intersection des 2 boites
            difference() {
                translate([-18,0,0]) cube ([36,44,27]);
                translate([-16,1,2]) cube ([32,41,25]);
            }
            translate([0,5,18])  rotate([90,180,0]) linear_extrude (height=10) polygon (points=[[-9,0],[9,0],[7,8],[-7,8]]);
        }
       translate([0,45,20])  rotate([90,0,0])  linear_extrude (height=10)  polygon (points=[[-5,0],[5,0],[4,4],[-4,4]]);
    }
}

// Le couvercle
module couvercle()
{
  // Intersection avec le couvercle
  rotate([180,0,0]) translate([45,-44,-29]) difference() {
                       // Couvercle
                       translate([-18,0,25]) cube ([36,44,4]);   
                       boite();
                       }
}

// La marche interne
module marche();
{
  // La marche interne
  translate([-16,36,2]) rotate([90,0,90]) linear_extrude (height=32) polygon (points=[[-4,0],[6,0],[6,10],[-2,10]]);  
}

boite();
couvercle();
marche();
```


## **Software**

You can find sources [here](https://github.com/coxifred/PimpMyEpson/tree/master/sources)

You can find image  [here](https://github.com/coxifred/PimpMyEpson/tree/master/bin) (just upload to your wemos with arduino IDE or other flashtool)

## **Utilisation**

Some actions :

![actions](https://github.com/coxifred/PimpMyEpson/blob/master/images_resources4wiki/action.jpg?raw=true)

Custom command screen:

![custom](https://github.com/coxifred/PimpMyEpson/blob/master/images_resources4wiki/custom.jpg?raw=true)

Json raw:

// 20171204223950
// http://<module_ip>/json

{
  "version": "1.0",
  "starttime": 358453,
  "ip": "192.168.1.92",
  "netmask": "255.255.255.0",
  "gateway": "192.168.1.1",
  "wifimode": "ST",
  "ipconfig": "STATIC",
  "ssid": "TUSTI_WIFI",
  "password": "****",
  "lampeHours": "LAMP=495",
  "powerState": "PWR=01"
}


Api for custom command:

Just use http://<module_ip>/command?cmd=<your_espon_command> in response, the videoprojector answer.

## **Wiring**
![wiring](https://github.com/coxifred/PimpMyEpson/blob/master/images_resources4wiki/wiring.png?raw=true)

## **Shots of reality (Proto #0)**

<img src="https://github.com/coxifred/PimpMyEpson/blob/master/images_resources4wiki/proj.jpg?raw=true" width="350">

Some Gorilla's HomeAutomate integration:

After plugin Espon added:

![plugin](https://github.com/coxifred/PimpMyEpson/blob/master/images_resources4wiki/plugin.jpg?raw=true)

Insert widget:

![homeautomate](https://github.com/coxifred/PimpMyEpson/blob/master/images_resources4wiki/homeautomate.jpg?raw=true)

OUn Oun !

<img src="https://github.com/coxifred/PimpMyEpson/blob/master/images_resources4wiki/ounoun.jpg?raw=true" width="100">
