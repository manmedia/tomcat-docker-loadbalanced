How to Build:

1) Download the source.
2) Build the image using Dockerfile and cache it in your repo (note the dot below, you need to be in the root directory):
   docker build -t tomcat_single:8.5.32-jre8-slim .
3) Create an overlay network 
   docker network create --attachable -d overlay my-overlay-network


SPIN UP A SINGLE CONTAINER

a) docker run --rm -tid --network=my-overlay-network -p 80:8080 --name my-tomcat-1 tomcat_single:8.5.32-jre8-slim
b) Confirm that the logs are coming with no errors:
   docker logs my-tomcat-1
c) Navigate to welcome page to see hostname and time information:
   localhost/welcome.jsp
   

COMPOSE A SERVICE STACK

Pre requisite

a) Stop and remove all containes created previously - using docker rm -f <container_id/container_name>
b) Browse to source folder.
c) Compose a service (you should have docker-compose installed beforehand)
   docker stack deploy -c docker-compose.yml mytomcat_loadbalanced
   
   The above will create a network and service to have 3 tomcat containers running. You can check the status by typing:
   docker service ls
   
   The output will be something similar:
   
ID             NAME                        MODE         REPLICAS     IMAGE                            PORTS
o9scx60jon19   mytomcat_loadbalanced_web   replicated   3/3          tomcat_single:8.5.32-jre8-slim      *:80->8080/tcp

And use 2/3 different browser windows to hit localhost/welcome.jsp to see that they are being loadbalanced to different hosts.
