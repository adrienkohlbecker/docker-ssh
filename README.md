# sftp

This image is not usable in your own environment, it uses settings specific for my server.


## Host keys

To generate the host keys, run:

```
ssh-keygen -t rsa -N "" -f /mnt/sftp/ssh/ssh_host_rsa_key
ssh-keygen -t ecdsa -N "" -f /mnt/sftp/ssh/ssh_host_ecdsa_key
ssh-keygen -t ed25519 -N "" -f /mnt/sftp/ssh/ssh_host_ed25519_key
```
