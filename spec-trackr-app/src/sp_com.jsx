import React, { useState, useEffect } from "react";
import axios from "axios";
import "./total.css";
import TableauEmbed from "./TableauEmbed";

const SpCom = ({ onCompanyTabClick }) => {
  const [activeTab, setActiveTab] = useState("스펙 검색");
  const [selectedCompany, setSelectedCompany] = useState("");
  const [selectedPosition, setSelectedPosition] = useState("");
  const [companyOptions, setCompanyOptions] = useState([]);
  const [positionOptions, setPositionOptions] = useState([]);
  const [rawCompanyOptions, setRawCompanyOptions] = useState([]);
  const [rawPositionOptions, setRawPositionOptions] = useState([]);
  const [allSchools, setAllSchools] = useState([]);

  const [applicants, setApplicants] = useState([]);
  const [currentApplicantIndex, setCurrentApplicantIndex] = useState(0);
  const [recommendedApplicants, setRecommendedApplicants] = useState([]);
  const [carouselIndex, setCarouselIndex] = useState(0); // ✅ carousel 상태 추가
  const [companySearch, setCompanySearch] = useState("");
  const [schoolSearch, setSchoolSearch] = useState("");

  const filteredCompanies = companyOptions.filter(company =>
  company.toLowerCase().includes(companySearch.toLowerCase())
  );

  const filteredSchools = allSchools.filter(school =>
    school.toLowerCase().includes(schoolSearch.toLowerCase())
  );


  const initialSpec = {
    school: "",
    grade: "",
    social: "",
    language: "",
    award: "",
    certificate: ""
  };
  const [mySpec, setMySpec] = useState(initialSpec);

  const handleInput = (key, value) => {
    setMySpec(prev => ({ ...prev, [key]: value }));
  };

  // ✅ 학교 목록 불러오기
  useEffect(() => {
    axios
      .get(`${process.env.REACT_APP_API_URL}/get-all-universities`)
      .then(res => setAllSchools((res.data || []).filter(Boolean).sort()))
      .catch(err => {
        console.error("대학교 목록 오류:", err);
        setAllSchools([]);
      });
  }, []);

  // ✅ 회사/직무 목록 초기화
  useEffect(() => {
    axios
      .post(`${process.env.REACT_APP_API_URL}/get-companiy-by-detail-job`, { detail_job: "" })
      .then(res => {
        const companies = res.data.map(item => item.company).filter(Boolean).sort();
        setRawCompanyOptions(companies);
        setCompanyOptions(companies);
      });
    axios
      .post(`${process.env.REACT_APP_API_URL}/get-detail-job-by-company`, { company: "" })
      .then(res => {
        const positions = res.data.map(item => item.detail_job).filter(Boolean).sort();
        setRawPositionOptions(positions);
        setPositionOptions(positions);
      });
  }, []);

  // ✅ 선택 회사에 따른 직무 필터
  useEffect(() => {
    if (selectedCompany) {
      axios
        .post(`${process.env.REACT_APP_API_URL}/get-detail-job-by-company`, { company: selectedCompany })
        .then(res => setPositionOptions(res.data.map(i => i.detail_job).filter(Boolean).sort()));
    } else {
      setPositionOptions([...rawPositionOptions]);
    }
  }, [selectedCompany, rawPositionOptions]);

  // ✅ 선택 직무에 따른 회사 필터
  useEffect(() => {
    if (selectedPosition) {
      axios
        .post(`${process.env.REACT_APP_API_URL}/get-companiy-by-detail-job`, { detail_job: selectedPosition })
        .then(res => setCompanyOptions(res.data.map(i => i.company).filter(Boolean).sort()));
    } else {
      setCompanyOptions([...rawCompanyOptions]);
    }
  }, [selectedPosition, rawCompanyOptions]);

  // ✅ 합격자 스펙 불러오기
  useEffect(() => {
    if (selectedCompany && selectedPosition) {
      axios
        .post(`${process.env.REACT_APP_API_URL}/get-applicants-by-company-detail-job`, {
          company: selectedCompany,
          detail_job: selectedPosition
        })
        .then(res => {
          setApplicants(res.data || []);
          setCurrentApplicantIndex(0);
        })
        .catch(err => {
          console.error("합격자 API 오류:", err);
          setApplicants([]);
        });
    } else {
      setApplicants([]);
    }
  }, [selectedCompany, selectedPosition]);

  // ✅ 추천 기업 불러오기
  useEffect(() => {
    if (mySpec.school) {
      axios
        .post(`${process.env.REACT_APP_API_URL}/get-applicants-by-school`, { university: mySpec.school })
        .then(res => {
          setRecommendedApplicants(res.data || []);
          setCarouselIndex(0);
        })
        .catch(err => {
          console.error("추천 기업 API 오류:", err);
          setRecommendedApplicants([]);
        });
    } else {
      setRecommendedApplicants([]);
    }
  }, [mySpec.school]);

  const currentApplicant = applicants[currentApplicantIndex];

  const acceptedSpec = currentApplicant
    ? {
        school: currentApplicant.university ?? "",
        grade: currentApplicant.gpa ?? "",
        social: "",
        language: currentApplicant.toeic ? `토익 ${currentApplicant.toeic}` : "",
        award: "",
        certificate: ""
      }
    : {
        school: "서울대학교",
        grade: "3.0 / 4.5",
        social: "없음",
        language: "텝스 100점",
        award: "다이브 해커톤 1등",
        certificate: "없음"
      };

  return (
    <div className="container">
      <h1 className="title">SpecTrackr</h1>

      <div className="button-group">
        <button
          className={`btn ${activeTab === "채용공고 검색" ? "selected" : ""}`}
          onClick={() => {
            setActiveTab("채용공고 검색");
            onCompanyTabClick && onCompanyTabClick();
          }}
        >
          채용공고고 검색
        </button>
        <button
          className={`btn ${activeTab === "스펙 검색" ? "selected" : ""}`}
          onClick={() => setActiveTab("스펙 검색")}
        >
          스펙 검색
        </button>
      </div>

      <div className="outer-box">
        <div className="select-row">
          <div className="select-col">
            <label className="select-label">회사를 선택하세요</label>
            <input
              type="text"
              placeholder="회사 검색"
              className="search-input"
              value={companySearch}
              onChange={(e) => setCompanySearch(e.target.value)}
            />
            <select
              className="select"
              value={selectedCompany}
              onChange={(e) => setSelectedCompany(e.target.value)}
            >
              <option value="">회사를 선택하세요</option>
              {filteredCompanies.map((company, idx) => (
                <option key={idx} value={company}>
                  {company}
                </option>
              ))}
            </select>
          </div>
          <div className="select-col">
            <label className="select-label">직무를 선택하세요</label>
            <select
              className="select"
              value={selectedPosition}
              onChange={(e) => setSelectedPosition(e.target.value)}
            >
              <option value="">직무를 선택하세요</option>
              {positionOptions.map((pos, idx) => (
                <option key={idx} value={pos}>
                  {pos}
                </option>
              ))}
            </select>
          </div>
        </div>

        <div className="spec-input-section">
          <label className="spec-input-label">나의 스펙 입력</label>
          <div className="spec-input-box">
            <div className="spec-btn">
              school
              <input
                type="text"
                placeholder="학교 검색"
                className="search-input"
                value={schoolSearch}
                onChange={(e) => setSchoolSearch(e.target.value)}
              />
              <select
                className="spec-input"
                value={mySpec.school}
                onChange={(e) => handleInput("school", e.target.value)}
              >
                <option value="">학교 선택</option>
                {filteredSchools.map((school, idx) => (
                  <option key={idx} value={school}>
                    {school}
                  </option>
                ))}
              </select>
            </div>
            {Object.entries(initialSpec).map(([key]) =>
              key === "school" ? null : (
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
              )
            )}
          </div>
        </div>



        <div className="spec-compare-row">
          <div className="spec-column">
            <div className="spec-title-outside">나의 스펙</div>
            <div className="spec-box">
              <div className="spec-content">
                {Object.entries(mySpec).map(([key, value]) => (
                  <div key={key}>{key} : {value || "없음"}</div>
                ))}
              </div>
            </div>
          </div>

          <div className="spec-column">
            <div className="spec-title-outside">합격자 스펙</div>
            <div className="spec-box">
              <div className="spec-content">
                <div style={{ display: "flex", alignItems: "center", justifyContent: "center" }}>
                  <button
                    className="carousel-arrow"
                    onClick={() =>
                      setCurrentApplicantIndex((prev) =>
                        applicants.length === 0 ? 0 : (prev - 1 + applicants.length) % applicants.length
                      )
                    }
                    disabled={applicants.length <= 1}
                    style={{ marginRight: 8 }}
                  >
                    ◀
                  </button>
                  <div>
                    {Object.entries(acceptedSpec).map(([key, value]) => (
                      <div key={key}>
                        {key} : {value || "없음"}
                      </div>
                    ))}
                  </div>
                  <button
                    className="carousel-arrow"
                    onClick={() =>
                      setCurrentApplicantIndex((prev) =>
                        applicants.length === 0 ? 0 : (prev + 1) % applicants.length
                      )
                    }
                    disabled={applicants.length <= 1}
                    style={{ marginLeft: 8 }}
                  >
                    ▶
                  </button>
                </div>
                {applicants.length > 1 && (
                  <div style={{ textAlign: "center", marginTop: 4, fontSize: 12 }}>
                    {currentApplicantIndex + 1} / {applicants.length}
                  </div>
                )}
              </div>
            </div>
          </div>
        </div>

        {/* ✅ 추천 기업 영역 */}
        <div className="company-section">
          <label className="company-label">추천 기업</label>
          <div className="company-carousel">
            <button
              className="carousel-arrow left"
              onClick={() => setCarouselIndex(prev => Math.max(prev - 1, 0))}
              disabled={carouselIndex === 0}
            >
              &#8592;
            </button>

            <div className="carousel-content">
              {recommendedApplicants
                .slice(carouselIndex * 4, carouselIndex * 4 + 4)
                .map((rec, idx) => (
                  <div key={idx} className="company-card">
                    <div className="company-name">{rec.company}</div>
                    <div className="position-name">{rec.detail_job}</div>
                  </div>
                ))}
            </div>

            <button
              className="carousel-arrow right"
              onClick={() =>
                setCarouselIndex(prev =>
                  (prev + 1) * 4 < recommendedApplicants.length ? prev + 1 : prev
                )
              }
              disabled={(carouselIndex + 1) * 4 >= recommendedApplicants.length}
            >
              &#8594;
            </button>
          </div>
        </div>

        {/* ✅ 직무별 스펙 Tableau 시각화 영역 */}
        <div className="tableau-section">
          <label className="company-label">직무별 스펙</label>
          <div className="tableau-box">
            <TableauEmbed />
          </div>
        </div>
      </div>
    </div>
  );
};

export default SpCom;
