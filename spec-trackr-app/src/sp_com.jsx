// import React, { useState, useEffect } from "react";
// import axios from "axios";
// import "./total.css";

// const SpCom = ({ onCompanyTabClick }) => {
//   const [activeTab, setActiveTab] = useState("스펙 기준 검색");
//   const [selectedCompany, setSelectedCompany] = useState("");
//   const [selectedPosition, setSelectedPosition] = useState("");
//   const [companyOptions, setCompanyOptions] = useState([]);
//   const [positionOptions, setPositionOptions] = useState([]);
//   const [rawCompanyOptions, setRawCompanyOptions] = useState([]);
//   const [rawPositionOptions, setRawPositionOptions] = useState([]);

//   // 합격자 스펙 carousel 상태
//   const [applicants, setApplicants] = useState([]);
//   const [currentApplicantIndex, setCurrentApplicantIndex] = useState(0);

//   const initialSpec = {
//     school: "",
//     grade: "",
//     social: "",
//     language: "",
//     award: "",
//     certificate: ""
//   };
//   const [mySpec, setMySpec] = useState(initialSpec);

//   const handleInput = (key, value) => {
//     setMySpec((prev) => ({ ...prev, [key]: value }));
//   };

//   // 최초: 모든 회사/직무 목록 불러오기 (기본 정렬)
//   useEffect(() => {
//     axios
//       .post("http://localhost:8000/get-companiy-by-detail-job", { detail_job: "" })
//       .then((res) => {
//         const companies = res.data
//           .map((item) => item.company)
//           .filter(Boolean)
//           .sort();
//         setRawCompanyOptions(companies);
//         setCompanyOptions(companies);
//       })
//       .catch((err) => console.error("회사 API 오류:", err));
//     axios
//       .post("http://localhost:8000/get-detail-job-by-company", { company: "" })
//       .then((res) => {
//         const positions = res.data
//           .map((item) => item.detail_job)
//           .filter(Boolean)
//           .sort();
//         setRawPositionOptions(positions);
//         setPositionOptions(positions);
//       })
//       .catch((err) => console.error("직무 API 오류:", err));
//   }, []);

//   // 회사 선택 시: 해당 회사의 직무만
//   useEffect(() => {
//     if (selectedCompany) {
//       axios
//         .post("http://localhost:8000/get-detail-job-by-company", { company: selectedCompany })
//         .then((res) => {
//           const positions = res.data
//             .map((item) => item.detail_job)
//             .filter(Boolean)
//             .sort();
//           setPositionOptions(positions);
//         })
//         .catch((err) => console.error("직무 API 오류:", err));
//     } else {
//       setPositionOptions([...rawPositionOptions]);
//     }
//   }, [selectedCompany, rawPositionOptions]);

//   // 직무 선택 시: 해당 직무의 회사만
//   useEffect(() => {
//     if (selectedPosition) {
//       axios
//         .post("http://localhost:8000/get-companiy-by-detail-job", { detail_job: selectedPosition })
//         .then((res) => {
//           const companies = res.data
//             .map((item) => item.company)
//             .filter(Boolean)
//             .sort();
//           setCompanyOptions(companies);
//         })
//         .catch((err) => console.error("회사 API 오류:", err));
//     } else {
//       setCompanyOptions([...rawCompanyOptions]);
//     }
//   }, [selectedPosition, rawCompanyOptions]);

//   // 회사 드롭다운 클릭 시: 항상 전체 복원
//   const handleCompanyClick = () => {
//     if (!selectedPosition) {
//       setCompanyOptions([...rawCompanyOptions]);
//     } else {
//       axios
//         .post("http://localhost:8000/get-companiy-by-detail-job", { detail_job: selectedPosition })
//         .then((res) => {
//           const companies = res.data
//             .map((item) => item.company)
//             .filter(Boolean)
//             .sort();
//           setCompanyOptions(companies);
//         })
//         .catch((err) => console.error("회사 API 오류:", err));
//     }
//   };

//   // 직무 드롭다운 클릭 시: 회사 선택 여부에 따라 복원
//   const handlePositionClick = () => {
//     if (!selectedCompany) {
//       setPositionOptions([...rawPositionOptions]);
//     } else {
//       axios
//         .post("http://localhost:8000/get-detail-job-by-company", { company: selectedCompany })
//         .then((res) => {
//           const positions = res.data
//             .map((item) => item.detail_job)
//             .filter(Boolean)
//             .sort();
//           setPositionOptions(positions);
//         })
//         .catch((err) => console.error("직무 API 오류:", err));
//     }
//   };

