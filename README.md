# robot

## Creating an Ubuntu SSO Account

`Ed25519` keys are not supported by Ubuntu SSO currently. Generate an SSH key:

```
```

```bash
ssh-keygen -t rsa -b 4096 -f id_rsa_ubuntu -C $YOUR_COMMENT_HERE
```

## Installing Ubuntu Core on RPi

Instructions
[https://ubuntu.com/tutorials/how-to-install-ubuntu-core-on-raspberry-pi](https://ubuntu.com/tutorials/how-to-install-ubuntu-core-on-raspberry-pi)

## Classic environment on device

[Developing on device development](https://web.archive.org/web/20190421235427/https://developer.ubuntu.com/core/get-started/developer-setup)

```bash
snap install classic --edge --devmode
```

```bash
sudo classic
```

```bash
sudo apt update
sudo apt git
```
### Troubleshooting classic Ubuntu running on Ubuntu Core

- sudo: effective uid is not 0, is /usr/bin/sudo on a file system with the
  'nosuid' option set or an NFS file system without root privileges?
- [stackoverflowpost](https://askubuntu.com/questions/625540/suddenly-cant-run-sudo)
- Don't worry, you didn't mess up the entire permissions structure of the
  device, you probably just installed classic not as devmode.

## Using a Lima VM for local development (if you must)

The default lima VM is an Ubuntu Server VM. This is slightly different
than Ubuntu Core but offers similar functionality.

```bash
limactl start default
```

Edit the lima configuration file to use Focal Fossa (Ubuntu 20.04) instead of
the most recent version, since the ROS release we will be using targets focal.

```
images:
# Try to use release-yyyyMMdd image if available. Note that release-yyyyMMdd will be removed after several months.
- location: "https://cloud-images.ubuntu.com/releases/focal/release/ubuntu-20.04-server-cloudimg-amd64.img"
  arch: "x86_64"
  digest: "sha256:6e3ce31fe3a5523023650ba988c12d5fc2544bd0a95f435474841e2dec5836d9"
- location: "https://cloud-images.ubuntu.com/releases/focal/release/ubuntu-20.04-server-cloudimg-arm64.img"
  arch: "aarch64"
  digest: "sha256:ccc11e625acd878095f2eaa15541f4f788789ea964e3226b2511072b6718d455"
# Fallback to the latest release image.
# Hint: run `limactl prune` to invalidate the cache
- location: "https://cloud-images.ubuntu.com/releases/focal/release/ubuntu-20.04-server-cloudimg-amd64.img"
  arch: "x86_64"
- location: "https://cloud-images.ubuntu.com/releases/focal/release/ubuntu-20.04-server-cloudimg-arm64.img"
  arch: "aarch64"
```

Install python dependencies and setup ROS environment
```bash
source ./install-dev-environment.sh
```

### Building catkin packages

Inside the catkin workspace:

`catkin_make`

### SSH stuff

Adding a new ssh key to existing device. On your workstation run:

```
ssh-add ~/.ssh/path_to_existing_key
ssh-copy-id -f -i /path/to/public/key username@ip_address
```

Getting the host fingerprint. First ssh into the host. Then:

```
grep -n ssh_host /etc/ssh/sshd_config
ssh-keygen -l -f /etc/ssh/ssh_host_{rsa,ecdsa,ed25519}_key
```
