FROM node:alpine as build_phase
WORKDIR '/app'
COPY package.json .
RUN npm install
RUN npm install -g react-scripts
COPY ./ ./
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=build_phase /app/build /usr/share/nginx/html
