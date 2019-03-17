## tagspaces [![build status](https://img.shields.io/docker/build/ffflorian/tagspaces.svg)](https://hub.docker.com/r/ffflorian/tagspaces/)

Docker Container build from https://github.com/tagspaces/tagspaces

Docker Hub: https://hub.docker.com/r/ffflorian/tagspaces/

### Testing without permanent Data Volume

```
docker run --restart=unless-stopped -it -d \
           --name "tagspaces" \
           -p 3000:3000 \
           -t ffflorian/tagspaces:latest
```

### Starting
```
docker run --restart=unless-stopped -it -d \
           --name "tagspaces" \
           -p 3000:3000 \
           -v /opt/tagspaces:/tagspaces \
           -t ffflorian/tagspaces:latest
```
