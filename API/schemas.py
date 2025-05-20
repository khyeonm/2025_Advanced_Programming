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
    detail_job: Optional[str]
    location: Optional[str]
    education_level: Optional[str]
    major: Optional[str]
    experience_level: Optional[str]
    experience_years: Optional[str]
    language_requirement: Optional[str]
    military_requirement: Optional[str]
    overseas_available: Optional[str]
    etc_requirements: Optional[str]
    process: Optional[str]
