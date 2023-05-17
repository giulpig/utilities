#! /bin/bash

id="42"

sleep 0.1
caps_lock_status=$(xset -q | sed -n 's/^.*Caps Lock:\s*\(\S*\).*$/\1/p')

if [ $caps_lock_status = "on" ]
then
    app_name="MY APP NAME"
    # my test shows that gtk-dialog-info can be anything in
    # /usr/share/icons/gnome/
    summary="CAPS LOCK"
    body="YOU STUPID ASS YOU PRESSED CAPS LOCK"
    actions="[]"
    hints="{}"

    exec gdbus call --session   \
        --dest org.freedesktop.Notifications \
        --object-path /org/freedesktop/Notifications \
        --method org.freedesktop.Notifications.Notify \
        "${app_name}" "${id}" "" "${summary}" "${body}" \
        "${actions}" "${hints}" "100000"
else

    exec gdbus call --session \
        --dest org.freedesktop.Notifications \
        --object-path /org/freedesktop/Notifications \
        --method org.freedesktop.Notifications.CloseNotification \
        "$id"
fi
