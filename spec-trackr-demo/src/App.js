import React, { useState } from 'react';

const cardStyle = {
  flex: 1,
  border: '1px solid #ddd',
  borderRadius: '10px',
  padding: '20px',
  boxShadow: '0 4px 8px rgba(0,0,0,0.1)',
  backgroundColor: '#fff',
  transition: 'transform 0.2s',
};

const cardContainerStyle = {
  display: 'flex',
  gap: '20px',
  marginTop: '20px',
};

function App() {
  const [activeTab, setActiveTab] = useState('spec'); // 'spec' or 'company'
  const [selectedCompany, setSelectedCompany] = useState('');
  const [selectedJob, setSelectedJob] = useState('');
  const [companySubTab, setCompanySubTab] = useState('certification'); // 'certification' or 'recruit'

  const handleCompanySelect = (e) => {
    setSelectedCompany(e.target.value);
    setSelectedJob('');
    setCompanySubTab('certification');
  };

  const handleJobSelect = (e) => {
    setSelectedJob(e.target.value);
  };

  const specData = {
    data: {
      mySpec: ['SQLD 자격증', 'Python 사용 경험', '데이터 분석 프로젝트 2개'],
      othersSpec: ['SQLD + ADsP 자격증', 'Python, R 사용', '대회 수상 경험'],
      recommendedCompanies: ['카카오엔터프라이즈', '삼성SDS', 'NHN 데이터']
    },
    frontend: {
      mySpec: ['React.js 경험', 'HTML/CSS 마스터', '팀 프로젝트 경험'],
      othersSpec: ['React + Vue.js 경험', 'Sass, Styled Components 사용', '대규모 프로젝트 참여'],
      recommendedCompanies: ['네이버', '라인플러스', '토스']
    },
    backend: {
      mySpec: ['Node.js 서버 개발 경험', 'DB 설계 경험', 'AWS 기본 지식'],
      othersSpec: ['Node + Spring Boot 경험', 'MySQL + Redis 사용 경험', '배포 경험 필수'],
      recommendedCompanies: ['쿠팡', '배달의민족', '야놀자']
    }
  };

  const companyRecruit = {
    naver: {
      position: '프론트엔드 개발자',
      requirements: ['React 사용 경험', 'UI/UX 감각', '팀 협업 경험'],
      deadline: '2025-06-10'
    },
    kakao: {
      position: '데이터 분석가',
      requirements: ['SQL, Python 능숙', '통계 분석 이해', '커뮤니케이션 능력'],
      deadline: '2025-05-31'
    },
    samsung: {
      position: '백엔드 개발자',
      requirements: ['Java, Spring 경험', 'DB 최적화 경험', '대규모 시스템 경험'],
      deadline: '2025-06-20'
    }
  };

  const certificationData = {
    frontend: [
      { cert: '웹디자인기능사', site: '큐넷', deadline: '2025-06-01' },
      { cert: '정보처리기사', site: '큐넷', deadline: '2025-05-20' }
    ],
    backend: [
      { cert: '정보처리기사', site: '큐넷', deadline: '2025-05-20' },
      { cert: 'SQLD', site: '큐넷', deadline: '2025-06-01' }
    ],
    data: [
      { cert: 'SQLD', site: '큐넷', deadline: '2025-06-01' },
      { cert: 'ADsP', site: '큐넷', deadline: '2025-06-15' }
    ]
  };

  return (
    <div style={{ padding: '30px', backgroundColor: '#f5f5f5', minHeight: '100vh' }}>
      <h1>스펙트래커 (SpecTrackr)</h1>

      {/* 상단 탭 */}
      <div style={{ marginBottom: '20px' }}>
        <button onClick={() => setActiveTab('spec')}>스펙 기준 검색</button>
        <button onClick={() => setActiveTab('company')}>회사 기준 검색</button>
      </div>

      {/* 스펙 기준 검색 */}
      {activeTab === 'spec' && (
        <div>
          <h2>스펙 기반 검색</h2>
          <select value={selectedJob} onChange={handleJobSelect}>
            <option value="">원하는 직무를 선택하세요</option>
            <option value="data">데이터 분석가</option>
            <option value="frontend">프론트엔드 개발자</option>
            <option value="backend">백엔드 개발자</option>
          </select>

          {selectedJob && (
            <div>
              {/* 스펙 비교 */}
              <div style={cardContainerStyle}>
                <div style={cardStyle}>
                  <h3>내 스펙</h3>
                  <ul>
                    {specData[selectedJob].mySpec.map((item, index) => (
                      <li key={index}>{item}</li>
                    ))}
                  </ul>
                </div>
                <div style={cardStyle}>
                  <h3>다른 지원자 평균 스펙</h3>
                  <ul>
                    {specData[selectedJob].othersSpec.map((item, index) => (
                      <li key={index}>{item}</li>
                    ))}
                  </ul>
                </div>
              </div>

              {/* 추천 회사 */}
              <div style={{ ...cardContainerStyle, flexWrap: 'wrap', marginTop: '30px' }}>
                {specData[selectedJob].recommendedCompanies.map((company, index) => (
                  <div
                    key={index}
                    style={{
                      ...cardStyle,
                      width: '200px',
                      textAlign: 'center',
                    }}
                  >
                    <h4>{company}</h4>
                  </div>
                ))}
              </div>
            </div>
          )}
        </div>
      )}

      {/* 회사 기준 검색 */}
      {activeTab === 'company' && (
        <div>
          <h2>회사 기준 검색</h2>

          <select value={selectedCompany} onChange={handleCompanySelect}>
            <option value="">회사를 선택하세요</option>
            <option value="naver">네이버</option>
            <option value="kakao">카카오</option>
            <option value="samsung">삼성전자</option>
          </select>

          {selectedCompany && (
            <div style={{ marginTop: '20px' }}>
              <h3>직무를 선택하세요</h3>
              <select value={selectedJob} onChange={handleJobSelect}>
                <option value="">직무 선택</option>
                <option value="frontend">프론트엔드 개발자</option>
                <option value="backend">백엔드 개발자</option>
                <option value="data">데이터 분석가</option>
              </select>
            </div>
          )}

          {selectedCompany && selectedJob && (
            <div style={{ marginTop: '20px' }}>
              <div style={{ marginBottom: '10px' }}>
                <button onClick={() => setCompanySubTab('certification')}>자격증 정보</button>
                <button onClick={() => setCompanySubTab('recruit')}>모집 요강</button>
              </div>

              {companySubTab === 'certification' && (
                <div style={cardStyle}>
                  <h3>필요 자격증</h3>
                  <ul>
                    {certificationData[selectedJob].map((item, index) => (
                      <li key={index}>
                        {item.cert} (시험 사이트: {item.site}, 마감: {item.deadline})
                      </li>
                    ))}
                  </ul>
                </div>
              )}

              {companySubTab === 'recruit' && (
                <div style={cardStyle}>
                  <h3>모집 요강</h3>
                  <p><strong>모집 직무:</strong> {companyRecruit[selectedCompany].position}</p>
                  <p><strong>필수 조건:</strong></p>
                  <ul>
                    {companyRecruit[selectedCompany].requirements.map((req, index) => (
                      <li key={index}>{req}</li>
                    ))}
                  </ul>
                  <p><strong>지원 마감일:</strong> {companyRecruit[selectedCompany].deadline}</p>
                </div>
              )}
            </div>
          )}
        </div>
      )}
    </div>
  );
}

export default App;
