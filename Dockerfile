FROM node:12-alpine as build-stage
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install
COPY babel.config.js vue.config.js ./
COPY src ./src
COPY public ./public
RUN npm run build

FROM uhziel/yireader-api as production-stage
COPY --from=build-stage /app/dist ./dist