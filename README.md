Running a WAX node
===================

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
sudo ./nodeos.sh snapshot-xxxxxx.bin
```

4.wait until initialization is complete

5.stop node

```
sudo pkill nodeos
```

6.normal start node 

```
sudo ./nodeos.sh
```

7.check node status

```
sudo ./cleos.sh --url http://localhost:8888 get info
```
