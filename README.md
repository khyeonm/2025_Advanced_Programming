# 2025_Advanced_Programming

<h1 align="center"> Spec-Trackr </h1>

<div align="center">
<a href="https://github.com/khyeonm/2025_Advanced_Programming/stargazers"><img src="https://img.shields.io/github/stars/khyeonm/2025_Advanced_Programming" alt="Stars Badge"/></a>
<a href="https://github.com/khyeonm/2025_Advanced_Programming/network/members"><img src="https://img.shields.io/github/forks/khyeonm/2025_Advanced_Programming" alt="Forks Badge"/></a>
<a href="https://github.com/khyeonm/2025_Advanced_Programming/pulls"><img src="https://img.shields.io/github/issues-pr/khyeonm/2025_Advanced_Programming" alt="Pull Requests Badge"/></a>
<a href="https://github.com/khyeonm/2025_Advanced_Programming/discussions"><img src="https://img.shields.io/github/discussions/khyeonm/2025_Advanced_Programming" alt="Discussions Badge"/></a>
<a href="https://github.com/khyeonm/2025_Advanced_Programming/graphs/contributors"><img alt="GitHub contributors" src="https://img.shields.io/github/contributors/khyeonm/2025_Advanced_Programming?color=2b9348"></a>
<br>
<img src="https://img.shields.io/badge/Backend-FastAPI%20%26%20Swagger-green" alt="Backend Badge"/>
<img src="https://img.shields.io/badge/Frontend-React%20%26%20Tableau-blue" alt="Frontend Badge"/>
<img src="https://img.shields.io/badge/Database-PostgreSQL-lightgrey" alt="DB Badge"/>
<img src="https://img.shields.io/badge/DevOps-GitHub%20%26%20Docker-blueviolet" alt="DevOps Badge"/>
<img src="https://img.shields.io/badge/License-MIT-yellow.svg" alt="MIT License"/>
</div>
<br>

<!-- sheilds: https://shields.io/ -->
<!-- hits badge: https://hits.seeyoufarm.com/ -->

우리는 의생명융합공학부 학생들의 진로 탐색을 돕기 위해 모였습니다.
다양한 분야로의 진출 가능성을 연결하고, 채용 정보와 직무별 필수 역량을 한눈에 볼 수 있도록 지원하는 플랫폼을 만들고 있습니다.
직무 정보 통합, 스펙 사례 제공, 맞춤형 탐색 기능을 통해 학생들이 자신만의 길을 준비할 수 있도록 함께합니다.
열린 협업과 혁신을 통해 모두의 가능성을 넓혀갑니다!


## 🌟 프로젝트 배경 (Project Background)
_"의생명융합공학부 학생들의 진로 고민, 우리가 돕겠습니다."_
- 의생명융합공학부 학생들은 다양한 분야를 학습했지만, 진로 선택과 준비에 막막함을 느끼고 있음
- 데이터 분석, 인공지능, 의료공학 등 폭넓은 진출 가능성에도 불구하고, 구체적인 직무/산업 정보 탐색에 어려움 존재
- 채용 정보가 링크드인, 원티드, 사람인 등 여러 사이트에 흩어져 있어 비교·분석이 번거로움
- 각 직무별로 필수적으로 요구되는 공통 역량이 존재하지만, 이를 체계적으로 파악할 수 있는 지원 체계 부족
- 의생명융합공학부 고학년 학생들이 직접 겪은 진로 정보 부족 문제를 해결하고자 플랫폼 기획

## 🌟 프로젝트 목표 (Project Vision)
_"폭넓은 가능성 속에서, 각자의 길을 찾고 준비할 수 있도록 함께합니다."_
- 의생명융합공학부 학생 맞춤형 직무/산업 정보 제공
- 다양한 취업 사이트의 채용공고 통합 제공
- 직무별 공통 필수 역량 도출 및 시각화
- 실제 합격자 자소서, 스펙 사례 기반 현실적 준비 방법 제시
- 관심 직무 기반 맞춤형 정보 탐색 기능 제공

## 🧩 주요 기능 (Key Features)
### 🖥️ 프론트엔드 기능
[프론트엔드 README](./frontend/README.md)

### 🛠️ 백엔드 기능
[백엔드 README](./backend/README.md)

## 🧰 기술 스택
| 구분      | 기술                  |
|-----------|-----------------------|
| Backend   | Swagger, FastAPI      |
| Frontend  | React, Tableau        |
| DB        | PostgreSQL            |
| DevOps    | GitHub, Docker        |

## 🚀 사용자 가이드
```bash
# docker 사용가능 환경에서 실행
# 2025_Advanced_Programming 디렉토리에서 아래 명령어 실행
docker compose up --build
# 브라우저에서 아래 URL 접속
http://localhost:3003
```
### 💡 문제 해결
- 브라우저에 접속 시 화면이 뜨지 않는 경우
    - VSCode의 Ports에 3001를 추가한 후 URL 재접속

