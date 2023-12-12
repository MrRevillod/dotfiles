
echo "Arreglando audio para Matebook D15"

sudo pacman -S pulseaudio pulseaudio-alsa pulseaudio-bluetooth bluez bluez-utils alsa-firmware alsa-lib alsa-oss alsa-utils alsa-ucm-conf pavucontrol sof-firmware sof-tools

sudo pulseaudio --daemonize

systemctl --user enable pulseaudio && systemctl --user start pulseaudio

sudo alsactl store

systemctl status alsa-restore.service

sudo mkdir -p /etc/systemd/system/alsa-restore.service.d/

pacmd list-sink-inputs

echo "Ahora ejecuta con bash:"

echo "cat > /etc/systemd/system/alsa-restore.service.d/delay.conf<<EOF"

echo "sudo nvim /boot/grub/grub.cfg y añadir lo siguiente al final:"

echo "snd-intel-dspcfg.dsp_driver=1 \n ### END /etc/grub.d/10_linux ###"
