# Spectrackr API 사용자 가이드 

![Python](https://img.shields.io/badge/python-3.9%2B-blue?logo=python)
![Uvicorn](https://img.shields.io/badge/Uvicorn-ASGI--Server-blue?logo=python)
![FastAPI](https://img.shields.io/badge/Backend-FastAPI-009688?logo=fastapi)
![Swagger](https://img.shields.io/badge/Docs-Swagger-green?logo=swagger)
![Railway](https://img.shields.io/badge/Deployed-Railway-purple?logo=railway)
![PostgreSQL](https://img.shields.io/badge/DB-PostgreSQL-336791?logo=postgresql&logoColor=white)
![Status](https://img.shields.io/badge/Status-Active-brightgreen)

### Base URL:

https://2025advancedprogramming-production.up.railway.app/docs

---
**Spectrackr API**는 채용 정보와 지원자 정보를 조회하는 FastAPI 기반 백엔드입니다.

요청은 POST/GET 방식이며, JSON 형태의 request body를 사용합니다.

# 사용 가능한 API 목록:

## 회사 기준 검색
#### 1. `/get-company-name-and-detail-job`
- Method: POST
- 설명: 드롭다운을 위해 직무 카테고리에 해당하는 회사명과 세부 직무 목록을 조회합니다.
- Request Body:
```json
  {
    "job_category": "IT/인터넷"
  }
```
- Response:
```json
  [
    {
      "company_name": "KT",
      "detail_job": "서버·백엔드"
    },
    {
      "company_name": "쿠팡",
      "detail_job": "서버·백엔드"
    },
    ...
  ]
```

#### 2. `/get-detail-job-by-company-name`
- Method: POST
- 설명: 드롭다운을 위해 회사 이름에 해당하는 세부 직무 목록을 조회합니다.
- Request Body:
```json
  {
    "company_name": "KT"
  }
```
- Response:
```json
  [
    {
      "detail_job": "서버·백엔드"
    },
    {
      "detail_job": "LLM"
    },
    ...
  ]
```

#### 3. `/get-company-name-by-detail-job`
- Method: POST
- 설명: 드롭다운을 위해 세부 직무에 해당하는 회사명을 조회합니다.
- Request Body:
```json
  {
    "detail_job": "LLM"
  }
```
- Response:
```json
  [
    {
      "company_name": "KT"
    },
    {
      "company_name": "네이버"
    },
    ...
  ]
```

#### 4. `/get-job-posting`
- Method: POST
- 설명: 회사, 직무, 카테고리에 해당하는 채용 상세 정보를 조회합니다.
- Request Body:
```json
  {
    "job_category": "IT/인터넷",
    "company_name": "KT",
    "detail_job": "서버·백엔드"
  }
```
- Response:
```json
  [
    {
      "company_type": "",
      "main_job": "",
      "location": "서울, 경기",
      "education_level": "학사",
      "major": "",
      "experience": "3~5년차, 10년차",
      "language_requirement": "",
      "military_requirement": "",
      "overseas_available": "",
      "etc_requirements": "",
      "process": "",
      "image": "https://d2juy7qzamcf56.cloudfront.net/2025-05-26/d4a3fdd4-7136-4d64-b397-b37f2b62614f.png"
    }
  ]
```


## 스펙 기준 검색
#### 5. `/get-applicants-by-company-detail-job`
- Method: POST
- 설명: 회사와 세부 직무에 해당하는 합격자 목록을 조회합니다.
- Request Body:
```json
  {
    "company": "삼성증권",
    "detail_job": "IT 일반"
  }
```
- Response:
```json
  [
    {
      "id": 3,
      "company": "삼성증권",
      "detail_job": "IT 일반",
      "job_title": null,
      "apply_term": "2024 하반기",
      "university": "홍익대학교",
      "major": "컴퓨터공학과",
      "gpa": 3.77,
      "gpa_scale": 4.5,
      "toeic": 865,
      "opic": "IH",
      "toeic_speaking": null,
      "work_experience": null,
      "job_category": "IT/인터넷"
    }
  ]
```



#### 6. `/get-company-by-detail-job`
- Method: POST
- 설명: 드롭다운을 위한 세부 직무로 구분한 회사 목록을 조회합니다.
- Request Body:
```json
  {
    "detail_job": "IT 일반"
  }
```
- Response:
```json
  [
    {
      "company": "KB부동산신탁"
    },
    {
      "company": "현대 글로비스"
    },
    ...
  ]
```


#### 7. `/get-detail-job-by-company`
- Method: POST
- 설명: 특정 회사에 지원한 직무 목록 조회
- Request Body:
```json
  {
    "company": "네이버"
  }
```
- Response:
```json
  [
    {
      "detail_job": "기술연구소/센터"
    }
  ]
```


#### 8. `/get-all-universities`
- Method: GET
- 설명: 드롭다운을 위해 모든 지원자의 대학교 목록을 반환합니다.
- Response:
```json
  [
    "지방거주 사립대",
    "영남대학교",
    ...
  ]
```


#### 9. `/get-applicants-by-school`
- Method: POST
- 설명: 특정 대학교 출신 지원자들이 지원한 회사 및 직무를 조회합니다.
- Request Body:
```json
  {
    "university": "부산대학교"
  }
```
- Response:
```json
  [
    {
      "company": "기아",
      "detail_job": "생산관리"
    },
    {
      "company": "기아",
      "detail_job": "생산기술"
    },
    ...
  ]
```


## default
#### 10. `/` (루트)
- Method: GET
- 설명: 서버 상태 확인용 엔드포인트입니다.
- Response:
```json
  {
    "message": "Spectrackr API is live!"
  }
```


오류 코드 안내:
===============
| 오류 코드                | 설명                                   |
|-----------------------|--------------------------------------|
| `200` | OK: 요청 성공                |
| `422` | Validation Error: Pydantic 유효성 검사 실패                |
| `400`     |  Bad Request: 잘못된 요청 데이터                   |
| `404`    | Not Found: 데이터 없음                 |
| `500`      | Internal Server Error: 서버 에러             |



주의사항:
=========
- 모든 POST 요청은 JSON 형식의 Body를 포함해야 합니다.
- 응답 데이터는 대부분 리스트 형식이며, 하나의 JSON 객체로 구성된 항목들이 포함됩니다.

---
- 작성 날짜: 2025-06-05
- 최종 수정: 2025-06-07
