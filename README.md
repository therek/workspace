# therek's workspace setup scripts

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
