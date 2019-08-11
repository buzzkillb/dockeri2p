Playing with I2P  

```
docker build -t i2p .
```
docker-compose.yml
```
version: '3.2'

services:

  i2p:
    image: i2p:latest
    container_name: I2P
    network_mode: "host"
#    ports:
#      - "4444:4444"
#      - "6668:6668"
#      - "7657:7657"
#      - "7656:7656"
    volumes:
      - ${HOME}/i2p/:/data/.i2p
```
