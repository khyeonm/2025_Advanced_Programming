# Node.js 18 이미지에서 React 앱을 빌드
FROM node:18 as build
# 의존성 설치 후 앱 코드 복사 후 npm run build로 정적 파일 생성
WORKDIR /app

# 환경변수 파일 복사
COPY .env.production .env

# 의존성 설치
COPY package*.json ./
RUN npm install
# 앱 소스 복사
COPY public ./public
COPY src ./src

# 빌드
RUN npm run build

# Nginx를 이용해 빌드된 정적 파일을 /usr/share/nginx/html로
FROM nginx:alpine
COPY nginx/default.conf /etc/nginx/conf.d/default.conf
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]