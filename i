i='base base-devel linux linux-firmware connman wpa_supplicant grub';e='/dev/';m='/mnt';lsblk;read d
cfdisk $e$d;lsblk;read p;mkfs.ext4 $e$p;mount $e$p $m;pacman -Sy archlinux-keyring;pacstrap $m $i
genfstab -U $m>>$m/etc/fstab;sed '1,3d' i>$m/a;chmod +x $m/a;arch-chroot $m ./a $d
d=$1;p='printf';ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime;hwclock --systohc;u='UTF-8'
$p "en_US.$u $u\nru_RU.$u $u\n">>/etc/locale.gen;locale-gen;echo "LANG=en_US.$u">/etc/locale.conf
echo "KEYMAP=us">/etc/vconsole.conf;read h;echo $h>/etc/host;i="127.0.";l='localhost';mkinitcpio -P
$p "${i}0.1\t$l\n::1\t\t$l\n${i}1.1\t$h.localdomain $h\n";passwd;read u;useradd -m $u;passwd $u
grub-install /dev/$d;grub-mkconfig -o /boot/grub/grub.cfg;systemctl enable connman.service;rm /i.sh
