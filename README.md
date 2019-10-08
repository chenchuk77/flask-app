This is a simple app for introducing docker containers.

1. Build the image
```
$ docker build -t chenchuk/flask-app:1.0 .
```

2. Start a container from that image
```
$ docker run -e TARGET_ENVIRONMENT=dev --name flask-app -d -p 5000:5000 chenchuk/flask-app:1.0
```

3. Check service
```
$ curl http://localhost/
flask running on python 2.7.12 (default, Aug 22 2019, 16:36:40)
[GCC 5.4.0 20160609]
```

## use the redeploy.sh script for development, it speeds up the development cycle with this procedure :

1. stop and delete a flask-app container if exists
2. builds a docker image (overrides)
3. start a container
4. test the container


