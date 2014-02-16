#Kinect for your micro pc!


Did you ever wanted to use Kinect on your Cubieboard to control your home theatre with gestures, or you wanted to give your Cubieboard-based mobile robot some serious computer vision?

Using Kinect with ARM computer is possible, but it is still not an easy task to do. There are many libraries with many different versions, many configurations and you still have to compile everything for yourself.

This is set of instruction-like scripts which should guide you on installation process of following pieces of software:

1. **[libfreenect](http://openkinect.org/wiki/Main_Page)** - driver for MS Kinect to be able to use it on linux.After installation, you get direct access to kinect data on your ARM board, control LEDs and motor.You can install it from [official repository](https://github.com/OpenKinect/libfreenect), or [Nicolas Burrus repo](https://github.com/nburrus/libfreenect), to have compatibility with RGBDemo, if you plan to install it  

2. **[OpenNI](http://www.openni.org/)** - The OpenNI framework is an open source SDK used for the development of 3D sensing middleware libraries and applications. The OpenNI website provides an active community of developers, the tools and support, a network of potential partners and a distribution platform - addressing the complete development lifecycle.

3. **[SensorKinect](https://github.com/avin2/SensorKinect)** - **driver needed to give access to MS Kinect to OpenNI, without this, Kinect won't be recognized!**

4. **[Point cloud library](http://pointclouds.org/)**  - The Point Cloud Library (PCL) is a standalone, large scale, open project for 2D/3D image and point cloud processing.

5. **[RGBDemo](http://labs.manctl.com/rgbdemo/)** - Wonderful peace of software written by Nicolas Burrus, which consists of library for working with RGBD cameras with either libfreenect or OpenNI backend

6. **[OpenCV](http://opencv.org/)** - Worlds most famous Open source somputer vision library

Except that, it will provide you instructions on how to prepare your system for installation (create swap if your RAM is less than 1GB) (file: **prepare.sh**), and how to turn your micro-pc into fully-loaded desktop to work with Kinect data (file: **desktop.sh**).

## Supported boards

1. [Cubieboard2](http://cubieboard.org) with [Cubian](http://cubian.org) linux
2. [Cubietruck](http://cubieboard.org) with [Cubian](http://cubian.org) linux in progress
3. [Raspberry Pi](http://www.raspberrypi.org/) with [Raspbian](http://www.raspbian.org/) in progress

<span style="font-size:20px;color:#f00">Support for more boards and other your contributions are VERY welcome and needed!</span>

## Structure of repository and idea
In the root directory, there are devices listed. If you go to concrete device directory, there are platforms listed. Inside each you can find either set of scripts for common installation process, or just one script **install.sh**. It is not important, if the script is working perfectly if run from command line. It's purpose is to provide instructions, not to do all the work (because we dont need more pages-long scripts to study ;)).

**Just please, if you were working with Kinect or Asus Xtion sensors on ARM boards, post here your instructions. We need one place to share! :)**
