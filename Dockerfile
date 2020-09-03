FROM ubuntu:18.04
LABEL Owner="hameed"
LABEL Email="syed.hameed.uddin@gmail.com"
RUN apt update &&\
    apt install curl wget nano -y &&\
    apt install nginx -y &&\
    apt install iputils-ping -y &&\
    useradd appuser
WORKDIR  /myapp
EXPOSE 80 8000 9000
#COPY script.sh  /myapp 
RUN chmod -R 777 /myapp
#USER appuser
ADD https://github.com/hamsyed/myapp.git  /myapp
#to start nginx use below but make sure CMD /bin/bash /myapp/script.sh is COMMENTED              
ENTRYPOINT ["nginx", "-g", "daemon off;"]
#CMD bash /myapp/script.sh  
