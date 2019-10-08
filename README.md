# flask-app
This is a simple Python Flask application which is a web service. The application will be installed in a Docker container, showing how to pass environment variables into the Docker runtime.

## To build and run
Build a Docker image by parsing Dockerfile in the current folder
```
[~/dev/flask-app] $ docker build -t chenchuk/flask-app:1.0 .
```
Start a Docker container from the built image,
```
[~/dev/flask-app] $ docker run -e TARGET_ENVIRONMENT=dev \
             --name flask-app -d -p 5000:5000 \
             chenchuk/flask-app:1.0
```
Check the web service
```
[~/dev/flask-app] $ curl http://localhost:5000/
{
  "containerId": "66bf2ff6c24b",
  "environment": "prod",
  "pythonVersion": "2.7.12"
```
## Development
Use the redeploy.sh script for development, it speeds up the development cycle with this procedure :

1. stop and delete a flask-app container if exists
2. builds a docker image (overrides)
3. start a container
4. test the container


## Example
Run the redeploy.sh script after modifying files
```
[~/dev/flask-app]  $ ./redeploy.sh prod
stopping container flask-app
flask-app
flask-app
66bf2ff6c24bebb87fc2f3df393688464b6b19ca35a066800e3f8e8bdbd1b11d
checking container web service at localhost:5000
{
  "containerId": "66bf2ff6c24b",
  "environment": "prod",
  "pythonVersion": "2.7.12"
}
```
Check the Docker daemon
```
[~/dev/flask-app]  $ docker ps
CONTAINER ID        IMAGE                    COMMAND             CREATED             STATUS              PORTS                    NAMES
66bf2ff6c24b        chenchuk/flask-app:1.0   "python app.py"     3 minutes ago       Up 3 minutes        0.0.0.0:5000->5000/tcp   flask-app

```

