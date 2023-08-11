FROM node:14-alpine

MAINTAINER "Manojvv" "manojv@ilimi.in"

USER 0

COPY src /opt/content/

WORKDIR /opt/content/

RUN npm install

 

FROM node:14-slim

MAINTAINER "Manojvv" "manojv@ilimi.in"

RUN  useradd -m sunbird

USER sunbird

COPY --from=0 --chown=sunbird /opt/content /home/sunbird/mw/content

WORKDIR /home/sunbird/mw/content/

CMD ["node", "app.js", "&"]