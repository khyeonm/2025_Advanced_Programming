import React, { useState, useEffect } from "react";
import axios from "axios";
import "./sp_com.css";

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
  const [selectedCompany, setSelectedCompany] = useState("");
  const [selectedJob, setSelectedJob] = useState("");

  const [companyOptions, setCompanyOptions] = useState([]);
  const [positionOptions, setPositionOptions] = useState([]);
  const [rawOptions, setRawOptions] = useState([]);

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
    setMySpec((prevSpec) => ({
      ...prevSpec,
      [key]: value,
    }));
  };


  // 🔥 세 가지 카테고리를 한 번에 요청하여 회사 및 직무 데이터 불러오기
  useEffect(() => {
    axios
      .post("http://localhost:8000/get-company-name-and-detail-job", {
        job_category: "", // 전체 데이터 요청
      })
      .then((res) => {
        const data = res.data;
        setRawOptions(data);

        // 최초: 전체 회사 및 직무 목록을 설정
        setCompanyOptions([...new Set(data.map((item) => item.company_name))]);
        setPositionOptions([...new Set(data.map((item) => item.detail_job))]);
      })
      .catch((err) => console.error("API 오류:", err));
  }, []);



  // 회사 선택 시 해당 회사의 직무 필터링
  // 선택에 따라 드롭다운 값 동기화
  useEffect(() => {
    if (selectedCompany && selectedJob) {
      // 둘 다 선택된 경우 → AND 조건
      const filtered = rawOptions.filter(
        (item) =>
          item.company_name === selectedCompany &&
          item.detail_job === selectedJob
      );
      setCompanyOptions([...new Set(filtered.map((item) => item.company_name))]);
      setPositionOptions([...new Set(filtered.map((item) => item.detail_job))]);
    } else if (selectedCompany) {
      // 회사만 선택된 경우
      const filtered = rawOptions.filter(
        (item) => item.company_name === selectedCompany
      );
      setCompanyOptions([
        ...new Set(filtered.map((item) => item.company_name)),
      ]);
      setPositionOptions([
        ...new Set(filtered.map((item) => item.detail_job)),
      ]);
    } else if (selectedJob) {
      // 직무만 선택된 경우
      const filtered = rawOptions.filter(
        (item) => item.detail_job === selectedJob
      );
      setCompanyOptions([
        ...new Set(filtered.map((item) => item.company_name)),
      ]);
      setPositionOptions([
        ...new Set(filtered.map((item) => item.detail_job)),
      ]);
    } else {
      // 아무것도 선택되지 않은 경우
      setCompanyOptions([
        ...new Set(rawOptions.map((item) => item.company_name)),
      ]);
      setPositionOptions([
        ...new Set(rawOptions.map((item) => item.detail_job)),
      ]);
    }
  }, [selectedCompany, selectedJob, rawOptions]);




  // 회사 변경 시 직무 초기화
  const handleCompanyChange = (value) => {
    setSelectedCompany(value);
    setSelectedJob(""); // 직무 초기화
  };

  // 직무 변경 시 회사 재필터링 (회사 선택 유지)
  const handleJobChange = (value) => {
    setSelectedJob(value);
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
            <label className="select-label2">회사를 선택하세요</label>
            <select
                className="select2"
                value={selectedCompany}
                onChange={(e) => handleCompanyChange(e.target.value)}
              >
                <option value="">회사를 선택하세요</option>
                {companyOptions.map((company, index) => (
                  <option key={index} value={company}>
                    {company}
                  </option>
                ))}
              </select>
          </div>
          <div className="select-col2">
            <label className="select-label2">직무를 선택하세요</label>
            <select
              className="select2"
              value={selectedJob}
              onChange={(e) => handleJobChange(e.target.value)}
            >
              <option value="">직무를 선택하세요</option>
              {positionOptions.map((job, index) => (
                <option key={index} value={job}>
                  {job}
                </option>
              ))}
            </select>
          </div>
        </div>

        <div className="spec-input-section">
          <label className="spec-input-label">나의 스펙 입력</label>
          <div className="spec-input-box">
            {Object.keys(initialSpec).map((key) => (
              <button className="spec-btn" key={key}>
                {key}
                <input
                  className="spec-input"
                  type="text"
                  placeholder={key}
                  value={mySpec[key]}
                  onChange={(e) => handleInput(key, e.target.value)}
                />
              </button>
            ))}
          </div>
        </div>

        <div className="spec-compare-row">
          <div className="spec-box">
            <div className="spec-title">나의 스펙</div>
            <div className="spec-content">
              학교 : {mySpec.school || "부산대학교"}
              <br />
              학점 : {mySpec.grade || "4.5 / 4.5"}
              <br />
              사회 생활 : {mySpec.social || "인턴 2개월"}
              <br />
              어학 : {mySpec.language || "토익 100점"}
              <br />
              수상 : {mySpec.award || "없음"}
              <br />
              자격증 : {mySpec.certificate || "정보처리기사"}
            </div>
          </div>
          <div className="spec-box">
            <div className="spec-title">합격자 스펙</div>
            <div className="spec-content">
              학교 : {acceptedSpec.school}
              <br />
              학점 : {acceptedSpec.grade}
              <br />
              사회 생활 : {acceptedSpec.social}
              <br />
              어학 : {acceptedSpec.language}
              <br />
              수상 : {acceptedSpec.award}
              <br />
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
