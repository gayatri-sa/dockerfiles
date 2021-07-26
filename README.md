## Ensure you create CentOS containers with privilege
https://forums.docker.com/t/systemctl-status-is-not-working-in-my-docker-container/9075/4

Ensure you create CentOS containers with privilege and map /run and /sys/fs/cgroup else you will get a D-Bus error
```
docker run -itd --privileged -v /run -v /sys/fs/cgroup:/sys/fs/cgroup:ro --name=yourName <image name>
```
