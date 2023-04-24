#!/bin/bash

sudo apt-get update
sudo apt-get install -y nginx
sudo systemctl enable nginx
sudo systemclt start nginx
sudo apt-get install -y htop curl wget telnet tcpdump