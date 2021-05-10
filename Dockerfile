FROM archlinux:latest


# Install prerequisits
RUN pacman --noconfirm -Syy && pacman --noconfirm -S sudo && echo 'osdev ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Patch makepkg.conf
COPY .docker/patched_makepkg.conf /etc/makepkg.conf

# Create user and switch to it
RUN useradd -m osdev && passwd -d osdev
USER osdev

# Copy and run install scrip
WORKDIR /home/osdev/
COPY .docker/install.sh /home/osdev/install.sh
RUN sh /home/osdev/install.sh
RUN rm -f /home/osdev/install.sh