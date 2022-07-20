#!/bin/bash
cp -r /tmp_home/. /home/jovyan

mkdir -p /opt/noVNC`dirname ${NB_PREFIX}`
ln -s /opt/noVNC /opt/noVNC${NB_PREFIX}

cat > ~/.config/xfce4/xinitrc <<EOF
#!/bin/sh
xset s off
xset s noblank
. /etc/xdg/xfce4/xinitrc
EOF

echo "matlab" | vncpasswd -f > ~/.vnc/passwd
chmod 0600 ~/.vnc/passwd

exec /bin/run.sh "$@"
