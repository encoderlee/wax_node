Running a WAX node
===================

Requisites:
- Docker (configured to run without sudo)

Review _config.ini_ to adjust the configuration as needed (the provided example should be enough to run a full node with only the minimal plugins)
Use the nodeos script to launch a Docker container called 'nodeos', which is a full node, mounting the data directory, configuration file and genesis.json file.
```
$ ./nodeos.sh
```

Once nodeos is running you can use cleos.sh to validate everything is working as expected.
```
$ ./cleos.sh get info
```

—————————————————————————————————————————————————

article:

https://encoderlee.blog.csdn.net/article/details/122995747

1.install docker on ubuntu

```
sudo ./install_docker.sh
```

2.download latest snapshot

```
./download_snapshot.sh
```

3.start node from snapshot

```
sudo ./cleos.sh snapshot-xxxxxx.bin
```

4.wait until initialization is complete

5.stop node

```
sudo pkill nodeos
```

6.normal start node 

```
sudo ./cleos.sh
```

7.check node status

```
sudo ./cleos.sh --url http://localhost:8888 get info
```
