# g4bnb Container
Get the repo and build the image with the Dockerfile. The container will have geant4, root, and dk2nu.

```
git clone https://github.com/marvlad/g4bnbContainer.git && cd g4bnbContainer
``` 

Build the Dockerfile

```
docker build -t al9g4bnb .
``` 

# Builded container
To pull directly the container use
```
docker pull mascencio/al9g4bnb
``` 
