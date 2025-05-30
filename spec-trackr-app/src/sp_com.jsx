// import React, { useState, useEffect } from "react";
// import axios from "axios";
// import "./sp_com.css";

// const SpCom = ({ onCompanyTabClick }) => {
//   const [activeTab, setActiveTab] = useState("스펙 기준 검색");
//   const [selectedCompany, setSelectedCompany] = useState("");
//   const [selectedPosition, setSelectedPosition] = useState("");
//   const [companyOptions, setCompanyOptions] = useState([]);
//   const [positionOptions, setPositionOptions] = useState([]);
//   const [rawOptions, setRawOptions] = useState([]);

//   const initialSpec = {
//     school: "",
//     grade: "",
//     social: "",
//     language: "",
//     award: "",
//     certificate: ""
//   };
//   const [mySpec, setMySpec] = useState(initialSpec);

//   const acceptedSpec = {
//     school: "서울대학교",
//     grade: "3.0 / 4.5",
//     social: "없음",
//     language: "텝스 100점",
//     award: "다이브 해커톤 1등",
//     certificate: "없음"
//   };

//   const handleInput = (key, value) => {
//     setMySpec((prev) => ({ ...prev, [key]: value }));
//   };

//   // 전체 회사 및 직무 목록 불러오기
//   useEffect(() => {
//     axios.post("http://localhost:8000/get-company-name-and-detail-job", {
//       job_category: ""
//     })
//     .then((res) => {
//       const data = res.data;
//       setRawOptions(data);
//       setCompanyOptions([...new Set(data.map(item => item.company_name))].sort());
//       setPositionOptions([...new Set(data.map(item => item.detail_job))].sort());
//     })
//     .catch((err) => console.error("API 오류:", err));
//   }, []);

//   // 회사 선택 시 직무 목록 업데이트
//   useEffect(() => {
//     if (selectedCompany) {
//       const filtered = rawOptions.filter(item => item.company_name === selectedCompany);
//       setPositionOptions([...new Set(filtered.map(item => item.detail_job))].sort());
//     } else {
//       setPositionOptions([...new Set(rawOptions.map(item => item.detail_job))].sort());
//     }
//   }, [selectedCompany, rawOptions]);

//   // 직무 선택 시 회사 목록 업데이트
//   useEffect(() => {
//     if (selectedPosition) {
//       const filtered = rawOptions.filter(item => item.detail_job === selectedPosition);
//       setCompanyOptions([...new Set(filtered.map(item => item.company_name))].sort());
//     } else {
//       setCompanyOptions([...new Set(rawOptions.map(item => item.company_name))].sort());
//     }
//   }, [selectedPosition, rawOptions]);

//   const handleCompanyClick = () => {
//     setCompanyOptions([...new Set(rawOptions.map(item => item.company_name))].sort());
//   };

//   const handlePositionClick = () => {
//     if (selectedCompany) {
//       const filtered = rawOptions.filter(item => item.company_name === selectedCompany);
//       setPositionOptions([...new Set(filtered.map(item => item.detail_job))].sort());
//     }
//   };

//   return (
//     <div className="container2">
//       <h1 className="title2">SpecTrackr</h1>

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

//       <div className="outer-box2">
//         <div className="select-row2">
//           <div className="select-col2">
//             <label className="select-label2">회사를 선택하세요</label>
//             <select
//               className="select2"
//               value={selectedCompany}
//               onMouseDown={handleCompanyClick}
//               onChange={(e) => setSelectedCompany(e.target.value)}
//             >
//               <option value="">회사를 선택하세요</option>
//               {companyOptions.map((company, idx) => (
//                 <option key={idx} value={company}>{company}</option>
//               ))}
//             </select>
//           </div>
//           <div className="select-col2">
//             <label className="select-label2">직무를 선택하세요</label>
//             <select
//               className="select2"
//               value={selectedPosition}
//               onClick={handlePositionClick}
//               onChange={(e) => setSelectedPosition(e.target.value)}
//             >
//               <option value="">직무를 선택하세요</option>
//               {positionOptions.map((pos, idx) => (
//                 <option key={idx} value={pos}>{pos}</option>
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
//                 <div key={key}>{key} : {value || "없음"}</div>
//               ))}
//             </div>
//           </div>
//           <div className="spec-box">
//             <div className="spec-title">합격자 스펙</div>
//             <div className="spec-content">
//               {Object.entries(acceptedSpec).map(([key, value]) => (
//                 <div key={key}>{key} : {value}</div>
//               ))}
//             </div>
//           </div>
//         </div>

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

// import React, { useState, useEffect } from "react";
// import axios from "axios";
// import "./sp_com.css";

