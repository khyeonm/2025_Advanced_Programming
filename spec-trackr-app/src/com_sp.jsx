import React, { useState, useEffect } from "react";
import axios from "axios";
import "./total.css";

const jobCategories = ["생산/제조", "연구개발/설계", "IT/인터넷"];

const ComSp = ({ onSpecTabClick }) => {
  const [selectedJobCategory, setSelectedJobCategory] = useState("");
  const [selectedCompany, setSelectedCompany] = useState("");
  const [selectedPosition, setSelectedPosition] = useState("");
  const [companyOptions, setCompanyOptions] = useState([]);
  const [positionOptions, setPositionOptions] = useState([]);
  const [rawOptions, setRawOptions] = useState([]); // 전체 데이터 저장
  const [activeTab, setActiveTab] = useState("채용 공고");
  const [jobPostingResults, setJobPostingResults] = useState([]);
  
  // 직업 카테고리 선택 시 전체 데이터 받아오기 및 초기화
  useEffect(() => {
    if (selectedJobCategory) {
      axios.post("/get-company-name-and-detail-job", {
        job_category: selectedJobCategory,
      })
      .then((res) => {
        const uniqueResults = Array.from(new Map(res.data.map(item => [JSON.stringify(item), item])).values());
        setRawOptions(uniqueResults);
        setCompanyOptions([...new Set(uniqueResults.map(item => item.company_name))].sort());
        setPositionOptions([...new Set(uniqueResults.map(item => item.detail_job))].sort());
        setSelectedCompany("");
        setSelectedPosition("");
        setJobPostingResults([]);
      })
      .catch((err) => console.error("API 오류:", err));
    } else {
      setRawOptions([]);
      setCompanyOptions([]);
      setPositionOptions([]);
      setSelectedCompany("");
      setSelectedPosition("");
      setJobPostingResults([]);
    }
  }, [selectedJobCategory]);

  // 회사 선택 시 직무 옵션 필터링 및 초기화
  useEffect(() => {
    if (selectedCompany) {
      const filteredPositions = rawOptions.filter(item => item.company_name === selectedCompany);
      setPositionOptions([...new Set(filteredPositions.map(item => item.detail_job))].sort());
      setSelectedPosition("");
      setJobPostingResults([]);
    } else if (selectedJobCategory) {
      setPositionOptions([...new Set(rawOptions.map(item => item.detail_job))].sort());
      setSelectedPosition("");
      setJobPostingResults([]);
    }
  }, [selectedCompany, rawOptions, selectedJobCategory]);

  // 직무 선택 시 회사 옵션 필터링 및 초기화
  useEffect(() => {
    if (selectedPosition) {
      const filteredCompanies = rawOptions.filter(item => item.detail_job === selectedPosition);
      setCompanyOptions([...new Set(filteredCompanies.map(item => item.company_name))].sort());
      setSelectedCompany(prevCompany => {
        if (!filteredCompanies.some(item => item.company_name === prevCompany)) {
          return "";
        }
        return prevCompany;
      });
      setJobPostingResults([]);
    } else if (selectedJobCategory) {
      setCompanyOptions([...new Set(rawOptions.map(item => item.company_name))].sort());
      setJobPostingResults([]);
    }
  }, [selectedPosition, rawOptions, selectedJobCategory]);

  // 세 가지 모두 선택되었을 때만 채용공고 API 호출
  useEffect(() => {
    if (selectedJobCategory && selectedCompany && selectedPosition) {
      axios.post("/get-job-posting", {
        job_category: selectedJobCategory,
        company_name: selectedCompany,
        detail_job: selectedPosition,
      })
      .then((res) => {
        console.log("서버 응답:", res.data);  // 👈 추가
        const uniqueResults = Array.from(
          new Map(res.data.map(item => [JSON.stringify(item), item])).values()
        );
        setJobPostingResults(uniqueResults);
      })
      .catch((err) => {
        console.error("채용공고 불러오기 오류:", err);
        setJobPostingResults([]);
      });
    } else {
      setJobPostingResults([]);
    }
  }, [selectedJobCategory, selectedCompany, selectedPosition]);

  // 회사 드롭다운 클릭 시 전체 목록으로 초기화
  const handleCompanyClick = () => {
    if (selectedJobCategory) {
      setCompanyOptions([...new Set(rawOptions.map(item => item.company_name))].sort());
    }
  };

  // 직무 드롭다운 클릭 시 선택된 회사에 맞는 직무만 필터링
  const handlePositionClick = () => {
    if (selectedCompany) {
      const filtered = rawOptions.filter(item => item.company_name === selectedCompany);
      setPositionOptions([...new Set(filtered.map(item => item.detail_job))].sort());
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
          </div>
          <div className="result-box">
            {activeTab === "채용 공고" && (
              <>
                {jobPostingResults.length > 0 ? (
                  <ul className="posting-list">
                    {jobPostingResults.map((posting, index) => {
                      const isValidImage =
                        posting.image &&
                        posting.image !== "null" &&
                        posting.image !== null &&
                        posting.image.trim() !== "";

                      return (
                        <li key={index} className="posting-item">
                          {isValidImage ? (
                            // 이미지가 있을 때: 이미지만 보여주기
                            <div className="image-container">
                              <img
                                src={posting.image}
                                alt="채용 이미지"
                                className="job-image"
                                onError={(e) => {
                                  e.target.onerror = null;
                                  e.target.style.display = "none";
                                }}
                              />
                            </div>
                          ) : (
                            // 이미지가 없을 때: 텍스트 정보만 보여주기
                            <div className="posting-info">
                              <span><strong>회사:</strong> {selectedCompany}</span><br />
                              <span><strong>직무:</strong> {selectedPosition}</span><br />
                              <span><strong>근무지:</strong> {posting.location}</span><br />
                              <span><strong>학력:</strong> {posting.education_level}</span><br />
                              <span><strong>경력:</strong> {posting.experience}</span><br />
                              <span><strong>요구사항:</strong> {posting.etc_requirements || "없음"}</span><br />
                              <span><strong>우대사항:</strong> {posting.preferred_qualification || "없음"}</span>
                            </div>
                          )}
                        </li>
                      );
                    })}
                  </ul>
                ) : (
                  <p>해당 조건에 대한 채용 공고가 없습니다.</p>
                )}
              </>
            )}
          </div>
        </div>
      </div>
    </div>
  );
};

export default ComSp;
