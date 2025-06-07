-- 테이블 1: 회사 - 직무 - 자격 정보
CREATE TABLE job_postings (
    id SERIAL PRIMARY KEY,
    company_name VARCHAR(255),
    company_type VARCHAR(50),
    main_job VARCHAR(100),
    detail_job VARCHAR(100),
    location VARCHAR(100),
    qualification TEXT,
    process TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 테이블 2: 합격자 정보
CREATE TABLE applicants (
    id SERIAL PRIMARY KEY,
    company VARCHAR(255),
    division VARCHAR(255),
    job_title VARCHAR(255),
    apply_term VARCHAR(100),
    university VARCHAR(255),
    major VARCHAR(255),
    gpa DECIMAL(4,2),
    gpa_scale DECIMAL(4,2),
    toeic INT,
    opic VARCHAR(20),
    toeic_speaking VARCHAR(50),
    work_experience TEXT
);

-- 테이블 3: 자격증 정보
CREATE TABLE certifications (
    id SERIAL PRIMARY KEY,
    applicant_id INT,
    certification_name VARCHAR(255),
    FOREIGN KEY (applicant_id) REFERENCES applicants(id)
);
