MISP helm chart
===============

Based on the implementation from: https://github.com/jaredjennings/helm-misp

Uses the official MISP project docker images: https://github.com/MISP/misp-docker

   * Deploy MISP for Kubernetes
   * Deploy MISP modules
   * Deploy MySQL
   * Deploy Redis

This requires the following steps to create gpg secrets for MISP:

```
pwgen -s 32
kubectl create secret -n misp generic --from-literal='passphrase=<PASSPHRASE>' misp-gnupg-passphrase
cd /tmp
mkdir mgpgh
gpg --homedir=mgpgh --gen-key
# ^^ when you are generating the key you say what email address it is for
mkdir mgpghs
gpg --homedir=mgpgh --export-secret-keys -a -o mgpghs/gnupg-private-key
kubectl create secret -n misp generic --from-file=mgpghs misp-gnupg-private-key
rm -rf mgpgh mgpghs
```
