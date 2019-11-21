# Dockerfiles

## n2n usage
n2n has three version: ntop-stable,ntop-nightly,meyerd-v2s.
### ntop-stable
```shell
docker run -d --privileged --net=host --name supernode-stable sukeyisme/n2n:stable supernode -l <port> -f
docker run -d --privileged --net=host --name edge-stable sukeyisme/n2n:stable edge -d n2n0  -a <lan-ip> -c <lan-name> -k <lan-key> -l <supernode-ip>:<port> -f
```
### ntop-nightly
```shell
docker run -d --privileged --net=host --name supernode-stable sukeyisme/n2n:nightly supernode -l <port> -f
docker run -d --privileged --net=host --name edge-stable sukeyisme/n2n:nightly edge -d n2n0  -a <lan-ip> -c <lan-name> -k <lan-key> -l <supernode-ip>:<port> -f
```
### meyerd-v2s
```shell
docker run -d --privileged --net=host --name supernode-stable sukeyisme/n2n:meyerd-v2s supernodev2s -l <port> -f
docker run -d --privileged --net=host --name edge-stable sukeyisme/n2n:meyerd-v2s edgev2s -d n2n0  -a <lan-ip> -c <lan-name> -k <lan-key> -l <supernode-ip>:<port> -f
```
