# therek's workspace setup scripts

[![Build Status](https://travis-ci.org/therek/workspace.svg?branch=master)](https://travis-ci.org/therek/workspace)
[![Run Status](https://api.shippable.com/projects/59dfaa79f7ca690700e8e3c4/badge?branch=master)](https://app.shippable.com/github/therek/workspace)

A bit of code to set up my workspace. Currently it supports Mac OS X and
Ubuntu operating systems only.

It can:
* Install basic set of applications (defined in `apt_packages` or
  `brew_packages`).
* Pre-configure global GIT settings (defined in `git_configuration` variable).
* Install [Atom](https://atom.io/) and some additional modules (defined
  in `atom_packages` variable).
* Install Powerline shell prompt for Bash.

To start setup run `setup.sh` script.