//   // 회사 드롭다운에서 값 변경 시
//   const handleCompanyChange = (e) => {
//     const value = e.target.value;
//     setSelectedCompany(value);
//     if (!value) {
//       setPositionOptions([...rawPositionOptions]);
//       setSelectedPosition(""); // 회사 해제 시 직무도 해제!
//     }
//   };

//   // 직무 드롭다운에서 값 변경 시
//   const handlePositionChange = (e) => {
//     const value = e.target.value;
//     setSelectedPosition(value);
//     if (!value) {
//       setCompanyOptions([...rawCompanyOptions]);
//     }
//   };

//   // 합격자 스펙 정보 불러오기 (회사+직무 선택 시)
//   useEffect(() => {
//     if (selectedCompany && selectedPosition) {
//       axios.post("http://localhost:8000/get-applicants-by-company-detail-job", {
//         company: selectedCompany,
//         detail_job: selectedPosition,
//       })
//       .then((res) => {
//         setApplicants(res.data || []);
//         setCurrentApplicantIndex(0);
//       })
//       .catch((err) => {
//         setApplicants([]);
//         setCurrentApplicantIndex(0);
//         console.error("합격자 API 오류:", err);
//       });
//     } else {
//       setApplicants([]);
//       setCurrentApplicantIndex(0);
//     }
//   }, [selectedCompany, selectedPosition]);

//   // Carousel 핸들러
//   const handlePrevApplicant = () => {
//     setCurrentApplicantIndex((prev) =>
//       applicants.length === 0 ? 0 : (prev - 1 + applicants.length) % applicants.length
//     );
//   };
//   const handleNextApplicant = () => {
//     setCurrentApplicantIndex((prev) =>
//       applicants.length === 0 ? 0 : (prev + 1) % applicants.length
//     );
//   };

//   const currentApplicant = applicants[currentApplicantIndex];

//   // 합격자 스펙에서 보여줄 필드만 추출
//   const acceptedSpec = currentApplicant
//     ? {
//         school: currentApplicant.university ?? "",
//         grade: currentApplicant.gpa ?? "",
//         social: "",
//         language: currentApplicant.toeic ? `토익 ${currentApplicant.toeic}` : "",
//         award: "",
//         certificate: ""
//       }
//     : {
//         school: "서울대학교",
//         grade: "3.0 / 4.5",
//         social: "없음",
//         language: "텝스 100점",
//         award: "다이브 해커톤 1등",
//         certificate: "없음"
//       };

//   return (
//     <div className="container">
//       <h1 className="title">SpecTrackr</h1>

//       <div className="button-group">
//         <button
//           className={`btn ${activeTab === "회사 기준 검색" ? "selected" : ""}`}
//           onClick={() => {
//             setActiveTab("회사 기준 검색");
//             onCompanyTabClick && onCompanyTabClick();
//           }}
//         >
//           회사 기준 검색
//         </button>
//         <button
//           className={`btn ${activeTab === "스펙 기준 검색" ? "selected" : ""}`}
//           onClick={() => setActiveTab("스펙 기준 검색")}
//         >
//           스펙 기준 검색
//         </button>
//       </div>

//       <div className="outer-box">
//         <div className="select-row">
//           <div className="select-col">
//             <label className="select-label">회사를 선택하세요</label>
//             <select
//               className="select"
//               value={selectedCompany}
//               onMouseDown={handleCompanyClick}
//               onChange={handleCompanyChange}
//             >
//               <option value="">회사를 선택하세요</option>
//               {companyOptions.map((company, idx) => (
//                 <option key={idx} value={company}>
//                   {company}
//                 </option>
//               ))}
//             </select>
//           </div>
//           <div className="select-col">
//             <label className="select-label">직무를 선택하세요</label>
//             <select
//               className="select"
//               value={selectedPosition}
//               onMouseDown={handlePositionClick}
//               onChange={handlePositionChange}
//             >
//               <option value="">직무를 선택하세요</option>
//               {positionOptions.map((pos, idx) => (
//                 <option key={idx} value={pos}>
//                   {pos}
//                 </option>
//               ))}
//             </select>
//           </div>
//         </div>

//         <div className="spec-input-section">
//           <label className="spec-input-label">나의 스펙 입력</label>
//           <div className="spec-input-box">
//             {Object.entries(initialSpec).map(([key]) => (
//               <div key={key} className="spec-btn">
//                 {key}
//                 <input
//                   className="spec-input"
//                   type="text"
//                   value={mySpec[key]}
//                   placeholder={key}
//                   onChange={(e) => handleInput(key, e.target.value)}
//                 />
//               </div>
//             ))}
//           </div>
//         </div>

