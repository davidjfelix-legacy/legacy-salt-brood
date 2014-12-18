[![Brood](http://img.shields.io/badge/brood-DavidJFelix-735145.svg)](https://github.com/DavidJFelix)
[![Travis](https://img.shields.io/travis/hatchery/my-brood.svg)](https://travis-ci.org/hatchery/my-brood)
[![Code Climate](https://img.shields.io/codeclimate/github/hatchery/my-brood.svg)](https://codeclimate.com/github/hatchery/my-brood)
[![Coveralls](https://img.shields.io/coveralls/hatchery/my-brood.svg)](https://coveralls.io/r/hatchery/my-brood)

#my-brood

**You're in the right place.** my-brood is the starting point for Hatchery.
Hatchery is a system for provisioning computers with a focus on power users and developers.
Provisioning is the installation, configuration and orchestration of software from a baseline.
Hatchery is a bundle of software that allows you to easily create and share provisioning.
Each software and specific configuration can be thought of as a system's "dna".
Systems which are like eachother can be thought of as genetically similar, like members of a "brood".
my-brood is an example brood that I (the great creator) use personally.
You can use it, splice your own dna and make your own brood to conqueor the software world.

The design for my-brood has been shamelessly adapted from Github boxen's our-boxen repository.
The design of the hatchery system has been adapted from boxen in a way that should allow more in-depth customization.
Hatchery features a way that things are done, with few strong opinions on how they should be done in the future.
The only opinion Hatchery will attempt to follow is one of loose coupling.
Hatchery presently uses puppet and OS-specific package management methods to orchestrate software.
Each package management system has its own caveats (and some have their own strengths).
Hatchery attempts to mitigate the caveats and fix some of them, without taking on too much package management onus.

my-brood is designed as a baseline repository that will allow users to accept my choices as defaults.
If a user wants their machine to be different, they can easily fork any or all of the repositories in hatchery.
Some of the changes will be valuable upstream, especially if they allow future users to more deeply configure software.
This repository comes with bootstrapping scripts to help you install the Hatchery system as a whole and use your own brood.

While I've written a lot here, text is cheep.
Design diagrams can be found in the hatchery/hatchery repository on github.
I've intentionally left them out of this document to preserve a small, fast download for bootstrapping hatchery.

#Installation

If you're alright with my defaults, you can just follow the instructions below to install.
If you're interested in customizing my defaults and making your own brood, go to the customizing section and come back here when you're done.

##Bootstrapping

Take a look at the scripts directory. They're not done yet.
