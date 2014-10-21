my-brood
========

The design for my-brood has been shamelessly adapted from Github boxen's our-boxen repository.

This and all hatchery projects are named from concepts related to the fictional alien race, Zerg.
Broods in Zerg terms are a group of genetically similar Zerg that are all hatched from the same
area with a focused purpose.
The Zerg species adapts by having a large array of genetic diversity accross broods and using genetic advantage.
Your brood is your computer and computers like it.
Your brood may be like mine, but it may not.
Fork my brood to create genentic modifications for your own purposes and go forth and conquor the galaxy.

Installation
============

Ensure that your machine has curl available in the command line.
The bootstrapping process relies on curl to fetch the files needed for provisioning.
If you're on Windows, there are scripts to automatically install curl correctly.

###Proxy

The curl bootstrap script for Windows needs to be run with no proxy.
If you have to use a proxy and can't get around it, there's not much I can do to help you until you have curl.
Download it and install it manually from one of the following links:

[64 Bit curl Installer](http://www.confusedbycode.com/curl/curl-7.38.0-win64.msi) |
[32 Bit curl Installer](http://www.confusedbycode.com/curl/curl-7.38.0-win32.msi)

After you've installed it manually, ensure that you set `http_proxy` and `https_proxy` environmental variables.
These variables can be set in the control pannel under "Advanced system settings".
The variables should be set in a `user:password@host:port` format as shown below:

    http_proxy=user:password@http://proxy.host.com:1234
    https_proxy=user:password@https://proxy.host.com:1234

or if your proxy doesn't support HTTPS:

    http_proxy=user:password@http://proxy.host.com:1234
    https_proxy=user:password@http://proxy.host.com:1234

###Running the bootstrapping script