//         <div className="spec-compare-row">
//           <div className="spec-box">
//             <div className="spec-title">나의 스펙</div>
//             <div className="spec-content">
//               {Object.entries(mySpec).map(([key, value]) => (
//                 <div key={key}>
//                   {key} : {value || "없음"}
//                 </div>
//               ))}
//             </div>
//           </div>
//           <div className="spec-box">
//             <div className="spec-title">합격자 스펙</div>
//             <div className="spec-content">
//               <div style={{ display: "flex", alignItems: "center", justifyContent: "center" }}>
//                 <button
//                   className="carousel-arrow"
//                   onClick={handlePrevApplicant}
//                   disabled={applicants.length <= 1}
//                   style={{ marginRight: 8 }}
//                 >
//                   ◀
//                 </button>
//                 <div>
//                   {Object.entries(acceptedSpec).map(([key, value]) => (
//                     <div key={key}>
//                       {key} : {value || "없음"}
//                     </div>
//                   ))}
//                 </div>
//                 <button
//                   className="carousel-arrow"
//                   onClick={handleNextApplicant}
//                   disabled={applicants.length <= 1}
//                   style={{ marginLeft: 8 }}
//                 >
//                   ▶
//                 </button>
//               </div>
//               {applicants.length > 1 && (
//                 <div style={{ textAlign: "center", marginTop: 4, fontSize: 12 }}>
//                   {currentApplicantIndex + 1} / {applicants.length}
//                 </div>
//               )}
//             </div>
//           </div>
//         </div>

//         {/* 기업 추천 등 기존 company-section은 그대로 두세요 */}
//         <div className="company-section">
//           <label className="company-label">기업</label>
//           <div className="company-carousel">
//             <button className="carousel-arrow">◀</button>
//             <div className="carousel-content"></div>
//             <button className="carousel-arrow">▶</button>
//           </div>
//         </div>
//       </div>
//     </div>
//   );
// };

// export default SpCom;




import React, { useState, useEffect } from "react";
import axios from "axios";
import "./total.css";

