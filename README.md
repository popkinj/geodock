# Geoserver Docker Image

## Building 
Geoserver has a default password for the *admin* account of *geoserver*. This obviously needs to change. Pass in the new password with the *ADMIN_PASS* environment variable. Create a *.env* file containing something like this:
```
ADMIN_PASS=blah
```

Then run the build
```bash
docker build -t geodock:1.0 -e .env --build-arg ./
```

## Running
```bash
docker run -d -p 8080:8080 --name geodock geodock:1.0
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
