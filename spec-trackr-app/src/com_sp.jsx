import React, { useState, useEffect } from "react";
import axios from "axios";
import "./com_sp.css";

const jobCategories = ["생산/제조", "연구개발/설계", "IT/인터넷"];

const ComSp = ({ onSpecTabClick }) => {
  const [selectedJobCategory, setSelectedJobCategory] = useState("");
  const [selectedCompany, setSelectedCompany] = useState("");
  const [selectedPosition, setSelectedPosition] = useState("");
  const [companyOptions, setCompanyOptions] = useState([]);
  const [positionOptions, setPositionOptions] = useState([]);
  const [rawOptions, setRawOptions] = useState([]); // 전체 데이터 저장
  const [activeTab, setActiveTab] = useState("채용 공고");

  // 직업 카테고리 선택 시 전체 데이터 받아오기
  useEffect(() => {
    if (selectedJobCategory) {
      axios.post("http://localhost:8000/get-company-name-and-detail-job", {
        job_category: selectedJobCategory,
      })
      .then((res) => {
        const data = res.data;
        setRawOptions(data);
        setCompanyOptions([...new Set(data.map(item => item.company_name))]);
        setPositionOptions([...new Set(data.map(item => item.detail_job))]);
        setSelectedCompany("");
        setSelectedPosition("");
      })
      .catch((err) => console.error("API 오류:", err));
    }
  }, [selectedJobCategory]);

  // 회사 선택 시 직무 목록 업데이트
  useEffect(() => {
    if (selectedCompany) {
      const filtered = rawOptions.filter(item => item.company_name === selectedCompany);
      setPositionOptions([...new Set(filtered.map(item => item.detail_job))]);
    } else if (selectedJobCategory) {
      setCompanyOptions([...new Set(rawOptions.map(item => item.company_name))]);
      setPositionOptions([...new Set(rawOptions.map(item => item.detail_job))]);
    }
  }, [selectedCompany]);

  // 직무 선택 시 회사 목록 업데이트
  useEffect(() => {
    if (selectedPosition) {
      const filtered = rawOptions.filter(item => item.detail_job === selectedPosition);
      setCompanyOptions([...new Set(filtered.map(item => item.company_name))]);
    } else if (selectedJobCategory) {
      setCompanyOptions([...new Set(rawOptions.map(item => item.company_name))]);
      setPositionOptions([...new Set(rawOptions.map(item => item.detail_job))]);
    }
  }, [selectedPosition]);

  // 회사 드롭다운 클릭 시 전체 목록으로 초기화
  const handleCompanyClick = () => {
    if (selectedJobCategory) {
      setCompanyOptions([...new Set(rawOptions.map(item => item.company_name))]);
    }
  };

  // 직무 드롭다운 클릭 시 선택된 회사에 맞는 직무만 필터링
  const handlePositionClick = () => {
    if (selectedCompany) {
      const filtered = rawOptions.filter(item => item.company_name === selectedCompany);
      setPositionOptions([...new Set(filtered.map(item => item.detail_job))]);
    }
  };

  return (
    <div className="container">
      <h1 className="title">SpecTrackr</h1>

      <div className="button-group">
        <button
          className="btn selected"
          onClick={() => setActiveTab("회사 기준 검색")}
        >
          회사 기준 검색
        </button>
        <button
          className={`btn ${activeTab === "스펙 기준 검색" ? "selected" : ""}`}
          onClick={() => {
            setActiveTab("스펙 기준 검색");
            if (onSpecTabClick) onSpecTabClick();
          }}
        >
          스펙 기준 검색
        </button>
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
              onMouseDown={handleCompanyClick}
              onChange={(e) => setSelectedCompany(e.target.value)}
            >
              <option value="">회사를 선택하세요</option>
              {companyOptions.map((company, index) => (
                <option key={index} value={company}>{company}</option>
              ))}
            </select>
          </div>
          <div className="select-col">
            <label className="select-label">직무를 선택하세요</label>
            <select
              className="select"
              value={selectedPosition}
              onClick={handlePositionClick}
              onChange={(e) => setSelectedPosition(e.target.value)}
            >
              <option value="">직무를 선택하세요</option>
              {positionOptions.map((position, idx) => (
                <option key={idx} value={position}>{position}</option>
              ))}
            </select>
          </div>
        </div>

        <div className="section">
          <label className="select-label">검색 결과</label>
          <div className="tab-group">
            <button
              className={`tab-btn ${activeTab === "채용 공고" ? "tab-active" : "tab-inactive"}`}
              onClick={() => setActiveTab("채용 공고")}
            >
              채용 공고
            </button>
            <button
              className={`tab-btn ${activeTab === "합격자 스펙" ? "tab-active" : "tab-inactive"}`}
              onClick={() => setActiveTab("합격자 스펙")}
            >
              합격자 스펙
            </button>
          </div>
          <div className="result-box">
            {activeTab === "채용 공고" && (
              <>
                <p><strong>직무:</strong> {selectedPosition || "선택되지 않음"}</p>
                <p><strong>회사:</strong> {selectedCompany || "선택되지 않음"}</p>
              </>
            )}
            {activeTab === "합격자 스펙" && (
              <p>합격자 스펙 문구가 여기에 표시됩니다.</p>
            )}
          </div>
        </div>
      </div>
    </div>
  );
};

export default ComSp;