const SpCom = ({ onCompanyTabClick }) => {
  const [activeTab, setActiveTab] = useState("스펙 기준 검색");
  const [selectedCompany, setSelectedCompany] = useState("");
  const [selectedPosition, setSelectedPosition] = useState("");
  const [companyOptions, setCompanyOptions] = useState([]);
  const [positionOptions, setPositionOptions] = useState([]);
  const [rawCompanyOptions, setRawCompanyOptions] = useState([]);
  const [rawPositionOptions, setRawPositionOptions] = useState([]);
  const [allSchools, setAllSchools] = useState([]); // ✅ 학교 목록

  const [applicants, setApplicants] = useState([]);
  const [currentApplicantIndex, setCurrentApplicantIndex] = useState(0);

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
    setMySpec((prev) => ({ ...prev, [key]: value }));
  };

  // ✅ 학교 목록 가져오기
  useEffect(() => {
    axios
      .get("/get-all-universities")  // 로컬에서 -> 배포된 주소로 변경
      .then((res) => {
        const schools = (res.data || []).filter(Boolean).sort();
        setAllSchools(schools);
      })
      .catch((err) => {
        console.error("대학교 목록 불러오기 오류:", err);
        setAllSchools([]);
      });
  }, []);
  

  useEffect(() => {
    axios
      .post("http://localhost:8000/get-companiy-by-detail-job", { detail_job: "" })
      .then((res) => {
        const companies = res.data.map((item) => item.company).filter(Boolean).sort();
        setRawCompanyOptions(companies);
        setCompanyOptions(companies);
      })
      .catch((err) => console.error("회사 API 오류:", err));
    axios
      .post("http://localhost:8000/get-detail-job-by-company", { company: "" })
      .then((res) => {
        const positions = res.data.map((item) => item.detail_job).filter(Boolean).sort();
        setRawPositionOptions(positions);
        setPositionOptions(positions);
      })
      .catch((err) => console.error("직무 API 오류:", err));
  }, []);

  useEffect(() => {
    if (selectedCompany) {
      axios
        .post("http://localhost:8000/get-detail-job-by-company", { company: selectedCompany })
        .then((res) => {
          const positions = res.data.map((item) => item.detail_job).filter(Boolean).sort();
          setPositionOptions(positions);
        })
        .catch((err) => console.error("직무 API 오류:", err));
    } else {
      setPositionOptions([...rawPositionOptions]);
    }
  }, [selectedCompany, rawPositionOptions]);

  useEffect(() => {
    if (selectedPosition) {
      axios
        .post("http://localhost:8000/get-companiy-by-detail-job", { detail_job: selectedPosition })
        .then((res) => {
          const companies = res.data.map((item) => item.company).filter(Boolean).sort();
          setCompanyOptions(companies);
        })
        .catch((err) => console.error("회사 API 오류:", err));
    } else {
      setCompanyOptions([...rawCompanyOptions]);
    }
  }, [selectedPosition, rawCompanyOptions]);

  const handleCompanyClick = () => {
    if (!selectedPosition) {
      setCompanyOptions([...rawCompanyOptions]);
    } else {
      axios
        .post("http://localhost:8000/get-companiy-by-detail-job", { detail_job: selectedPosition })
        .then((res) => {
          const companies = res.data.map((item) => item.company).filter(Boolean).sort();
          setCompanyOptions(companies);
        })
        .catch((err) => console.error("회사 API 오류:", err));
    }
  };

  const handlePositionClick = () => {
    if (!selectedCompany) {
      setPositionOptions([...rawPositionOptions]);
    } else {
      axios
        .post("http://localhost:8000/get-detail-job-by-company", { company: selectedCompany })
        .then((res) => {
          const positions = res.data.map((item) => item.detail_job).filter(Boolean).sort();
          setPositionOptions(positions);
        })
        .catch((err) => console.error("직무 API 오류:", err));
    }
  };

  const handleCompanyChange = (e) => {
    const value = e.target.value;
    setSelectedCompany(value);
    if (!value) {
      setPositionOptions([...rawPositionOptions]);
      setSelectedPosition("");
    }
  };

  const handlePositionChange = (e) => {
    const value = e.target.value;
    setSelectedPosition(value);
    if (!value) {
      setCompanyOptions([...rawCompanyOptions]);
    }
  };

  useEffect(() => {
    if (selectedCompany && selectedPosition) {
      axios
        .post("http://localhost:8000/get-applicants-by-company-detail-job", {
          company: selectedCompany,
          detail_job: selectedPosition,
        })
        .then((res) => {
          setApplicants(res.data || []);
          setCurrentApplicantIndex(0);
        })
        .catch((err) => {
          setApplicants([]);
          setCurrentApplicantIndex(0);
          console.error("합격자 API 오류:", err);
        });
    } else {
      setApplicants([]);
      setCurrentApplicantIndex(0);
    }
  }, [selectedCompany, selectedPosition]);

  const handlePrevApplicant = () => {
    setCurrentApplicantIndex((prev) =>
      applicants.length === 0 ? 0 : (prev - 1 + applicants.length) % applicants.length
    );
  };
  const handleNextApplicant = () => {
    setCurrentApplicantIndex((prev) =>
      applicants.length === 0 ? 0 : (prev + 1) % applicants.length
    );
  };

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

      <div className="outer-box">
        <div className="select-row">
          <div className="select-col">
            <label className="select-label">회사를 선택하세요</label>
            <select
              className="select"
              value={selectedCompany}
              onMouseDown={handleCompanyClick}
              onChange={handleCompanyChange}
            >
              <option value="">회사를 선택하세요</option>
              {companyOptions.map((company, idx) => (
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
              onMouseDown={handlePositionClick}
              onChange={handlePositionChange}
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
            {/* ✅ 학교는 드롭다운으로 */}
            <div className="spec-btn">
              school
              <select
                className="spec-input"
                value={mySpec.school}
                onChange={(e) => handleInput("school", e.target.value)}
              >
                <option value="">학교 선택</option>
                {allSchools.map((school, idx) => (
                  <option key={idx} value={school}>
                    {school}
                  </option>
                ))}
              </select>
            </div>
            {/* 나머지는 기존처럼 input */}
            {Object.entries(initialSpec).map(([key]) => {
              if (key === "school") return null;
              return (
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
              );
            })}
          </div>
        </div>

        <div className="spec-compare-row">
          <div className="spec-box">
            <div className="spec-title">나의 스펙</div>
            <div className="spec-content">
              {Object.entries(mySpec).map(([key, value]) => (
                <div key={key}>
                  {key} : {value || "없음"}
                </div>
              ))}
            </div>
          </div>
          <div className="spec-box">
            <div className="spec-title">합격자 스펙</div>
            <div className="spec-content">
              <div style={{ display: "flex", alignItems: "center", justifyContent: "center" }}>
                <button
                  className="carousel-arrow"
                  onClick={handlePrevApplicant}
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
                  onClick={handleNextApplicant}
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
