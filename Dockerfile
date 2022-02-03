# Build Phase
FROM node:16-alpine as builder
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Run Phase
FROM nginx:1.21.6-alpine
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html