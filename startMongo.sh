docker build -t shopify-nodejs . && \
docker network create shopify-network && \
mkdir -p /node-app/mongodb/db && \
docker run -d --network shopify-network -v /node-app/mongodb/db:/data/db mongo && \
docker run -p 9527:9527 --network shopify-network -d shopify-nodejs
