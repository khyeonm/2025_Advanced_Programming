# 🛠️ 백엔드 시스템 개요
이 디렉토리는 본 프로젝트의 백엔드 시스템을 포함하며, 다음과 같은 두 구성 요소로 이루어져 있습니다:

### 1. `api/` – FastAPI 서버
- 채용 정보 및 지원자 정보를 제공하는 REST API 구현
- PostgreSQL과 연동되어 데이터 저장 및 조회 처리
- `/docs` 경로에서 Swagger(OpenAPI) 문서 자동 생성

➡️ 자세한 내용은 [API/README.md](backend/API/README.md) 참고

### 2. `crawling/` – Selenium 크롤러
- 외부 사이트에서 자동으로 데이터를 수집
- 수집한 데이터를 데이터베이스로 저장 

➡️ 자세한 내용은 [crawling/README.md](backend/crawling/README.md) 참고

## 🌐 배포 및 연동 구조

본 프로젝트의 백엔드 시스템은 [![Railway](https://img.shields.io/badge/Deployed-Railway-purple?logo=railway)](https://railway.app)를 통해 배포되어 있으며, 다음과 같은 방식으로 구성되어 있습니다:

1. **크롤링 데이터 저장**
   - `crawling/` 폴더 내의 Selenium 기반 크롤러가 외부 웹사이트로부터 채용 데이터를 수집합니다.
   - 수집된 데이터는 PostgreSQL 데이터베이스에 저장됩니다.

2. **PostgreSQL 데이터베이스**
   - 이 데이터베이스는 Railway의 **클라우드 DB 서비스**를 사용하여 배포되었습니다.
   - 외부에서 접근 가능한 URI 및 인증 정보를 통해 FastAPI 서버와 연동됩니다.

3. **FastAPI 서버**
   - `api/` 폴더의 FastAPI 서버는 Railway에 배포되어 있으며,
   - 위의 PostgreSQL DB에 접근하여 클라이언트에게 데이터를 제공합니다.
   - RESTful API 엔드포인트 및 Swagger 문서(`/docs`)가 포함되어 있습니다.


📡 즉, 크롤러 → PostgreSQL → FastAPI API 서버가 모두 Railway 상에서 호스팅되어 있으며, 완전한 백엔드 시스템이 클라우드 상에서 실시간 동작 중입니다.

---
- 작성 날짜: 2025-06-07
- 최종 수정: 2025-06-07
