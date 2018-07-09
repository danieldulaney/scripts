#!/bin/sh

USERNAME=daniel

# Install expected tools
pacman -S vim git openssh sudo --noconfirm
systemctl enable sshd.service
systemctl start sshd.service

# Create a new user
useradd -m "$USERNAME"

# Create sudo group if it doesn't exist, and add the new user to it
$(getent group sudo) || groupadd sudo
usermod -aG "$USERNAME"

