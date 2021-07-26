## NOTE
Ensure you create CentOS containers with privilege and map /run and /sys/fs/cgroup else you will get a D-Bus error

```
docker run -d --privilege -v /run -v /sys/fs/cgroup:/sys/fs/cgroup:ro gayatrisa/mycentos:7-ssh-no-supervisord
```
