from fastapi import FastAPI, Depends, Query, Body
from sqlalchemy import create_engine, Column, Integer, String, ForeignKey, Date, Float
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker, Session
from pydantic import BaseModel
from typing import Optional, List
from datetime import date

# ------------------- DB 연결 -------------------
DATABASE_URL = "postgresql://spectrackr_user:1313@10.125.208.186:5432/spectrackr"
engine = create_engine(DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
Base = declarative_base()

# ------------------- SQLAlchemy 모델 -------------------
class Company(Base):
    __tablename__ = "companies"
    company_id = Column(Integer, primary_key=True, index=True)
    company_name = Column(String)
    company_url = Column(String)
    industry = Column(String)
    etc = Column(String)

class Job(Base):
    __tablename__ = "jobs"
    job_id = Column(Integer, primary_key=True, index=True)
    job_name = Column(String)
    job_category = Column(String)

class JobPosting(Base):
    __tablename__ = "job_postings"
    posting_id = Column(Integer, primary_key=True, index=True)
    company_id = Column(Integer, ForeignKey("companies.company_id"))
    job_id = Column(Integer, ForeignKey("jobs.job_id"))
    title = Column(String)
    qualification = Column(String)
    preferred = Column(String)
    tech_stack = Column(String)
    salary = Column(String)
    posting_url = Column(String)
    created_at = Column(Date)
    deadline = Column(Date)

class Applicant(Base):
    __tablename__ = "applicants"
    applicant_id = Column(Integer, primary_key=True, index=True)
    company_id = Column(Integer, ForeignKey("companies.company_id"))
    job_id = Column(Integer, ForeignKey("jobs.job_id"))
    school = Column(String)
    major = Column(String)
    gpa = Column(Float)
    experience = Column(String)
    language = Column(String)
    award = Column(String)
    certification = Column(String)
    etc = Column(String)

# ------------------- Pydantic 스키마 -------------------
class CompanySchema(BaseModel):
    company_id: int
    company_name: str
    company_url: Optional[str]
    industry: Optional[str]
    etc: Optional[str]
    class Config:
        orm_mode = True

class JobSchema(BaseModel):
    job_id: int
    job_name: str
    job_category: str
    class Config:
        orm_mode = True

class JobPostingSchema(BaseModel):
    posting_id: int
    company_id: int
    job_id: int
    title: str
    qualification: str
    preferred: Optional[str]
    tech_stack: Optional[str]
    salary: Optional[str]
    posting_url: Optional[str]
    created_at: date
    deadline: Optional[date]
    class Config:
        orm_mode = True

class ApplicantSchema(BaseModel):
    applicant_id: int
    company_id: int
    job_id: int
    school: str
    major: str
    gpa: float
    experience: Optional[str]
    language: Optional[str]
    award: Optional[str]
    certification: Optional[str]
    etc: Optional[str]
    class Config:
        orm_mode = True

class SpecInput(BaseModel):
    school: Optional[str]
    gpa: Optional[float]
    language: Optional[str]
    experience: Optional[str]
    award: Optional[str]
    certification: Optional[str]

# ------------------- FastAPI 앱 -------------------
app = FastAPI()
Base.metadata.create_all(bind=engine)

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

# ------------------- 기본 API -------------------
@app.get("/")
def root():
    return {"message": "스펙트래커 API 서버입니다."}

@app.get("/companies", response_model=List[CompanySchema])
def get_companies(db: Session = Depends(get_db)):
    return db.query(Company).all()

@app.get("/jobs", response_model=List[JobSchema])
def get_jobs(db: Session = Depends(get_db)):
    return db.query(Job).all()

@app.get("/jobpostings", response_model=List[JobPostingSchema])
def get_postings(db: Session = Depends(get_db)):
    return db.query(JobPosting).all()

@app.get("/applicants", response_model=List[ApplicantSchema])
def get_applicants(db: Session = Depends(get_db)):
    return db.query(Applicant).all()

# ------------------- 회사 기준 검색 기능 -------------------
@app.get("/companies/by-job", response_model=List[CompanySchema])
def get_companies_by_job(job_id: int, db: Session = Depends(get_db)):
    postings = db.query(JobPosting.company_id).filter(JobPosting.job_id == job_id).distinct()
    company_ids = [p.company_id for p in postings]
    return db.query(Company).filter(Company.company_id.in_(company_ids)).all()

@app.get("/jobpostings/search", response_model=List[JobPostingSchema])
def search_postings(company_id: int, job_id: int, db: Session = Depends(get_db)):
    return db.query(JobPosting).filter_by(company_id=company_id, job_id=job_id).all()

@app.get("/applicants/search", response_model=List[ApplicantSchema])
def search_applicants(
    company_id: int,
    job_id: int,
    page: int = 1,
    size: int = 5,
    db: Session = Depends(get_db)
):
    offset = (page - 1) * size
    return db.query(Applicant).filter_by(company_id=company_id, job_id=job_id).offset(offset).limit(size).all()

# ------------------- 스펙 기준 검색 기능 -------------------
@app.post("/spec-search")
def search_by_spec(spec: SpecInput, db: Session = Depends(get_db)):
    # 단순 예시: GPA 0.2 이내, 같은 자격증 보유자 찾기
    query = db.query(Applicant)
    if spec.gpa:
        query = query.filter(Applicant.gpa >= spec.gpa - 0.2)
    if spec.certification:
        query = query.filter(Applicant.certification == spec.certification)
    if spec.language:
        query = query.filter(Applicant.language == spec.language)
    
    similar = query.limit(5).all()
    return {
        "recommended_companies": ["카카오", "네이버"],
        "recommended_certifications": ["SQLD", "ADsP"],
        "similar_applicants": similar
    }
