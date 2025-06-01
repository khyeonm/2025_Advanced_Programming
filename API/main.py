from fastapi import FastAPI, Depends, HTTPException
from sqlalchemy.orm import Session
from database import SessionLocal, engine
from model import RecruitQualification, Applicant
import schemas
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI(title="Spectrackr API", description="채용정보를 위한 FastAPI", version="1.0")


app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# 의존성: 요청마다 DB 세션 생성 → 종료
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

# 1. /get-company-name-and-detail-job
@app.post("/get-company-name-and-detail-job", response_model=list[schemas.CompanyAndDetailJob], tags=['회사 기준 검색'])
def get_company_name_and_detail_job(req: schemas.JobCategoryRequest, db: Session = Depends(get_db)):
    results = db.query(RecruitQualification.company_name, RecruitQualification.detail_job) \
        .filter(RecruitQualification.job_category == req.job_category).all()
    return results

# 2. /get-detail-job-by-company-name
@app.post("/get-detail-job-by-company-name", response_model=list[schemas.DetailJob], tags=['회사 기준 검색'])
def get_detail_job_by_company_name(req: schemas.CompanyNameRequest, db: Session = Depends(get_db)):
    results = db.query(RecruitQualification.detail_job) \
        .filter(RecruitQualification.company_name == req.company_name).all()
    return results

# 3. /get-company-name-by-detail-job
@app.post("/get-company-name-by-detail-job", response_model=list[schemas.CompanyName], tags=['회사 기준 검색'])
def get_company_name_by_detail_job(req: schemas.DetailJobRequest, db: Session = Depends(get_db)):
    results = db.query(RecruitQualification.company_name) \
        .filter(RecruitQualification.detail_job == req.detail_job).all()
    return results

# 4. /get-job-posting
@app.post("/get-job-posting", response_model=list[schemas.JobPosting], tags=['회사 기준 검색'])
def get_job_posting(req: schemas.JobPostingRequest, db: Session = Depends(get_db)):
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
        "company_type",
        "main_job",
        "location",
        "education_level",
        "major",
        "experience",
        "language_requirement",
        "military_requirement",
        "overseas_available",
        "etc_requirements",
        "process",
        "image"        
    ]

    def sanitize(key, value):
        defaults = {
            "experience": "0",
            "image": "",  # ✅ 기본 이미지가 없으면 빈 문자열 반환
        }
        return value if value is not None else defaults.get(key, "")
    
    result_dicts = [
        dict(zip(keys, [sanitize(k, v) for k, v in zip(keys, row)]))
        for row in results
    ]
    
    return result_dicts

# 5. /get-applicants
@app.post("/get-applicants-by-company-detail-job", response_model=list[schemas.ApplicantSchema], tags=["스펙 기준 검색"])
def get_applicants_by_company_detail_job(req: schemas.ApplicantSearchByCompanyDetailJobRequest, db: Session = Depends(get_db)):
    results = db.query(Applicant).filter(
        Applicant.company == req.company,
        Applicant.detail_job == req.detail_job
    ).all()
    return results

# 6. /get-companies-by-detail-job
# @app.post("/get-companiy-by-detail-job", response_model=list[schemas.CompanyList], tags=['스펙 기준 검색'])
# def get_companies_by_detail_job(req: schemas.DetailJobOnlyRequest, db: Session = Depends(get_db)):
#     results = db.query(Applicant.company).filter(Applicant.detail_job == req.detail_job).distinct().all()
#     return [{"company": r[0]} for r in results]

@app.post("/get-companiy-by-detail-job", response_model=list[schemas.CompanyList], tags=['스펙 기준 검색'])
def get_companies_by_detail_job(req: schemas.DetailJobOnlyRequest, db: Session = Depends(get_db)):
    query = db.query(Applicant.company)
    # 빈 문자열이 아니라면 필터 적용
    if req.detail_job:
        query = query.filter(Applicant.detail_job == req.detail_job)
    results = query.distinct().all()
    return [{"company": r[0]} for r in results]


# 7. /get-detail-jobs-by-company
# @app.post("/get-detail-job-by-company", response_model=list[schemas.DetailJobList], tags=['스펙 기준 검색'])
# def get_detail_jobs_by_company(req: schemas.CompanyOnlyRequest, db: Session = Depends(get_db)):
#     results = db.query(Applicant.detail_job).filter(Applicant.company == req.company).distinct().all()
#     return [{"detail_job": r[0]} for r in results]

@app.post("/get-detail-job-by-company", response_model=list[schemas.DetailJobList], tags=['스펙 기준 검색'])
def get_detail_jobs_by_company(req: schemas.CompanyOnlyRequest, db: Session = Depends(get_db)):
    query = db.query(Applicant.detail_job)
    if req.company is not None and req.company != "":
        query = query.filter(Applicant.company == req.company)

    results = query.distinct().all()
    return [{"detail_job": r[0]} for r in results if r[0] is not None]


# 8. /get-all-universities
@app.get("/get-all-universities", response_model=list[str], tags=["스펙 기준 검색"])
def get_all_universities(db: Session = Depends(get_db)):
    results = db.query(Applicant.university) \
                .filter(Applicant.university.isnot(None)) \
                .filter(Applicant.university != "") \
                .distinct().all()
    return [r[0] for r in results]




@app.get("/")
def root():
    return {"message": "Spectrackr API is live!"}


from sqlalchemy import text  # 추가

@app.on_event("startup")
def test_db():
    try:
        db = SessionLocal()
        db.execute(text("SELECT 1"))  # 수정된 부분
        print("✅ DB 연결 성공")
        db.close()
    except Exception as e:
        print(f"❌ DB 연결 실패: {e}")

# @app.on_event("startup")
# def test_db():
#     try:
#         db = SessionLocal()
#         db.execute("SELECT 1")
#         print("✅ DB 연결 성공")
#         db.close()
#     except Exception as e:
#         print(f"❌ DB 연결 실패: {e}")

if __name__ == "__main__":
    import uvicorn
    uvicorn.run("main:app", host="0.0.0.0", port=8000)