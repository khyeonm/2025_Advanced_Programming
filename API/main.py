from fastapi import FastAPI, Depends, HTTPException
from sqlalchemy.orm import Session
from database import SessionLocal, engine
from models import RecruitQualification
import schemas

app = FastAPI(title="Spectrackr API", description="채용정보를 위한 FastAPI", version="1.0")

# 의존성: 요청마다 DB 세션 생성 → 종료
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

# 1. /get-company-name-and-detail-job
@app.post("/get-company-name-and-detail-job", response_model=list[schemas.CompanyAndDetailJob])
def get_company_name_and_detail_job(req: schemas.JobCategoryRequest, db: Session = Depends(get_db)):
    results = db.query(RecruitQualification.company_name, RecruitQualification.detail_job) \
        .filter(RecruitQualification.job_category == req.job_category).all()
    return results

# 2. /get-detail-job-by-company-name
@app.post("/get-detail-job-by-company-name", response_model=list[schemas.DetailJob])
def get_detail_job_by_company_name(req: schemas.CompanyNameRequest, db: Session = Depends(get_db)):
    results = db.query(RecruitQualification.detail_job) \
        .filter(RecruitQualification.company_name == req.company_name).all()
    return results

# 3. /get-company-name-by-detail-job
@app.post("/get-company-name-by-detail-job", response_model=list[schemas.CompanyName])
def get_company_name_by_detail_job(req: schemas.DetailJobRequest, db: Session = Depends(get_db)):
    results = db.query(RecruitQualification.company_name) \
        .filter(RecruitQualification.detail_job == req.detail_job).all()
    return results

# 4. /get-job-posting
@app.post("/get-job-posting", response_model=list[schemas.JobPosting])
def get_job_posting(req: schemas.JobPostingRequest, db: Session = Depends(get_db)):
    results = db.query(
        RecruitQualification.company_type,
        RecruitQualification.detail_job,
        RecruitQualification.location,
        RecruitQualification.education_level,
        RecruitQualification.major,
        RecruitQualification.experience_level,
        RecruitQualification.experience_years,
        RecruitQualification.language_requirement,
        RecruitQualification.military_requirement,
        RecruitQualification.overseas_available,
        RecruitQualification.etc_requirements,
        RecruitQualification.process
    ).filter(
        RecruitQualification.job_category == req.job_category,
        RecruitQualification.company_name == req.company_name,
        RecruitQualification.detail_job == req.detail_job
    ).all()
    return results