// const SpCom = ({ onCompanyTabClick }) => {
//   const [activeTab, setActiveTab] = useState("스펙 기준 검색");
//   const [selectedCompany, setSelectedCompany] = useState("");
//   const [selectedPosition, setSelectedPosition] = useState("");
//   const [companyOptions, setCompanyOptions] = useState([]);
//   const [positionOptions, setPositionOptions] = useState([]);
//   const [rawCompanyOptions, setRawCompanyOptions] = useState([]);
//   const [rawPositionOptions, setRawPositionOptions] = useState([]);

//   const initialSpec = {
//     school: "",
//     grade: "",
//     social: "",
//     language: "",
//     award: "",
//     certificate: ""
//   };
//   const [mySpec, setMySpec] = useState(initialSpec);

//   const acceptedSpec = {
//     school: "서울대학교",
//     grade: "3.0 / 4.5",
//     social: "없음",
//     language: "텝스 100점",
//     award: "다이브 해커톤 1등",
//     certificate: "없음"
//   };

//   const handleInput = (key, value) => {
//     setMySpec((prev) => ({ ...prev, [key]: value }));
//   };

//   // 최초: 모든 회사/직무 목록 불러오기 (가나다순)
//   useEffect(() => {
//     axios
//       .post("http://localhost:8000/get-companiy-by-detail-job", { detail_job: "" })
//       .then((res) => {
//         const companies = res.data
//           .map((item) => item.company)
//           .filter(Boolean)
//           .sort((a, b) => a.localeCompare(b));
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
//           .sort((a, b) => a.localeCompare(b));
//         setRawPositionOptions(positions);
//         setPositionOptions(positions);
//       })
//       .catch((err) => console.error("직무 API 오류:", err));
//   }, []);

//   // 회사 선택 시: 해당 회사의 직무만 (가나다순)
//   useEffect(() => {
//     if (selectedCompany) {
//       axios
//         .post("http://localhost:8000/get-detail-job-by-company", { company: selectedCompany })
//         .then((res) => {
//           const positions = res.data
//             .map((item) => item.detail_job)
//             .filter(Boolean)
//             .sort((a, b) => a.localeCompare(b));
//           setPositionOptions(positions);
//         })
//         .catch((err) => console.error("직무 API 오류:", err));
//     } else {
//       setPositionOptions([...rawPositionOptions]);
//     }
//   }, [selectedCompany, rawPositionOptions]);

//   // 직무 선택 시: 해당 직무의 회사만 (가나다순)
//   useEffect(() => {
//     if (selectedPosition) {
//       axios
//         .post("http://localhost:8000/get-companiy-by-detail-job", { detail_job: selectedPosition })
//         .then((res) => {
//           const companies = res.data
//             .map((item) => item.company)
//             .filter(Boolean)
//             .sort((a, b) => a.localeCompare(b));
//           setCompanyOptions(companies);
//         })
//         .catch((err) => console.error("회사 API 오류:", err));
//     } else {
//       setCompanyOptions([...rawCompanyOptions]);
//     }
//   }, [selectedPosition, rawCompanyOptions]);

//   // 회사 드롭다운 클릭 시
//   const handleCompanyClick = () => {
//     // 5. 직무 미선택: (회사 선택 여부와 무관) 모든 회사 출력
//     if (!selectedPosition) {
//       setCompanyOptions([...rawCompanyOptions]);
//     }
//     // 6. 직무 선택: (회사 선택 여부와 무관) 해당 직무를 가지는 모든 회사 출력
//     else {
//       axios
//         .post("http://localhost:8000/get-companiy-by-detail-job", { detail_job: selectedPosition })
//         .then((res) => {
//           const companies = res.data
//             .map((item) => item.company)
//             .filter(Boolean)
//             .sort((a, b) => a.localeCompare(b));
//           setCompanyOptions(companies);
//         })
//         .catch((err) => console.error("회사 API 오류:", err));
//     }
//   };

//   // 직무 드롭다운 클릭 시
//   const handlePositionClick = () => {
//     // 2. 회사/직무 모두 미선택: 모든 직무 출력
//     if (!selectedCompany) {
//       setPositionOptions([...rawPositionOptions]);
//     }
//     // 3. 회사만 선택: 해당 회사의 모든 직무 출력
//     else {
//       axios
//         .post("http://localhost:8000/get-detail-job-by-company", { company: selectedCompany })
//         .then((res) => {
//           const positions = res.data
//             .map((item) => item.detail_job)
//             .filter(Boolean)
//             .sort((a, b) => a.localeCompare(b));
//           setPositionOptions(positions);
//         })
//         .catch((err) => console.error("직무 API 오류:", err));
//     }
//   };

//   // 회사 드롭다운에서 값 변경 시
//   const handleCompanyChange = (e) => {
//     const value = e.target.value;
//     setSelectedCompany(value);
//     // 선택 해제 시 직무 전체 복원
//     if (!value) setPositionOptions([...rawPositionOptions]);
//     setSelectedPosition(""); // 회사 해제 시 직무도 해제!
//   };

