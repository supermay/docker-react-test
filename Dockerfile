FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .

RUN npm run build


FROM nginx

# refer to the builder phase what file need to be copied to where
COPY --from=builder /app/build /usr/share/nginx/html

# for nginx container, nginx takes care of the command for us