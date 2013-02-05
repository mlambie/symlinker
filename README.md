symlinker
=========

Dynamically link matching directories and files.

When integrating with Samba for XBMC, ensure you have the following flags set in your global configuration:

    [global]
      follow symlinks = yes
      wide links = yes
      unix extensions = no
