import React, { useState, useEffect } from "react";
import axios from "axios";
import "./sp_com.css";

const SpCom = ({ onCompanyTabClick }) => {
  const [activeTab, setActiveTab] = useState("스펙 기준 검색");
  const [selectedCompany, setSelectedCompany] = useState("");
  const [selectedPosition, setSelectedPosition] = useState("");
  const [companyOptions, setCompanyOptions] = useState([]);
  const [positionOptions, setPositionOptions] = useState([]);
  const [rawOptions, setRawOptions] = useState([]);

  const initialSpec = {
    school: "",
    grade: "",
    social: "",
    language: "",
    award: "",
    certificate: ""
  };
  const [mySpec, setMySpec] = useState(initialSpec);

  const acceptedSpec = {
    school: "서울대학교",
    grade: "3.0 / 4.5",
    social: "없음",
    language: "텝스 100점",
    award: "다이브 해커톤 1등",
    certificate: "없음"
  };

  const handleInput = (key, value) => {
    setMySpec((prev) => ({ ...prev, [key]: value }));
  };

  // 전체 회사 및 직무 목록 불러오기
  useEffect(() => {
    axios.post("http://localhost:8000/get-company-name-and-detail-job", {
      job_category: ""
    })
    .then((res) => {
      const data = res.data;
      setRawOptions(data);
      setCompanyOptions([...new Set(data.map(item => item.company_name))].sort());
      setPositionOptions([...new Set(data.map(item => item.detail_job))].sort());
    })
    .catch((err) => console.error("API 오류:", err));
  }, []);

  // 회사 선택 시 직무 목록 업데이트
  useEffect(() => {
    if (selectedCompany) {
      const filtered = rawOptions.filter(item => item.company_name === selectedCompany);
      setPositionOptions([...new Set(filtered.map(item => item.detail_job))].sort());
    } else {
      setPositionOptions([...new Set(rawOptions.map(item => item.detail_job))].sort());
    }
  }, [selectedCompany, rawOptions]);

  // 직무 선택 시 회사 목록 업데이트
  useEffect(() => {
    if (selectedPosition) {
      const filtered = rawOptions.filter(item => item.detail_job === selectedPosition);
      setCompanyOptions([...new Set(filtered.map(item => item.company_name))].sort());
    } else {
      setCompanyOptions([...new Set(rawOptions.map(item => item.company_name))].sort());
    }
  }, [selectedPosition, rawOptions]);

  const handleCompanyClick = () => {
    setCompanyOptions([...new Set(rawOptions.map(item => item.company_name))].sort());
  };

  const handlePositionClick = () => {
    if (selectedCompany) {
      const filtered = rawOptions.filter(item => item.company_name === selectedCompany);
      setPositionOptions([...new Set(filtered.map(item => item.detail_job))].sort());
    }
  };

  return (
    <div className="container2">
      <h1 className="title2">SpecTrackr</h1>

      <div className="button-group">
        <button
          className={`btn ${activeTab === "회사 기준 검색" ? "selected" : ""}`}
          onClick={() => {
            setActiveTab("회사 기준 검색");
            onCompanyTabClick && onCompanyTabClick();
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
            <label className="select-label2">회사를 선택하세요</label>
            <select
              className="select2"
              value={selectedCompany}
              onMouseDown={handleCompanyClick}
              onChange={(e) => setSelectedCompany(e.target.value)}
            >
              <option value="">회사를 선택하세요</option>
              {companyOptions.map((company, idx) => (
                <option key={idx} value={company}>{company}</option>
              ))}
            </select>
          </div>
          <div className="select-col2">
            <label className="select-label2">직무를 선택하세요</label>
            <select
              className="select2"
              value={selectedPosition}
              onClick={handlePositionClick}
              onChange={(e) => setSelectedPosition(e.target.value)}
            >
              <option value="">직무를 선택하세요</option>
              {positionOptions.map((pos, idx) => (
                <option key={idx} value={pos}>{pos}</option>
              ))}
            </select>
          </div>
        </div>

        <div className="spec-input-section">
          <label className="spec-input-label">나의 스펙 입력</label>
          <div className="spec-input-box">
            {Object.entries(initialSpec).map(([key]) => (
              <div key={key} className="spec-btn">
                {key}
                <input
                  className="spec-input"
                  type="text"
                  value={mySpec[key]}
                  placeholder={key}
                  onChange={(e) => handleInput(key, e.target.value)}
                />
              </div>
            ))}
          </div>
        </div>

        <div className="spec-compare-row">
          <div className="spec-box">
            <div className="spec-title">나의 스펙</div>
            <div className="spec-content">
              {Object.entries(mySpec).map(([key, value]) => (
                <div key={key}>{key} : {value || "없음"}</div>
              ))}
            </div>
          </div>
          <div className="spec-box">
            <div className="spec-title">합격자 스펙</div>
            <div className="spec-content">
              {Object.entries(acceptedSpec).map(([key, value]) => (
                <div key={key}>{key} : {value}</div>
              ))}
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
