pwd=$(pwd)

mv $pwd/docker/omni.Dockerfile $pwd/Dockerfile

docker build . --tag elestio4test/mealie:latest