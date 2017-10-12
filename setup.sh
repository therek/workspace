#!/bin/bash

OSNAME=`uname -s`

function unsupported() {
  echo "Unsupported Operating System: $1"
  exit 1
}

function msg() {
  echo -n -e "\x1B[1;36m### $1\x1B[0m"
}

function install_bin() {
  local _binary=$1
  local _install="$2"

  msg "Checking for ${_binary}... "
  which $_binary
  [[ $? -ne 0 ]] && echo "missing. Going to install" && $_install
}

function set_git_user() {
  git config --global user.name > /dev/null
  if [ $? -ne 0 ]; then
    msg "Enter your full name: "
    read USER
    git config --global user.name "$USER"
  fi

  git config --global user.email > /dev/null
  if [ $? -ne 0 ]; then
    msg "Enter your e-mail address: "
    read EMAIL
    git config --global user.email $MAIL
  fi
}

function run_ansible() {
  msg "Running Ansible playbook...\n"
  ansible-playbook -i hosts -K site.yml
}

function install_mac() {
  set_git_user
  install_bin pip     'sudo easy_install pip'
  install_bin ansible 'sudo pip install ansible'
  install_bin brew    '/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
  run_ansible
}

function install_ubuntu() {
  set_git_user
  install_bin pip     'sudo apt -y install python-pip'
  install_bin ansible 'sudo pip install ansible'
  run_ansible
}

function install_linux() {
  DISTNAME=`lsb_release -si`
  case $DISTNAME in
    'Ubuntu') install_ubuntu ;;
    *)        unsupported $DISTNAME ;;
  esac
}

case $OSNAME in
  'Darwin') install_mac ;;
  'Linux')  install_linux ;;
  *)        unsupported $OSNAME ;;
esac

exit 0
