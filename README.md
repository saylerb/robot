# robot

## Creating an Ubuntu SSO Account

`Ed25519` keys are not supported by Ubuntu SSO currently. Generate an SSH key:

```
ssh-keygen -t rsa -b 4096 -f id_rsa_ubuntu -C $YOUR_COMMENT_HERE
```

## Installing Ubuntu Core on RPi

Instructions
[https://ubuntu.com/tutorials/how-to-install-ubuntu-core-on-raspberry-pi](https://ubuntu.com/tutorials/how-to-install-ubuntu-core-on-raspberry-pi)

### Classic environment on device

[Developing on device development](https://web.archive.org/web/20190421235427/https://developer.ubuntu.com/core/get-started/developer-setup)

```
snap install classic --edge --devmode
```

```
sudo classic
```

```
sudo apt update
sudo apt git
```

### Troubleshooting

- sudo: effective uid is not 0, is /usr/bin/sudo on a file system with the
  'nosuid' option set or an NFS file system without root privileges?
- [stackoverflowpost](https://askubuntu.com/questions/625540/suddenly-cant-run-sudo)
- Don't worry, you didn't mess up the entire permissions structure of the
  device, you probably just installed classic not as devmode. 
