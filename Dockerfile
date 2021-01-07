# build 영역
FROM node:alpine as builder
WORKDIR '/usr/src/app'
COPY package.json ./
RUN npm install
COPY ./ ./
RUN npm run build

FROM nginx 
EXPOSE 80
# build된 파일들을 nginx로 복사
# nginx port는 80
COPY --from=builder /usr/src/app/build /usr/share/nginx/html
