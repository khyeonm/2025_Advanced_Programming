import React, { useState, useEffect } from "react";
// import axios from "axios";

import "./com_sp.css";

const jobCategories = ["생산/제조", "연구개발/설계", "IT/인터넷"];

const ComSp = ({ onSpecTabClick }) => {
  const [selectedJobCategory, setSelectedJobCategory] = useState("");
  const [selectedCompany, setSelectedCompany] = useState("");
  const [selectedPosition, setSelectedPosition] = useState("");
  const [activeTab, setActiveTab] = useState("채용 공고");

  // ------------------------------------ fastAPI와 연결
  // const [companyOptions, setCompanyOptions] = useState([]);  // <- 동적으로 채울 회사 목록

  // // 직업 선택 시 회사 목록 불러오기
  // useEffect(() => {
  //   if (selectedJobCategory) {
  //     axios
  //     // fast API와 연결 -> 서버의 포트번호가 8000
  //       .get(`http://localhost:8000/companies`, {
  //         params: { job_category: selectedJobCategory },
  //       })
  //       .then((res) => {
  //         setCompanyOptions(res.data.map((item) => item.name));
  //       })
  //       .catch((err) => {
  //         console.error("회사 목록 불러오기 실패:", err);
  //       });
  //   }
  // }, [selectedJobCategory]);
  
  return (
    <div className="container">
      <h1 className="title">SpecTrackr</h1>
    
      <div className="button-group">
      <button
        // className={`btn ${activeTab === "회사 기준 검색" ? "selected" : ""}`}
        className="btn selected"
        onClick={() => setActiveTab("회사 기준 검색")}>
        회사 기준 검색
    </button>
    <button
          className={`btn ${activeTab === "스펙 기준 검색" ? "selected" : ""}`}
          onClick={() => { setActiveTab("스펙 기준 검색");
            if (onSpecTabClick) onSpecTabClick();
          }}>
          스펙 기준 검색
    </button>
    {/* <button
        className={`btn ${activeTab === "스펙 기준 검색" ? "selected" : ""}`}
        onClick={() => setActiveTab("스펙 기준 검색")}>
        스펙 기준 검색
    </button> */}
      </div>

      <div className="outer-box">
        <div className="section">
          <label className="select-label">직업을 선택하세요</label>
          <div className="flex flex-wrap gap-2">
            {jobCategories.map((category) => (
              <button
                key={category}
                className={`job-btn ${selectedJobCategory === category ? "selected" : ""}`}
                onClick={() => setSelectedJobCategory(category)}
              >
                {category}
              </button>
            ))}
          </div>
        </div>

        <div className="select-row">
          <div className="select-col">
            <label className="select-label">회사를 선택하세요</label>
            <select
              className="select"
              value={selectedCompany}
              onChange={(e) => setSelectedCompany(e.target.value)}
            >
              <option>회사를 선택하세요</option>
              {/* fastAPI와 연결 --------------------------------*/}
              {/* {companyOptions.map((company, index) => (
                <option key={index} value={company}>
                  {company}
                </option>
              ))} */}

              {/* fastAPI와 연결 --------------------------------*/}
            </select>
          </div>
          <div className="select-col">
            <label className="select-label">직무를 선택하세요</label>
            <select
              className="select"
              value={selectedPosition}
              onChange={(e) => setSelectedPosition(e.target.value)}
            >
              <option>직무를 선택하세요</option>
              <option>연구직</option>
              <option>생산직</option>
            </select>
          </div>
        </div>

        <div className="section">
          <label className="select-label">검색 결과</label>
          <div className="tab-group">
            <button
              className={`tab-btn ${
                activeTab === "채용 공고" ? "tab-active" : "tab-inactive"
              }`}
              onClick={() => setActiveTab("채용 공고")}
            >
              채용 공고
            </button>
            <button
              className={`tab-btn ${
                activeTab === "합격자 스펙" ? "tab-active" : "tab-inactive"
              }`}
              onClick={() => setActiveTab("합격자 스펙")}
            >
              합격자 스펙
            </button>
          </div>
          <div className="result-box">
            {activeTab === "채용 공고" && <p>채용 공고 문구가 여기에 표시됩니다.</p>}
            {activeTab === "합격자 스펙" && <p>합격자 스펙 문구가 여기에 표시됩니다.</p>}
          </div>
        </div>
      </div>
    </div>
  );
};

export default ComSp;
