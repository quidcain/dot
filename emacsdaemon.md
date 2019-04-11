#Starting Emacs Daemon with systemd

Create /etc/systemd/system/emacs.service containing the following:

```
[Unit]
Description=Emacs text editor
Documentation=info:emacs man:emacs(1) https://gnu.org/software/emacs/

[Service]
Type=forking
ExecStart=/usr/bin/emacs --daemon
ExecStop=/usr/bin/emacsclient --eval "(kill-emacs)"
Environment=SSH_AUTH_SOCK=%t/keyring/ssh
Restart=on-failure

[Install]
WantedBy=default.target

```

Load on boot
|
Do not load on boot
```
systemctl enable emacs
systemctl disable emacs
```

Other
```
systemctl start emacs
systemctl stop emacs
systemctl status emacs
```

[additional](https://www.emacswiki.org/emacs/EmacsAsDaemon#toc2)
