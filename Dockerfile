FROM node:alpine
WORKDIR '/app'
COPY package*.json .
RUN npm install
COPY . .
RUN npm run build
 
FROM nginx
EXPOSE 80
# Copy build directory from node container to nginx container
# We only need the build directory to run nginx
COPY --from=0 /app/build /usr/share/nginx/html
