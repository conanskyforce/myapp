FROM node:12.16.1

LABEL project = 'conan - shopify app'


# 创建工作目录
RUN rm -rf /node-app/shopify
RUN mkdir -p /node-app/shopify
WORKDIR /node-app/shopify

# 安装项目依赖
COPY . /node-app/shopify
RUN npm install
RUN npm run build
RUN mv ./dist/* ./

# 对外暴露端口
EXPOSE 3600

# 启动 Image 时执行命令
CMD BUILD_ENV=docker NODE_ENV=production node server/server.js