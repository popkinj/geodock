# Geoserver Docker Image

## Building 
Run the build
```bash
docker build -t geodock:1.0 ./
```

## Running
```bash
docker run -d -p 8080:8080 --name geodock --env-file .env geodock:1.0
```
Point your browser to *http://localhost:8080/geoserver/web* and you should see the Geoserver welcome page

## Logging into container
```bash
docker exec -t -i geodock /bin/bash
```

## Stopping and cleaning up
```bash
docker stop geodock
docker system prune -a
```