- 이미 사용중인 포트번호인 경우
    - ./frontend/spec-trackr-app/sp_com.jsx와 com_sp.jsx, ./frontend/spectrackr-main/main.dockerfile에서 3003을 검색하여 다른 포트 번호로 변경
    - ./frontend/spectrackr-main/app/page.tsx 와 ./frontend/spec-trackr-app/sta.dockerfile에서 3001을 검색하여 다른 포트 번호로 변경

## 🧑 팀 소개 (Team)

| 역할          | 이름 |  기술 스택 배지                         |                           
|---------------|------|---------------------------------------------------------------------------------------------------------------|
| **백엔드** | [서호영]( ) | ![Python](https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54) ![PostgreSQL](https://img.shields.io/badge/PostgreSQL-4169E1?style=for-the-badge&logo=postgresql&logoColor=white) ![Tableau](https://img.shields.io/badge/Tableau-E97627?style=for-the-badge&logo=tableau&logoColor=white) ![React](https://img.shields.io/badge/React-20232A?style=for-the-badge&logo=react&logoColor=61DAFB) |
| **프론트엔드** | [김예준](https://www.linkedin.com/in/ye-jun-kim-yerdy) | ![Python](https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54)   <img src="https://img.shields.io/badge/react-61DAFB?style=for-the-badge&logo=react&logoColor=black">  |
| **백엔드** | [이해인]( ) | ![Python](https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54)  ![PostgreSQL](https://img.shields.io/badge/PostgreSQL-4169E1?style=for-the-badge&logo=postgresql&logoColor=white) |
| **프론트엔드** | [김현민]( ) | ![Python](https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54)   <img src="https://img.shields.io/badge/react-61DAFB?style=for-the-badge&logo=react&logoColor=black"> 
  |



## 🚀 프로젝트 로드맵 (Project Roadmap) 
```mermaid
gantt
    title 2025 고급 프로그래밍 프로젝트 여정

    section 핵심 마일스톤
    프로젝트 진행 :a1, 2025-04-24, 48d
    
    section 새부 활동
    주제 설정 및 역할 분담 :2025-04-24, 6d
    API 데이터 전처리 및 구현 기능 설정 :2025-04-24, 20d
    웹 페이지 화면 구성 및 데이터 베이스 설계 :2025-05-07, 21d
    백엔드 - 프론트엔드 연결 :2025-05-21, 14d
    추가 기능 재검토 및 마무리 :2025-05-28, 14d

```

## 💻 주차별 활동 (Activity History)

| 날짜 | 내용 | 발표자 | 발표자료 |
| -------- | -------- | ---- | --- | 
| 2025/04/30 | 프로젝트 소개 | 서호영 | [25/04/30](https://pusanackr-my.sharepoint.com/:p:/g/personal/haein1012_pusan_ac_kr/EaLw18OsvHxErTauA2G-gqMBW8-u26Zwrk3SYRkAFCfdXQ?e=Tsu63M)|
| 2025/05/07 | 2주차  | 김현민 |  [25/05/07](https://pusanackr-my.sharepoint.com/:p:/g/personal/haein1012_pusan_ac_kr/Ea4hJRmxTi5DgY5dMcaGs3QBbcgjHheu53vweCHI4rydRQ) |
| 2025/05/14 | - | - |  - |
| 2025/05/21 | - | - | -  |
| 2025/05/28 | 3-5주차 | 김예준 | [25/05/28](https://pusanackr-my.sharepoint.com/:p:/g/personal/haein1012_pusan_ac_kr/EeO-PUyPaddDrsQ9LwEOr8cBUkAVRRCymfRxqk8n6lNB0Q?e=IcFPFO) |
| 2025/06/04 | 6주차 | 이해인 | [25/06/04](https://pusanackr-my.sharepoint.com/:p:/g/personal/haein1012_pusan_ac_kr/Ebd1e-u86-hMo0Rop_Lx58sBEUq8yqvExVrlr6g5aHqFhQ?e=wL39gb) |
| 2025/06/11 | 7주차 | 김예준 | [25/06/11](https://pusanackr-my.sharepoint.com/:p:/g/personal/haein1012_pusan_ac_kr/EdkOcZ0_D-tIvy0LHfwmfDQBFU0I2JkaxQRa2o8Jm3kS9w?rtime=UAPnyxum3Ug) |


<h2>Contributors 😃</h2>
<a href="https://github.com/khyeonm/2025_Advanced_Programming/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=khyeonm/2025_Advanced_Programming" />
</a>
<br><br>

<h2>License 🗞</h2>

This project is licensed under the [MIT License](https://opensource.org/licenses/MIT).
