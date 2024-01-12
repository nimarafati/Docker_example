# Dockerfile or Build Script

Build a Docker image with the specified tags (-t) and using the current directory as the build context (.)  
```docker build -t nimarafati/shiny-NNN:v1.0 -t nimarafati/shiny-NNN:latest .```

List Docker images available on the local machine  
```docker images```

Push the Docker image with the v1.0 tag to the specified Docker Hub repository  
```docker push nimarafati/shiny-NNN:v1.0```

Push the Docker image with the latest tag to the specified Docker Hub repository  
```docker push nimarafati/shiny-NNN:latest```
