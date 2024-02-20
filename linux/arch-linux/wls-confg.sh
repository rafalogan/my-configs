#!/usr/bin/env zsh 

# config sudu's #
#################

echo "%whell ALL=(ALL) ALL" > /etc/sudoers.d/wheel

# config users#

useradd -m -G wheel -s /bin/bash {username}

# config password #

passwd {username}


exit 

Arch.exe config --default-user {username}
