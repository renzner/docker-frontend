# Build Phase
FROM node:alpine as builder

WORKDIR '/home/frontend'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Run Phase
FROM nginx
COPY --from=builder /home/frontend/build /usr/share/nginx/html
