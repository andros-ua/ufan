# uFan
uFan — script-based userspace fan control with multi-sensor thermal awareness.

## Installation

```shell
wget https://github.com/andros-ua/ufan/raw/refs/heads/main/usr/sbin/ufan \
-O /usr/sbin/ufan && \
chmod +x /usr/sbin/ufan

```
```shell
wget https://github.com/andros-ua/ufan/raw/refs/heads/main/etc/init.d/ufan \
-O /etc/init.d/ufan && \
chmod +x /etc/init.d/ufan

```
```shell
service ufan enable && service ufan start

```

### Prevent script files from being deleted during system upgrades
```shell
echo /usr/sbin/ufan >> /etc/sysupgrade.conf
echo /etc/init.d/ufan >> /etc/sysupgrade.conf

```

## (Optional) Fan monitoring
```shell
apk add luci-app-statistics
apk add collectd-mod-exec

```
```shell
cat >> /etc/collectd.conf << 'EOF'
LoadPlugin exec
<Plugin exec>
        Exec "nobody:nogroup" "/usr/share/collectd/pwmfan.sh"
</Plugin>
EOF
service collectd restart

```
```shell
wget https://github.com/andros-ua/ufan/raw/refs/heads/main/usr/share/collectd/pwmfan.sh \
-O /usr/share/collectd/pwmfan.sh && \
chmod +x /usr/share/collectd/pwmfan.sh

```
```shell
wget https://github.com/andros-ua/ufan/raw/refs/heads/main/www/luci-static/resources/statistics/rrdtool/definitions/exec.js \
-O /www/luci-static/resources/statistics/rrdtool/definitions/exec.js

```

### Prevent monitoring files from being deleted during system upgrades
```shell
echo /etc/collectd.conf >> /etc/sysupgrade.conf
echo /usr/share/collectd/pwmfan.sh >> /etc/sysupgrade.conf
echo /www/luci-static/resources/statistics/rrdtool/definitions/exec.js >> /etc/sysupgrade.conf

```
