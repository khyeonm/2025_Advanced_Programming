import React, { useState } from "react";
import "./sp_com.css";

const jobPositions = ["직무를 선택하세요", "연구직", "생산직"];
const companies = ["회사를 선택하세요", "삼성전자", "LG화학"];

const initialSpec = {
  school: "",
  grade: "",
  social: "",
  language: "",
  award: "",
  certificate: ""
};

const SpCom = ({ onCompanyTabClick }) => {
  const [activeTab, setActiveTab] = useState("스펙 기준 검색");
  const [selectedJob, setSelectedJob] = useState(jobPositions[0]);
  const [selectedCompany, setSelectedCompany] = useState(companies[0]);
  const [mySpec, setMySpec] = useState(initialSpec);

  // 예시 합격자 스펙
  const acceptedSpec = {
    school: "서울대학교",
    grade: "3.0 / 4.5",
    social: "없음",
    language: "텝스 100점",
    award: "다이브 해커톤 1등",
    certificate: "없음"
  };

  // 입력 핸들러
  const handleInput = (field, value) => {
    setMySpec({ ...mySpec, [field]: value });
  };

  return (
    <div className="container2">
      <h1 className="title2">SpecTrackr</h1>
      <div className="button-group">
        <button
          className={`btn ${activeTab === "회사 기준 검색" ? "selected" : ""}`}
          onClick={() => {
            setActiveTab("회사 기준 검색");
            if (onCompanyTabClick) onCompanyTabClick();
          }}
        >
          회사 기준 검색
        </button>
        <button
          className={`btn ${activeTab === "스펙 기준 검색" ? "selected" : ""}`}
          onClick={() => setActiveTab("스펙 기준 검색")}
        >
          스펙 기준 검색
        </button>
      </div>

      <div className="outer-box2">
        <div className="select-row2">
          <div className="select-col2">
            <label className="select-label2">직무를 선택하세요</label>
            <select
              className="select2"
              value={selectedJob}
              onChange={(e) => setSelectedJob(e.target.value)}
            >
              {jobPositions.map((job) => (
                <option key={job} value={job}>{job}</option>
              ))}
            </select>
          </div>
          <div className="select-col2">
            <label className="select-label2">회사를 선택하세요</label>
            <select
              className="select2"
              value={selectedCompany}
              onChange={(e) => setSelectedCompany(e.target.value)}
            >
              {companies.map((company) => (
                <option key={company} value={company}>{company}</option>
              ))}
            </select>
          </div>
        </div>

        <div className="spec-input-section">
          <label className="spec-input-label">나의 스펙 입력</label>
          <div className="spec-input-box">
            <button className="spec-btn">
              학교
              <input
                className="spec-input"
                type="text"
                placeholder="학교"
                value={mySpec.school}
                onChange={(e) => handleInput("school", e.target.value)}
              />
            </button>
            <button className="spec-btn">
              학점
              <input
                className="spec-input"
                type="text"
                placeholder="학점"
                value={mySpec.grade}
                onChange={(e) => handleInput("grade", e.target.value)}
              />
            </button>
            <button className="spec-btn">
              사회생활
              <input
                className="spec-input"
                type="text"
                placeholder="사회생활"
                value={mySpec.social}
                onChange={(e) => handleInput("social", e.target.value)}
              />
            </button>
            <button className="spec-btn">
              어학
              <input
                className="spec-input"
                type="text"
                placeholder="어학"
                value={mySpec.language}
                onChange={(e) => handleInput("language", e.target.value)}
              />
            </button>
            <button className="spec-btn">
              수상
              <input
                className="spec-input"
                type="text"
                placeholder="수상"
                value={mySpec.award}
                onChange={(e) => handleInput("award", e.target.value)}
              />
            </button>
            <button className="spec-btn">
              자격증
              <input
                className="spec-input"
                type="text"
                placeholder="자격증"
                value={mySpec.certificate}
                onChange={(e) => handleInput("certificate", e.target.value)}
              />
            </button>
          </div>
        </div>

        <div className="spec-compare-row">
          <div className="spec-box">
            <div className="spec-title">나의 스펙</div>
            <div className="spec-content">
              학교 : {mySpec.school || "부산대학교"}<br />
              학점 : {mySpec.grade || "4.5 / 4.5"}<br />
              사회 생활 : {mySpec.social || "인턴 2개월"}<br />
              어학 : {mySpec.language || "토익 100점"}<br />
              수상 : {mySpec.award || "없음"}<br />
              자격증 : {mySpec.certificate || "정보처리기사"}
            </div>
          </div>
          <div className="spec-box">
            <div className="spec-title">합격자 스펙</div>
            <div className="spec-content">
              학교 : {acceptedSpec.school}<br />
              학점 : {acceptedSpec.grade}<br />
              사회 생활 : {acceptedSpec.social}<br />
              어학 : {acceptedSpec.language}<br />
              수상 : {acceptedSpec.award}<br />
              자격증 : {acceptedSpec.certificate}
            </div>
          </div>
        </div>

        <div className="company-section">
          <label className="company-label">기업</label>
          <div className="company-carousel">
            <button className="carousel-arrow">◀</button>
            <div className="carousel-content"></div>
            <button className="carousel-arrow">▶</button>
          </div>
        </div>
      </div>
    </div>
  );
};

export default SpCom;
