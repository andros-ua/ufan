# uFan
uFan — simple, script-based userspace fan control with multi-sensor thermal awareness.

## Installation

```shell
wget https://github.com/andros-ua/ufan/raw/refs/heads/main/usr/sbin/ufan -O /usr/sbin/ufan && chmod +x /usr/sbin/ufan
```
```shell
wget https://github.com/andros-ua/ufan/raw/refs/heads/main/etc/init.d/ufan -O /etc/init.d/ufan && chmod +x /etc/init.d/ufan
```
```shell
service ufan enable && service ufan start
```

## Prevent script files from being deleted during system upgrades
```shell
echo /usr/sbin/ufan >> /etc/sysupgrade.conf
```
```shell
echo /etc/init.d/ufan >> /etc/sysupgrade.conf
```
