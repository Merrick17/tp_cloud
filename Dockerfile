FROM node:8-stretch

WORKDIR "/app"

RUN apt-get update \ 
&& apt-get dist-upgrade -y \ 
&& apt-get clean \
 && echo 'Finished installing dependencies'

COPY package.json /app/ 
RUN cd /app; npm i 

COPY . /app 
ENV NODE_ENV production 

ENV PORT 3000

CMD ["npm","start"]