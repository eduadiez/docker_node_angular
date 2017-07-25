# docker_node_angular
Docker with node &amp; angularjs
Build:
```
sudo docker build -t eduadiez/node_angular --build-arg password=<secret> .
```
Run:
```
sudo docker run -d --rm --name angular -v client:/usr/src/app/client -p 22:22 -p 80:80 eduadiez/node_angular
```

References:

https://github.com/dciccale/docker-angular-tutum
