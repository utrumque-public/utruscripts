# utruscripts

Scripts to setup a machine for utrumque work

Start with running the git setup:

`setup-git-ludvig.sh`

or

`setup-git-gerhard.sh`

Then run the following scripts in any sqeuence:

```
setup-ssh.sh
setup-audio-tools.sh
setup-reaper.sh
setup-supercollider.sh
setup-utruware.sh
setup-dropbox.sh
```

Run this one as last script, as a reboot is required afterwards

```
setup-audio.sh
reboot
```

After the reboot run:

`check-audio-setup.sh`

