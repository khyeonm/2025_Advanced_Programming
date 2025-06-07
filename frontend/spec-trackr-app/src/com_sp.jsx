import React, { useState, useEffect } from "react";
import { FaArrowLeft } from "react-icons/fa";
import axios from "axios";
import {
  Card,
  Button,
  Form,
  Container,
  Badge,
  InputGroup,
  Row,
  Col
} from 'react-bootstrap';
import {
  FaSearch,
  FaBuilding,
  FaUserTie,
  FaMapMarkerAlt,
  FaGraduationCap,
  FaClock,
  FaAward,
  FaStar
} from "react-icons/fa";

// 직업 분류
const jobCategories = ["생산/제조", "연구개발/설계", "IT/인터넷"];

const ComSp = ({ onSpecTabClick }) => {
  const [selectedJobCategory, setSelectedJobCategory] = useState("");
  const [selectedCompany, setSelectedCompany] = useState("");
  const [selectedPosition, setSelectedPosition] = useState("");
  const [companyOptions, setCompanyOptions] = useState([]);
  const [positionOptions, setPositionOptions] = useState([]);
  const [rawOptions, setRawOptions] = useState([]);
  const [activeTab, setActiveTab] = useState("채용공고 검색");
  const [jobPostingResults, setJobPostingResults] = useState([]);
  const [companySearchTerm, setCompanySearchTerm] = useState(""); // 회사 검색어

  const filteredCompanyOptions = companyOptions.filter(company =>
    company.toLowerCase().includes(companySearchTerm.toLowerCase())
  );

  const CustomSelect = ({ options, value, onChange, placeholder }) => (
    <Form.Control
      as="select"
      value={value}
      onChange={(e) => onChange(e.target.value)}
      className="form-select"
    >
      <option value="">{placeholder}</option>
      {options.map((option, index) => (
        <option key={index} value={option}>{option}</option>
      ))}
    </Form.Control>
  );

  // 직업 카테고리 선택 시 관련 회사/직무 목록 가져오기
  useEffect(() => {
    if (selectedJobCategory) {
      axios
        .post(`${process.env.REACT_APP_API_URL}/get-company-name-and-detail-job`, {
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

  // 회사 선택 시 해당 회사에 맞는 직무만 필터링
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

   // 직무 선택 시 해당 직무를 포함한 회사만 필터링
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

  // 직업 카테고리 + 회사 + 직무 모두 선택 시 채용공고 불러오기
  useEffect(() => {
    if (selectedJobCategory && selectedCompany && selectedPosition) {
      axios
        .post(`${process.env.REACT_APP_API_URL}/get-job-posting`, {
          job_category: selectedJobCategory,
          company_name: selectedCompany,
          detail_job: selectedPosition,
        })
        .then((res) => {
          const uniqueResults = Array.from(new Map(res.data.map(item => [JSON.stringify(item), item])).values());
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

  return (
    <Container className="mb-5">
      <div style={{
        position: "absolute",
        top: 24,
        left: 24,
        display: "flex",
        alignItems: "center",
        zIndex: 10
      }}>
        <Button
          variant="outline-dark"
          style={{ display: "flex", alignItems: "center", gap: 6, fontWeight: 500 }}
          onClick={() => { window.location.href = "http://localhost:3003"; }}
        >
          <FaArrowLeft style={{ fontSize: 18 }} />
          메인으로
        </Button>
      </div>
      {/* 상단 중앙 제목 */}
      <div className="text-center my-5">
        <h1 className="display-4 fw-bold mb-2" style={{ fontWeight: 700 }}>SpecTrackr</h1>
        <div className="lead" style={{ fontWeight: 300 }}>
          채용 공고 검색과 스펙 분석을 한 번에
        </div>
      </div>

      {/* 상단 탭 버튼 */}
      <Row className="mb-4" style={{ marginLeft: 0, marginRight: 0 }}>
        <Col xs={6} className="p-0">
          <Button
            className="w-100 py-3 rounded-0 rounded-start"
            variant={activeTab === "채용공고 검색" ? "dark" : "outline-dark"}
            onClick={() => setActiveTab("채용공고 검색")}
            style={{ fontSize: "1.2rem", fontWeight: 500, borderRight: 0 }}
          >
            채용공고 검색
          </Button>
        </Col>
        <Col xs={6} className="p-0">
          <Button
            className="w-100 py-3 rounded-0 rounded-end"
            variant={activeTab === "스펙 검색" ? "dark" : "outline-dark"}
            onClick={() => {
              setActiveTab("스펙 검색");
              if (onSpecTabClick) onSpecTabClick();
            }}
            style={{ fontSize: "1.2rem", fontWeight: 500 }}
          >
            스펙 검색
          </Button>
        </Col>
      </Row>

      {/* 조건부 렌더링: 채용공고 검색 탭만 아래 UI 표시 */}
      {activeTab === "채용공고 검색" && (
        <>
          {/* 직업 분류 선택 */}
          <Card className="mb-4">
            <Card.Body>
              <div className="fw-bold fs-5 mb-3" style={{ display: "flex", alignItems: "center", gap: 8 }}>
                <span role="img" aria-label="category">🗂️</span>
                직업 분류 선택
              </div>
              <div className="d-flex flex-wrap gap-2">
                {jobCategories.map((category) => (
                  <Button
                    key={category}
                    variant={selectedJobCategory === category ? "dark" : "outline-dark"}
                    onClick={() => setSelectedJobCategory(category)}
                  >
                    {category}
                  </Button>
                ))}
              </div>
            </Card.Body>
          </Card>

          {/* 회사/직무 선택 */}
          <Row className="g-4 mb-4">
            <Col md={6}>
              <Card>
                <Card.Body>
                  <div className="fw-bold fs-5 mb-3" style={{ display: "flex", alignItems: "center", gap: 8 }}>
                    <FaBuilding className="me-2" />
                    회사 선택
                  </div>
                  <Form.Group>
                    <Form.Label className="fw-bold">회사 검색</Form.Label>
                    <InputGroup>
                      <InputGroup.Text>
                        <FaSearch />
                      </InputGroup.Text>
                      <Form.Control
                        placeholder="회사명을 입력하세요"
                        value={companySearchTerm}
                        onChange={(e) => setCompanySearchTerm(e.target.value)}
                      />
                    </InputGroup>
                  </Form.Group>
                  <Form.Group className="mt-3">
                    <Form.Label className="fw-bold">회사 선택</Form.Label>
                    <CustomSelect
                      options={filteredCompanyOptions}
                      value={selectedCompany}
                      onChange={setSelectedCompany}
                      placeholder="회사를 선택하세요"
                    />
                  </Form.Group>
                </Card.Body>
              </Card>
            </Col>
            <Col md={6}>
              <Card>
                <Card.Body>
                  <div className="fw-bold fs-5 mb-3" style={{ display: "flex", alignItems: "center", gap: 8 }}>
                    <FaUserTie className="me-2" />
                    직무 선택
                  </div>
                  <Form.Group>
                    <Form.Label className="fw-bold">직무 선택</Form.Label>
                    <CustomSelect
                      options={positionOptions}
                      value={selectedPosition}
                      onChange={setSelectedPosition}
                      placeholder="직무를 선택하세요"
                    />
                  </Form.Group>
                </Card.Body>
              </Card>
            </Col>
          </Row>

          {/* 채용공고 결과 */}
          <Card>
            <Card.Body>
              <div className="fw-bold fs-5 mb-3" style={{ display: "flex", alignItems: "center", gap: 8 }}>
                <span role="img" aria-label="posting">📄</span>
                채용 공고
              </div>
              <div style={{ maxHeight: "500px", overflowY: "auto" }}>
                {selectedJobCategory && selectedCompany && selectedPosition ? (
                  jobPostingResults.length > 0 ? (
                    <div className="d-grid gap-4">
                      {jobPostingResults.map((posting, index) => {
                        const isValidImage =
                          posting.image &&
                          posting.image !== "null" &&
                          posting.image !== null &&
                          posting.image.trim() !== "";

                        return (
                          <Card key={index}>
                            <Card.Body>
                              {isValidImage ? (
                                // 이미지가 있을 때: 이미지만 보여줌
                                <div className="mb-4 text-center">
                                  <a
                                    href={posting.image}
                                    target="_blank"
                                    rel="noopener noreferrer"
                                    style={{ display: "block" }}
                                  >
                                    <img
                                      src={posting.image}
                                      alt="채용 이미지"
                                      className="img-fluid rounded"
                                      style={{
                                        width: "80%",
                                        height: "auto",
                                        objectFit: "contain",
                                        display: "block",
                                        marginLeft: "auto",
                                        marginRight: "auto",
                                        cursor: "pointer"
                                      }}
                                      onError={e => {
                                        e.target.onerror = null;
                                        e.target.style.display = "none";
                                      }}
                                    />
                                  </a>
                                </div>
                              ) : (
                                // 이미지가 없을 때: 텍스트 정보 전체 제공
                                <>
                                  <div className="d-flex justify-content-between align-items-start mb-3">
                                    <div>
                                      <h5 className="fw-bold">{selectedCompany}</h5>
                                      <Badge bg="secondary" className="mb-2">{selectedPosition}</Badge>
                                    </div>
                                  </div>
                                  <div className="row g-3 mb-3">
                                    <div className="col-md-6">
                                      <FaMapMarkerAlt className="me-2" />
                                      {posting.location}
                                    </div>
                                    <div className="col-md-6">
                                      <FaGraduationCap className="me-2" />
                                      {posting.education_level}
                                    </div>
                                    <div className="col-md-6">
                                      <FaClock className="me-2" />
                                      {posting.experience}
                                    </div>
                                  </div>
                                  <div className="mb-3">
                                    <div className="d-flex align-items-center mb-2">
                                      <FaAward className="me-2 text-muted" />
                                      <h6 className="m-0 fw-bold">요구사항</h6>
                                    </div>
                                    <ul className="list-unstyled">
                                      {posting.etc_requirements
                                        ?.split(/[•■ㅁㅇㆍ·*＞-]\s*/)
                                        .filter(item => item.trim() !== "")
                                        .map((req, idx) => (
                                          <li key={idx} className="mb-1">
                                            • {req.trim()}
                                          </li>
                                        ))}
                                    </ul>
                                  </div>
                                  <div>
                                    <div className="d-flex align-items-center mb-2">
                                      <FaStar className="me-2 text-muted" />
                                      <h6 className="m-0 fw-bold">우대사항</h6>
                                    </div>
                                    <p className="m-0">
                                      {posting.preferred_qualification || "우대사항이 없습니다"}
                                    </p>
                                  </div>
                                </>
                              )}
                            </Card.Body>
                          </Card>
                        );
                      })}
                    </div>
                  ) : (
                    <div className="text-center py-5 text-muted">
                      <FaBuilding className="display-5 mb-3" />
                      <p>해당 조건에 대한 채용 공고가 없습니다.</p>
                    </div>
                  )
                ) : (
                  <div className="text-center py-5 text-muted">
                    <FaBuilding className="display-5 mb-3" />
                    <p>직업 분류, 회사, 직무를 모두 선택해주세요</p>
                  </div>
                )}
              </div>
            </Card.Body>
          </Card>
        </>
      )}
    </Container>
  );
};

export default ComSp;
