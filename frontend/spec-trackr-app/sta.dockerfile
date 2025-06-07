FROM node:18-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
ENV HOST=0.0.0.0 BROWSER=none PORT=3001
EXPOSE 3001
CMD ["npm", "start"]
