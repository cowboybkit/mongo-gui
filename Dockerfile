# Definindo a imagem base
FROM node:lts-stretch

COPY . /app

WORKDIR /app

RUN npm install
RUN cd client && npm install
RUN npm run build-ui

# HEALTHCHECK --interval=10s CMD curl --fail http://localhost:4321 || exit 1

ENTRYPOINT ["sh","/app/entrypoint.sh"]

#custombuild