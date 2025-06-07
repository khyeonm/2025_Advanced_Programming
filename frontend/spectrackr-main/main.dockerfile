FROM node:18-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
ENV HOST=0.0.0.0 PORT=3003
EXPOSE 3003
CMD ["npm", "run", "dev"]
