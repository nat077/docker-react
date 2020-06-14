FROM  node:alpine as builder
WORKDIR '/usr/app/frontend'
COPY package.json .
RUN npm install
copy ./ ./
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /usr/app/frontend/build /usr/share/nginx/html
