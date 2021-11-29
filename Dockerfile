FROM archlinux:latest

### Repository
RUN rm /etc/pacman.d/mirrorlist.pacnew
ADD mirrorlist /etc/pacman.d/mirrorlist
RUN pacman -Syyuuq --noconfirm

### BuildSystem
RUN pacman -Syyuuq base-devel curl rust git community/supervisor --noconfirm 
RUN sed -i 's/march\=x86-64/march\=native -O2/g' /etc/makepkg.conf
RUN sed -i '#RUSTFLAGS\=\"-C\ opt\-level\=2/RUSTFLAGS\=\"\-C\ opt\-level\=2\ \-C\ debuginfo\=0\ \-C\ target\-cpu\=native' /etc/makepkg.conf
RUN usermod -s /bin/bash nobody

ADD makepkg /usr/bin/makepkg

#
CMD ["/bin/bash"]