//   // 직무 드롭다운에서 값 변경 시
//   const handlePositionChange = (e) => {
//     const value = e.target.value;
//     setSelectedPosition(value);
//     // 선택 해제 시 회사 전체 복원
//     if (!value) setCompanyOptions([...rawCompanyOptions]);
//   };

//   return (
//     <div className="container2">
//       <h1 className="title2">SpecTrackr</h1>

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

//       <div className="outer-box2">
//         <div className="select-row2">
//           <div className="select-col2">
//             <label className="select-label2">회사를 선택하세요</label>
//             <select
//               className="select2"
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
//           <div className="select-col2">
//             <label className="select-label2">직무를 선택하세요</label>
//             <select
//               className="select2"
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
//               {Object.entries(acceptedSpec).map(([key, value]) => (
//                 <div key={key}>
//                   {key} : {value}
//                 </div>
//               ))}
//             </div>
//           </div>
//         </div>

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

  // 합격자 스펙 carousel 상태
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

  // 최초: 모든 회사/직무 목록 불러오기 (기본 정렬)
  useEffect(() => {
    axios
      .post("http://localhost:8000/get-companiy-by-detail-job", { detail_job: "" })
      .then((res) => {
        const companies = res.data
          .map((item) => item.company)
          .filter(Boolean)
          .sort();
        setRawCompanyOptions(companies);
        setCompanyOptions(companies);
      })
      .catch((err) => console.error("회사 API 오류:", err));
    axios
      .post("http://localhost:8000/get-detail-job-by-company", { company: "" })
      .then((res) => {
        const positions = res.data
          .map((item) => item.detail_job)
          .filter(Boolean)
          .sort();
        setRawPositionOptions(positions);
        setPositionOptions(positions);
      })
      .catch((err) => console.error("직무 API 오류:", err));
  }, []);

  // 회사 선택 시: 해당 회사의 직무만
  useEffect(() => {
    if (selectedCompany) {
      axios
        .post("http://localhost:8000/get-detail-job-by-company", { company: selectedCompany })
        .then((res) => {
          const positions = res.data
            .map((item) => item.detail_job)
            .filter(Boolean)
            .sort();
          setPositionOptions(positions);
        })
        .catch((err) => console.error("직무 API 오류:", err));
    } else {
      setPositionOptions([...rawPositionOptions]);
    }
  }, [selectedCompany, rawPositionOptions]);

  // 직무 선택 시: 해당 직무의 회사만
  useEffect(() => {
    if (selectedPosition) {
      axios
        .post("http://localhost:8000/get-companiy-by-detail-job", { detail_job: selectedPosition })
        .then((res) => {
          const companies = res.data
            .map((item) => item.company)
            .filter(Boolean)
            .sort();
          setCompanyOptions(companies);
        })
        .catch((err) => console.error("회사 API 오류:", err));
    } else {
      setCompanyOptions([...rawCompanyOptions]);
    }
  }, [selectedPosition, rawCompanyOptions]);

  // 회사 드롭다운 클릭 시: 항상 전체 복원
  const handleCompanyClick = () => {
    if (!selectedPosition) {
      setCompanyOptions([...rawCompanyOptions]);
    } else {
      axios
        .post("http://localhost:8000/get-companiy-by-detail-job", { detail_job: selectedPosition })
        .then((res) => {
          const companies = res.data
            .map((item) => item.company)
            .filter(Boolean)
            .sort();
          setCompanyOptions(companies);
        })
        .catch((err) => console.error("회사 API 오류:", err));
    }
  };

  // 직무 드롭다운 클릭 시: 회사 선택 여부에 따라 복원
  const handlePositionClick = () => {
    if (!selectedCompany) {
      setPositionOptions([...rawPositionOptions]);
    } else {
      axios
        .post("http://localhost:8000/get-detail-job-by-company", { company: selectedCompany })
        .then((res) => {
          const positions = res.data
            .map((item) => item.detail_job)
            .filter(Boolean)
            .sort();
          setPositionOptions(positions);
        })
        .catch((err) => console.error("직무 API 오류:", err));
    }
  };

  // 회사 드롭다운에서 값 변경 시
  const handleCompanyChange = (e) => {
    const value = e.target.value;
    setSelectedCompany(value);
    if (!value) {
      setPositionOptions([...rawPositionOptions]);
      setSelectedPosition(""); // 회사 해제 시 직무도 해제!
    }
  };

  // 직무 드롭다운에서 값 변경 시
  const handlePositionChange = (e) => {
    const value = e.target.value;
    setSelectedPosition(value);
    if (!value) {
      setCompanyOptions([...rawCompanyOptions]);
    }
  };

  // 합격자 스펙 정보 불러오기 (회사+직무 선택 시)
  useEffect(() => {
    if (selectedCompany && selectedPosition) {
      axios.post("http://localhost:8000/get-applicants-by-company-detail-job", {
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

  // Carousel 핸들러
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

  // 합격자 스펙에서 보여줄 필드만 추출
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

        {/* 기업 추천 등 기존 company-section은 그대로 두세요 */}
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
