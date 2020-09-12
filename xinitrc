export LANG=en_US.UTF-8
export LC_CTYPE="zh_CN.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_PAPER="en_US.UTF-8"
export LC_NAME="en_US.UTF-8"
export LC_ADDRESS="en_US.UTF-8"
export LC_TELEPHONE="en_US.UTF-8"
export LC_MEASUREMENT="en_US.UTF-8"
export LC_IDENTIFICATION="en_US.UTF-8"

export XMODIFIERS="@im=fcitx"
export XIM=fcitx
export XIM_PROGRAM=fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx

fcitx >/dev/null 2>&1  &
setxkbmap -option ctrl:nocaps
xrdb ~/.Xresources
xset s 0 7200
xset dpms 7200 7200 7200
xset -b
xscreensaver >/dev/null 2>&1 &

case $2 in
    "fvwm")
        exec fvwm
        ;;
    "fluxbox")
        exec startfluxbox
        ;;
    "awesome")
        exec awesome
        ;;
    "stumpwm")
        exec stumpwm
        ;;
    "xmonad")
        exec xmonad
        ;;
    "emacs")
        exec emacs
        ;;
    "xfce")
        exec xfce4-session
        ;;
    "i3")
        exec i3-wm
        ;;
    "dwm")
        while true
        do
            VOL=$(amixer get Master | tail -1 | sed 's/.*\[\([0-9]*%\)\].*/\1/')
            LOCALTIME=$(date +%Z\=%Y-%m-%dT%H:%M)
            OTHERTIME=$(TZ=Europe/London date +%Z\=%H:%M)
            IP=$(for i in `ip r`; do echo $i; done | grep -A 1 src | tail -n1) # can get confused if you use vmware
            TEMP="$(($(cat /sys/class/thermal/thermal_zone0/temp) / 1000))C"
            if acpi -a | grep off-line > /dev/null
            then
                BAT="Bat. $(acpi -b | awk '{ print $4 " " $5 }' | tr -d ',')"
                xsetroot -name "$IP $BAT $VOL $TEMP $LOCALTIME $OTHERTIME"
            else
                xsetroot -name "$IP $VOL $TEMP $LOCALTIME $OTHERTIME"
            fi
            sleep 60s
        done &
        exec dwm
        ;;
    *)
        exec xfce4-session
        ;;
esac
