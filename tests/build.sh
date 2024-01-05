# pwd=$(pwd)

# mv $pwd/docker/omni.Dockerfile $pwd/Dockerfile
cp -f ./docker/Dockerfile ./

docker buildx build . --output type=docker,name=elestio4test/mealie:latest | docker load

# docker build . --tag elestio4test/mealie:latest