# utruscripts

### A set of modular cripts to setup a machine for utrumque work

Go to the `utruscripts` folder and start with running your **personal setup script**. This script starts with `apt update` and `apt upgrade`.

`sh setup-ludvig.sh`

or

`sh setup-gerhard.sh`

Then run the following **scripts in any order**:

```
sh setup-ssh.sh
sh setup-audio-tools.sh
sh setup-reaper.sh
sh setup-supercollider.sh
sh setup-utrumque-tools.sh
sh setup-dropbox.sh
```

Run the following script as the last one, since a **reboot** is required afterwards:

```
sh setup-audio.sh
reboot
```

After the reboot run this script to **check** if your audio configuration is OK:

`sh check-audio-setup.sh`

