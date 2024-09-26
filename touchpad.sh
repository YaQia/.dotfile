#!/usr/bin/bash
touchpad_state=$(gsettings get org.gnome.desktop.peripherals.touchpad send-events)
if [ $touchpad_state == "'enabled'" ];then
    gsettings set org.gnome.desktop.peripherals.touchpad send-events 'disabled'
else
    gsettings set org.gnome.desktop.peripherals.touchpad send-events 'enabled'
fi
