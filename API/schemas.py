from pydantic import BaseModel
from typing import List, Optional

# 1. /get-company-name-and-detail-job (입력: job_category, 출력: company_name, detail_job)
class JobCategoryRequest(BaseModel):
    job_category: str

class CompanyAndDetailJob(BaseModel):
    company_name: str
    detail_job: str

# 2. /get-detail-job-by-company-name (입력: company_name, 출력: detail_job)
class CompanyNameRequest(BaseModel):
    company_name: str

class DetailJob(BaseModel):
    detail_job: str

# 3. /get-company-name-by-detail-job (입력: detail_job, 출력: company_name)
class DetailJobRequest(BaseModel):
    detail_job: str

class CompanyName(BaseModel):
    company_name: str

# 4. /get-job-posting (입력: job_category, company_name, detail_job → 출력: 전체 정보)
class JobPostingRequest(BaseModel):
    job_category: str
    company_name: str
    detail_job: str

class JobPosting(BaseModel):
    company_type: Optional[str]
    main_job: Optional[str]
    location: Optional[str]
    education_level: Optional[str]
    major: Optional[str]
    experience: Optional[str]

    language_requirement: Optional[str]
    military_requirement: Optional[str]
    overseas_available: Optional[str]
    etc_requirements: Optional[str]
    process: Optional[str]
    image: Optional[str]


# 5. /get-applicants (입력: job_category, company_name, detail_job → 출력: 전체 정보)
# 요청용 스키마
class ApplicantSearchByCompanyDetailJobRequest(BaseModel):
    company: str
    detail_job: str

# 응답용 스키마
class ApplicantSchema(BaseModel):
    id: int
    company: str
    detail_job: str
    job_title: Optional[str]
    apply_term: Optional[str]
    university: Optional[str]
    major: Optional[str]
    gpa: Optional[float]
    gpa_scale: Optional[float]
    toeic: Optional[int]
    opic: Optional[str]
    toeic_speaking: Optional[str]
    work_experience: Optional[str]
    job_category: str

    class Config:
        orm_mode = True


# 회사 이름만 받는 요청 스키마
class CompanyOnlyRequest(BaseModel):
    company: str

# 직무 이름만 받는 요청 스키마
class DetailJobOnlyRequest(BaseModel):
    detail_job: str


# 회사 이름만 반환하는 응답 스키마
class CompanyList(BaseModel):
    company: str

# 직무 이름만 반환하는 응답 스키마
class DetailJobList(BaseModel):
    detail_job: str

# 예준쌤을 위한 스키마 > Thx to haein!
class SchoolRequest(BaseModel):
    university: str

class CompanyAndJob(BaseModel):
    company: str
    detail_job: str