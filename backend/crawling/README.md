# 📌 Crawling
![Python](https://img.shields.io/badge/python-3.9%2B-blue)
![Selenium](https://img.shields.io/badge/Selenium-Automation-green?logo=selenium)

이 디렉토리는 외부 웹사이트에서 채용 공고 및 합격자 스펙 정보를 자동으로 수집하는 Selenium 기반 크롤러를 포함하고 있습니다. 수집된 데이터는 데이터베이스에 저장되어 백엔드 API와 연동됩니다. 

## 📁 크롤링 스크립트 구성
### 1. crawl_linkareer.py
- 크롤링 대상: Linkareer 사이트의 모집 공고 

- 기능 요약:
  - ‘대외활동 > 공모전’에 해당하는 모집 공고 리스트를 1~5페이지 범위 내에서 탐색
  - 각 공고의 회사명, 기업 형태, 모집 직무, 세부 직무, 자격 요건 등 정보를 추출
  
- 출력:
  linkareer_crawling.csv 파일로 저장 (utf-8-sig 인코딩)

### 2. crawl_jikhang.py
- 크롤링 대상: Zighang 사이트의 채용 공고

- 기능 요약:
  - 특정 직무 필터 (예: 서버·백엔드)를 선택해 채용 공고 페이지를 탐색
  - 각 공고의 회사명, 근무지, 학력, 경력, 우대사항, 자격요건, 공고 이미지 URL 등을 추출

- 출력:
  직행_크롤링_결과.xlsx 파일로 저장

---
## 🛠 실행 방법

1. 크롬 드라이버 설치 확인
- chromedriver는 현재 사용 중인 크롬 버전에 맞게 설치되어 있어야 합니다.
- 경로가 환경 변수에 등록되어 있어야 합니다.

2. Python 환경에서 필요한 패키지 설치:


<pre><code>
pip install selenium pandas openpyxl
</code></pre>

3. 실행 (예시):
 
<pre><code>
python crawl_linkareer.py
python crawl_jikhang.py
</code></pre>

## 📌 참고 사항
- 두 크롤러는 Selenium을 사용하여 실제 브라우저를 제어합니다. 실행 중 브라우저 창이 뜨고 자동으로 탐색됩니다.
- 수집된 데이터는 .csv 또는 .xlsx 형태로 저장되며, 이후 FastAPI 백엔드 서버를 통해 PostgreSQL에 업로드되어 사용됩니다.
- 각 크롤러는 특정 구조의 사이트를 대상으로 작성되었기 때문에, 사이트 구조가 변경되면 작동하지 않을 수 있습니다.

## 🧩 기능
본 크롤러에서 수집한 데이터는 PostgreSQL DB에 저장되며, 백엔드 API 서버(FastAPI)를 통해 프론트엔드에 제공됩니다.

---
- 작성 날짜: 2025-06-07 
- 최종 수정: 2025-06-11




