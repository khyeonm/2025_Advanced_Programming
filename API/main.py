from fastapi import FastAPI, Depends, HTTPException
from sqlalchemy.orm import Session
from database import SessionLocal, engine
from model import RecruitQualification, Applicant
import schemas
from fastapi.middleware.cors import CORSMiddleware
from sqlalchemy import text
from functools import wraps

# --- Factory Pattern ---
class RequestFactory:
    @staticmethod
    def create(schema_cls, data: dict):
        return schema_cls(**data)

# --- Adapter Pattern ---
class ResultAdapter:
    @staticmethod
    def to_dict_list(keys, rows):
        def sanitize(key, value):
            defaults = {"experience": "0", "image": ""}
            return value if value is not None else defaults.get(key, "")
        return [dict(zip(keys, [sanitize(k, v) for k, v in zip(keys, row)])) for row in rows]

# --- Decorator Pattern ---
def safe_handler(func):
    @wraps(func)
    def wrapper(*args, **kwargs):
        try:
            return func(*args, **kwargs)
        except Exception as e:
            raise HTTPException(status_code=500, detail=str(e))
    return wrapper

# --- FastAPI ---
app = FastAPI(title="Spectrackr API", description="채용정보를 위한 FastAPI", version="2.8.1")


app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()


@app.post("/get-company-name-and-detail-job", response_model=list[schemas.CompanyAndDetailJob], tags=['회사 기준 검색'])
@safe_handler
def get_company_name_and_detail_job(req: schemas.JobCategoryRequest, db: Session = Depends(get_db)):
    req = RequestFactory.create(schemas.JobCategoryRequest, req.dict())
    return db.query(RecruitQualification.company_name, RecruitQualification.detail_job)\
             .filter(RecruitQualification.job_category == req.job_category).all()

@app.post("/get-detail-job-by-company-name", response_model=list[schemas.DetailJob], tags=['회사 기준 검색'])
@safe_handler

def get_detail_job_by_company_name(req: schemas.CompanyNameRequest, db: Session = Depends(get_db)):
    req = RequestFactory.create(schemas.CompanyNameRequest, req.dict())
    return db.query(RecruitQualification.detail_job)\
             .filter(RecruitQualification.company_name == req.company_name).all()


@app.post("/get-company-name-by-detail-job", response_model=list[schemas.CompanyName], tags=['회사 기준 검색'])
@safe_handler

def get_company_name_by_detail_job(req: schemas.DetailJobRequest, db: Session = Depends(get_db)):
    req = RequestFactory.create(schemas.DetailJobRequest, req.dict())
    return db.query(RecruitQualification.company_name)\
             .filter(RecruitQualification.detail_job == req.detail_job).all()


@app.post("/get-job-posting", response_model=list[schemas.JobPosting], tags=['회사 기준 검색'])
@safe_handler

def get_job_posting(req: schemas.JobPostingRequest, db: Session = Depends(get_db)):
    req = RequestFactory.create(schemas.JobPostingRequest, req.dict())

    results = db.query(
        RecruitQualification.company_type,
        RecruitQualification.main_job,
        RecruitQualification.location,
        RecruitQualification.education_level,
        RecruitQualification.major,
        RecruitQualification.experience,
        RecruitQualification.language_requirement,
        RecruitQualification.military_requirement,
        RecruitQualification.overseas_available,
        RecruitQualification.etc_requirements,
        RecruitQualification.process,
        RecruitQualification.image
    ).filter(
        RecruitQualification.job_category == req.job_category,
        RecruitQualification.company_name == req.company_name,
        RecruitQualification.detail_job == req.detail_job
    ).distinct().all()

    keys = [

        "company_type", "main_job", "location", "education_level", "major", "experience",
        "language_requirement", "military_requirement", "overseas_available",
        "etc_requirements", "process", "image"
    ]

    return ResultAdapter.to_dict_list(keys, results)

@app.post("/get-applicants-by-company-detail-job", response_model=list[schemas.ApplicantSchema], tags=["스펙 기준 검색"])
@safe_handler
def get_applicants_by_company_detail_job(req: schemas.ApplicantSearchByCompanyDetailJobRequest, db: Session = Depends(get_db)):
    req = RequestFactory.create(schemas.ApplicantSearchByCompanyDetailJobRequest, req.dict())
    return db.query(Applicant).filter(
        Applicant.company == req.company,
        Applicant.detail_job == req.detail_job
    ).all()

@app.post("/get-companiy-by-detail-job", response_model=list[schemas.CompanyList], tags=['스펙 기준 검색'])
@safe_handler
def get_companies_by_detail_job(req: schemas.DetailJobOnlyRequest, db: Session = Depends(get_db)):
    req = RequestFactory.create(schemas.DetailJobOnlyRequest, req.dict())
    query = db.query(Applicant.company)
    if req.detail_job:
        query = query.filter(Applicant.detail_job == req.detail_job)
    return [{"company": r[0]} for r in query.distinct().all()]

@app.post("/get-detail-job-by-company", response_model=list[schemas.DetailJobList], tags=['스펙 기준 검색'])
@safe_handler
def get_detail_jobs_by_company(req: schemas.CompanyOnlyRequest, db: Session = Depends(get_db)):
    req = RequestFactory.create(schemas.CompanyOnlyRequest, req.dict())
    query = db.query(Applicant.detail_job)
    if req.company:
        query = query.filter(Applicant.company == req.company)
    return [{"detail_job": r[0]} for r in query.distinct().all() if r[0] is not None]

@app.get("/get-all-universities", response_model=list[str], tags=["스펙 기준 검색"])
@safe_handler
def get_all_universities(db: Session = Depends(get_db)):
    return [r[0] for r in db.query(Applicant.university)
                       .filter(Applicant.university.isnot(None))
                       .filter(Applicant.university != "")
                       .distinct().all()]

@app.post("/get-applicants-by-school", response_model=list[schemas.CompanyAndJob], tags=["스펙 기준 검색"])
@safe_handler
def get_applicants_by_school(req: schemas.SchoolRequest, db: Session = Depends(get_db)):
    req = RequestFactory.create(schemas.SchoolRequest, req.dict())
    results = db.query(Applicant.company, Applicant.detail_job)\
                .filter(Applicant.university == req.university)\
                .distinct().all()
    return [{"company": r[0], "detail_job": r[1]} for r in results]


@app.get("/")
def root():
    return {"message": "Spectrackr API is live!"}


@app.on_event("startup")
def test_db():
    try:
        db = SessionLocal()
        db.execute(text("SELECT 1"))
        print("DB 연결 성공")
        db.close()
    except Exception as e:
        print(f"DB 연결 실패: {e}")


if __name__ == "__main__":
    import uvicorn
    uvicorn.run("main:app", host="0.0.0.0", port=8000)