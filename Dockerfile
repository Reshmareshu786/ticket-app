FROM node:18.20.8-alpine AS builder
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install
COPY  . .
RUN npm run build

# Runtime

FROM node:18.20.8-alpine 
WORKDIR /app
COPY --from=builder /app ./
EXPOSE 3000
CMD ["npm","run","dev"]
