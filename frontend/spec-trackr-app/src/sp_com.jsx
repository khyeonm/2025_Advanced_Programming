import React, { useState, useEffect } from "react";
import axios from "axios";
import {
  Card,
  Button,
  Form,
  Container,
  Row,
  Col,
  InputGroup
} from "react-bootstrap";
import { FaSearch, FaBuilding, FaUserTie, FaUser, FaArrowLeft, FaArrowRight } from "react-icons/fa";
import TableauEmbed from "./TableauEmbed";

const initialSpec = {
  school: "",
  grade: "",
  social: "",
  language: "",
  award: "",
  certificate: ""
};

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
  const [carouselIndex, setCarouselIndex] = useState(0);
  const [companySearch, setCompanySearch] = useState("");
  const [schoolSearch, setSchoolSearch] = useState("");
  const [mySpec, setMySpec] = useState(initialSpec);

  // 필터링
  const filteredCompanies = companyOptions.filter(company =>
    company.toLowerCase().includes(companySearch.toLowerCase())
  );
  const filteredSchools = allSchools.filter(school =>
    school.toLowerCase().includes(schoolSearch.toLowerCase())
  );

  const handleInput = (key, value) => {
    setMySpec(prev => ({ ...prev, [key]: value }));
  };

  // 학교 목록 불러오기
  useEffect(() => {
    axios
      .get(`${process.env.REACT_APP_API_URL}/get-all-universities`)
      .then(res => setAllSchools((res.data || []).filter(Boolean).sort()))
      .catch(() => setAllSchools([]));
  }, []);

  // 회사/직무 전체 목록 불러오기
  useEffect(() => {
    axios
      .post(`${process.env.REACT_APP_API_URL}/get-company-by-detail-job`, { detail_job: "" })
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

  // 회사 선택 시 직무 필터
  useEffect(() => {
    if (selectedCompany) {
      axios
        .post(`${process.env.REACT_APP_API_URL}/get-detail-job-by-company`, { company: selectedCompany })
        .then(res => setPositionOptions(res.data.map(i => i.detail_job).filter(Boolean).sort()));
    } else {
      setPositionOptions(rawPositionOptions);
    }
  }, [selectedCompany, rawPositionOptions]);

  // 직무 선택 시 회사 필터
  useEffect(() => {
    if (selectedPosition) {
      axios
        .post(`${process.env.REACT_APP_API_URL}/get-company-by-detail-job`, { detail_job: selectedPosition })
        .then(res => setCompanyOptions(res.data.map(i => i.company).filter(Boolean).sort()));
    } else {
      setCompanyOptions(rawCompanyOptions);
    }
  }, [selectedPosition, rawCompanyOptions]);

  // 회사+직무 선택 시 합격자 불러오기
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
        .catch(() => setApplicants([]));
    } else {
      setApplicants([]);
    }
  }, [selectedCompany, selectedPosition]);

  // 내 학교 기준 추천 기업
  useEffect(() => {
    if (mySpec.school) {
      axios
        .post(`${process.env.REACT_APP_API_URL}/get-applicants-by-school`, { university: mySpec.school })
        .then(res => {
          setRecommendedApplicants(res.data || []);
          setCarouselIndex(0);
        })
        .catch(() => setRecommendedApplicants([]));
    } else {
      setRecommendedApplicants([]);
    }
  }, [mySpec.school]);

  // 합격자 스펙
  const currentApplicant = applicants[currentApplicantIndex];
  const acceptedSpec = currentApplicant
    ? {
        school: currentApplicant.university || "",
        grade: currentApplicant.gpa || "",
        social: "",
        language: currentApplicant.toeic ? `토익 ${currentApplicant.toeic}` : "",
        award: "",
        certificate: ""
      }
    : initialSpec;

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

      <Row className="mb-4" style={{ marginLeft: 0, marginRight: 0 }}>
        <Col xs={6} className="p-0">
          <Button
            className="w-100 py-3 rounded-0 rounded-start"
            variant={activeTab === "채용공고 검색" ? "dark" : "outline-dark"}
            onClick={() => {
              setActiveTab("채용공고 검색");
              if (onCompanyTabClick) onCompanyTabClick();
            }}
            style={{ fontSize: "1.2rem", fontWeight: 500 }}
          >
            채용공고 검색
          </Button>
        </Col>
        <Col xs={6} className="p-0">
          <Button
            className="w-100 py-3 rounded-0 rounded-end"
            variant={activeTab === "스펙 검색" ? "dark" : "outline-dark"}
            onClick={() => setActiveTab("스펙 검색")}
            style={{ fontSize: "1.2rem", fontWeight: 500 }}
          >
            스펙 검색
          </Button>
        </Col>
      </Row>

      {/* 조건부 렌더링: 스펙 검색 탭만 아래 UI 표시 */}
      {activeTab === "스펙 검색" && (
        <>
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
                        value={companySearch}
                        onChange={e => setCompanySearch(e.target.value)}
                      />
                    </InputGroup>
                  </Form.Group>
                  <Form.Group className="mt-3">
                    <Form.Label className="fw-bold">회사 선택</Form.Label>
                    <Form.Select
                      value={selectedCompany}
                      onChange={e => setSelectedCompany(e.target.value)}
                    >
                      <option value="">회사를 선택하세요</option>
                      {filteredCompanies.map((company, idx) => (
                        <option key={idx} value={company}>
                          {company}
                        </option>
                      ))}
                    </Form.Select>
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
                    <Form.Select
                      value={selectedPosition}
                      onChange={e => setSelectedPosition(e.target.value)}
                    >
                      <option value="">직무를 선택하세요</option>
                      {positionOptions.map((pos, idx) => (
                        <option key={idx} value={pos}>
                          {pos}
                        </option>
                      ))}
                    </Form.Select>
                  </Form.Group>
                </Card.Body>
              </Card>
            </Col>
          </Row>

          {/* 나의 스펙 입력 */}
          <Card className="mb-4">
            <Card.Body>
              <div className="fw-bold fs-5 mb-3" style={{ display: "flex", alignItems: "center", gap: 8 }}>
                <FaUser className="me-2" />
                나의 스펙 입력
              </div>
              <Form>
                <Row className="g-4">
                  {/* 학교 및 학점 */}
                  <Col md={6}>
                    <Form.Group className="mb-3">
                      <Form.Label className="fw-semibold">학교</Form.Label>
                      <InputGroup className="mb-2">
                        <Form.Control
                          type="text"
                          placeholder="학교 검색"
                          value={schoolSearch}
                          onChange={e => setSchoolSearch(e.target.value)}
                        />
                      </InputGroup>
                      <Form.Select
                        value={mySpec.school}
                        onChange={e => handleInput("school", e.target.value)}
                      >
                        <option value="">학교 선택</option>
                        {filteredSchools.map((school, idx) => (
                          <option key={idx} value={school}>
                            {school}
                          </option>
                        ))}
                      </Form.Select>
                    </Form.Group>
                  </Col>
                  <Col md={6}>
                    <Form.Group className="mb-3">
                      <Form.Label className="fw-semibold">학점 (Grade)</Form.Label>
                      <Form.Control
                        type="text"
                        placeholder="학점을 입력하세요"
                        value={mySpec.grade}
                        onChange={e => handleInput("grade", e.target.value)}
                      />
                    </Form.Group>
                  </Col>
                  <Col md={6}>
                    <Form.Group className="mb-3">
                      <Form.Label className="fw-semibold">사회경험 (Social)</Form.Label>
                      <Form.Control
                        type="text"
                        placeholder="사회경험을 입력하세요"
                        value={mySpec.social}
                        onChange={e => handleInput("social", e.target.value)}
                      />
                    </Form.Group>
                  </Col>
                  <Col md={6}>
                    <Form.Group className="mb-3">
                      <Form.Label className="fw-semibold">어학 (Language)</Form.Label>
                      <Form.Control
                        type="text"
                        placeholder="어학 성적/자격 입력"
                        value={mySpec.language}
                        onChange={e => handleInput("language", e.target.value)}
                      />
                    </Form.Group>
                  </Col>
                  <Col md={6}>
                    <Form.Group className="mb-3">
                      <Form.Label className="fw-semibold">수상 (Award)</Form.Label>
                      <Form.Control
                        type="text"
                        placeholder="수상 내역 입력"
                        value={mySpec.award}
                        onChange={e => handleInput("award", e.target.value)}
                      />
                    </Form.Group>
                  </Col>
                  <Col md={6}>
                    <Form.Group className="mb-3">
                      <Form.Label className="fw-semibold">자격증 (Certificate)</Form.Label>
                      <Form.Control
                        type="text"
                        placeholder="자격증 입력"
                        value={mySpec.certificate}
                        onChange={e => handleInput("certificate", e.target.value)}
                      />
                    </Form.Group>
                  </Col>
                </Row>
              </Form>
            </Card.Body>
          </Card>

          {/* 나의 스펙 / 합격자 스펙 비교 표 */}
          <Card className="mb-4">
            <Card.Body>
              <div className="fw-bold fs-5 mb-4" style={{ display: "flex", alignItems: "center", gap: 14 }}>
                <span role="img" aria-label="vs" style={{ fontSize: "1.5rem" }}>🆚</span>
                나의 스펙 vs 합격자 스펙
                <div style={{ marginLeft: "auto", display: "flex", alignItems: "center", gap: 8 }}>
                  <Button
                    size="sm"
                    variant="outline-secondary"
                    onClick={() =>
                      setCurrentApplicantIndex(prev =>
                        applicants.length === 0 ? 0 : (prev - 1 + applicants.length) % applicants.length
                      )
                    }
                    disabled={applicants.length <= 1}
                  >
                    <FaArrowLeft />
                  </Button>
                  <span className="fw-semibold" style={{ minWidth: 48, textAlign: "center" }}>
                    {applicants.length > 0 ? `${currentApplicantIndex + 1} / ${applicants.length}` : "0 / 0"}
                  </span>
                  <Button
                    size="sm"
                    variant="outline-secondary"
                    onClick={() =>
                      setCurrentApplicantIndex(prev =>
                        applicants.length === 0 ? 0 : (prev + 1) % applicants.length
                      )
                    }
                    disabled={applicants.length <= 1}
                  >
                    <FaArrowRight />
                  </Button>
                </div>
              </div>
              <div className="table-responsive">
                <table className="table table-bordered align-middle mb-0">
                  <thead className="table-light">
                    <tr>
                      <th className="text-center fw-bold" style={{ width: "25%" }}>구분</th>
                      <th className="text-center fw-bold" style={{ width: "37.5%" }}>나의 스펙</th>
                      <th className="text-center fw-bold" style={{ width: "37.5%" }}>합격자 스펙</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td className="text-center fw-semibold">학교</td>
                      <td className="text-center">{mySpec.school || "없음"}</td>
                      <td className="text-center">{acceptedSpec.school || "없음"}</td>
                    </tr>
                    <tr>
                      <td className="text-center fw-semibold">학점</td>
                      <td className="text-center">{mySpec.grade || "없음"}</td>
                      <td className="text-center">{acceptedSpec.grade || "없음"}</td>
                    </tr>
                    <tr>
                      <td className="text-center fw-semibold">사회경험</td>
                      <td className="text-center">{mySpec.social || "없음"}</td>
                      <td className="text-center">{acceptedSpec.social || "없음"}</td>
                    </tr>
                    <tr>
                      <td className="text-center fw-semibold">어학</td>
                      <td className="text-center">{mySpec.language || "없음"}</td>
                      <td className="text-center">{acceptedSpec.language || "없음"}</td>
                    </tr>
                    <tr>
                      <td className="text-center fw-semibold">수상</td>
                      <td className="text-center">{mySpec.award || "없음"}</td>
                      <td className="text-center">{acceptedSpec.award || "없음"}</td>
                    </tr>
                    <tr>
                      <td className="text-center fw-semibold">자격증</td>
                      <td className="text-center">{mySpec.certificate || "없음"}</td>
                      <td className="text-center">{acceptedSpec.certificate || "없음"}</td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </Card.Body>
          </Card>

          {/* 추천 기업 */}
          <Card className="mb-4">
            <Card.Body>
              <div className="fw-bold fs-5 mb-3" style={{ display: "flex", alignItems: "center", gap: 14 }}>
                <span role="img" aria-label="company" style={{ fontSize: "1.5rem" }}>🏢</span>
                추천 기업
              </div>
              <div
                style={{
                  display: "flex",
                  overflowX: "auto",
                  gap: "12px",
                  paddingBottom: "8px"
                }}
              >
                {recommendedApplicants.map((rec, idx) => (
                  <Card
                    key={idx}
                    className="p-2 text-center"
                    style={{
                      minWidth: 140,
                      maxWidth: 140,
                      flex: "0 0 auto",
                      height: 100,
                      display: "flex",
                      flexDirection: "column",
                      justifyContent: "center"
                    }}
                  >
                    <div className="fw-bold">{rec.company}</div>
                    <div style={{ fontSize: 13 }}>{rec.detail_job}</div>
                  </Card>
                ))}
              </div>
            </Card.Body>
          </Card>

          {/* 직무별 스펙 */}
          <Card>
            <Card.Body>
              <div className="fw-bold fs-5 mb-3" style={{ display: "flex", alignItems: "center", gap: 14 }}>
                <span role="img" aria-label="chart" style={{ fontSize: "1.5rem" }}>📊</span>
                직무별 스펙
              </div>
              <TableauEmbed />
            </Card.Body>
          </Card>
        </>
      )}
    </Container>
  );
};

export default SpCom;
