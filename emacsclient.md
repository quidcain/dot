#Desktop Environment

Create emacsclient.desktop in ~/.local/share/applications with containing the following:

```
[Desktop Entry]
Name=Emacs (Client)
GenericName=Text Editor
Comment=Edit text
MimeType=text/english;text/plain;text/x-makefile;text/x-c++hdr;text/x-c++src;text/x-chdr;text/x-csrc;text/x-java;text/x-moc;text/x-pascal;text/x-tcl;text/x-tex;application/x-shellscript;text/x-c;text/x-c++;
Exec=emacsclient -a "emacs" %F
Icon=emacs
Type=Application
Terminal=false
Categories=Development;TextEditor;Utility;
StartupWMClass=Emacs
```
[source](https://www.emacswiki.org/emacs/EmacsClient#toc6)
