# uconf
## Description
uconf is personal setup script to for Ubuntu with the required software for me.
I just upped it here to have it quickly availible.
The generic.sh file can contain something intresting e.g. gcheckapt() which checks for already installed packages without just bruteforce installing them.

## How to start
Copy & Paste friendly version for terminal.
The loader copies all files to $HOME/uconf directory and than executes uconf.sh

```bash
v=$HOME/uconf;mkdir -p $v; wget -q --no-cache --no-cookies -O $v/loader.sh https://raw.githubusercontent.com/NaitWatch/uconf/main/loader.sh && bash $v/loader.sh
```
