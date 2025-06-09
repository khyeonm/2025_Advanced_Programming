FROM node:18-alpine

# 작업 디렉토리를 /app으로 설정
WORKDIR /app
COPY .env.production .env

# package.json과 package-lock.json 파일을 컨테이너로 복사
COPY package*.json ./

# 의존성 설치
RUN npm install

# 모든 파일을 컨테이너로 복사
COPY . .

# 환경 변수 설정: 브라우저 자동 실행 방지
ENV HOST=0.0.0.0 BROWSER=none PORT=3001

# 컨테이너 외부에 노출할 포트 지정
EXPOSE 3001

# 서버 실행
CMD ["npm", "start"]
