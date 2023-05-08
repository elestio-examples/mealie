cd docker;

# mv omni.Dockerfile Dockerfile
# mv frontend.Dockerfile frontend

# docker build . --tag elestio4test/mealie:latest
docker build --target production -f ./docker/omni.Dockerfile ../ --tag elestio4test/mealie:latest