#### v0.5.8
#### 

FROM archlinux:latest

### Repository
RUN rm /etc/pacman.d/mirrorlist.pacnew
ADD mirrorlist /etc/pacman.d/mirrorlist
RUN pacman -Syyuuq --noconfirm

### BuildSystem
RUN pacman -Syyuuq base-devel curl rust git --needed --noconfirm 
RUN sed -i '#RUSTFLAGS\=\"-C\ opt\-level\=2/RUSTFLAGS\=\"\-C\ opt\-level\=2\ \-C\ debuginfo\=0\ \-C\ target\-cpu\=native' /etc/makepkg.conf
ADD makepkg /usr/bin/makepkg
ADD build.sh /usr/bin/build

### User

RUN usermod -s /bin/bash -d /home/nobody nobody
RUN echo "nobody ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

#
CMD ["/bin/su","nobody","-"]
