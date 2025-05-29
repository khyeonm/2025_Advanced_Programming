FROM python:3.10-slim

# 작업 디렉토리 설정
WORKDIR /app

# 로컬 requirements를 컨테이너로 복사, 의존성 설치
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# fastAPI 코드 전체 복사
COPY . .

# 포트 열기
EXPOSE 8000

# FastAPI 서버 실행
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
