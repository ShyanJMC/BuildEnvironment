#### v0.3.6
#### 

FROM archlinux:latest

### Repository
RUN rm /etc/pacman.d/mirrorlist.pacnew
ADD mirrorlist /etc/pacman.d/mirrorlist
RUN pacman -Syyuuq --noconfirm

### BuildSystem
RUN pacman -Syyuuq base-devel curl rust git --needed --noconfirm 
RUN sed -i 's/march\=x86-64/march\=native -O2/g' /etc/makepkg.conf
RUN sed -i '#RUSTFLAGS\=\"-C\ opt\-level\=2/RUSTFLAGS\=\"\-C\ opt\-level\=2\ \-C\ debuginfo\=0\ \-C\ target\-cpu\=native' /etc/makepkg.conf
ADD makepkg /usr/bin/makepkg

### User

RUN usermod -s /bin/bash -d /home/nobody nobody
RUN echo "nobody ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

#
CMD ["/bin/bash"]
