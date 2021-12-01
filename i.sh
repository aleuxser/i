i='base base-devel linux-zen linux-firmware neovim connman bluez wpa_supplicant'
pacman -Sy archlinux-keyring;timedatectl set-ntp true;lsblk;printf "d=";read d;
cfdisk /dev/$d;lsblk;printf "p=";read p;mkfs.ext4 /dev/$p;mount /dev/$p /mnt;
pacstrap /mnt $i;genfstab -U /mnt>>/mnt/etc/fstab;sed '/$1/,$!d' i.sh>/mnt/a.sh
chmod +x /mnt/2.sh && arch-chroot /mnt ./i.sh $d && exit 
d=$1;ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime;hwclock --systohc
printf "en_US.UTF-8 UTF-8\nru_RU.UTF-8 UTF-8\n">>/etc/locale.gen;locale-gen
echo "LANG=en_US.UTF-8">/etc/locale.conf; echo "KEYMAP=us">/etc/vconsole.conf
printf "host=";read h;echo $h>/etc/host;i="127.0.";l='localhost';m='domain'
printf "${i}0.1\t$l\n::1\t\t$l\n${i}1.1\t$h.local$m $h\n";mkinitcpio -P;passwd
pacman --noconfirm -S grub;grub-install --target=i386-pc /dev/$dr;grub-mkconfig\
-o /boot/grub/grub.cfg;pacman --noconfirm --needed -S git zsh; systemctl enable\
connman.service;printf "u=";read u;useradd -m $u;passwd $u;rm /i.sh
