## tagspaces [![build status](https://img.shields.io/docker/build/ffflorian/tagspaces.svg)](https://hub.docker.com/r/ffflorian/tagspaces/)

Docker Container build from [tagspaces](https://github.com/tagspaces/tagspaces) v3.1.1.

Docker Hub: https://hub.docker.com/r/ffflorian/tagspaces/

### Usage

```
docker run --restart=unless-stopped -it -d \
           --name "tagspaces" \
           -p 3000:3000 \
           -v /opt/tagspaces:/tagspaces \
           -t ffflorian/tagspaces:latest
```

### Testing without permanent data volume

```
docker run --restart=unless-stopped -it -d \
           --name "tagspaces" \
           -p 3000:3000 \
           -t ffflorian/tagspaces:latest
```
