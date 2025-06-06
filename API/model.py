from sqlalchemy import Column, String, Integer, Float
from database import Base

class RecruitQualification(Base):
    __tablename__ = "recruit_qualifications"

    job_category = Column(String, primary_key=True)
    company_name = Column(String, primary_key=True)
    detail_job = Column(String, primary_key=True)

    company_type = Column(String)
    location = Column(String)
    education_level = Column(String)
    major = Column(String)
    main_job = Column(String)
    experience = Column(String)

    language_requirement = Column(String)
    military_requirement = Column(String)
    overseas_available = Column(String)
    etc_requirements = Column(String)
    process = Column(String)
    image = Column(String)



class Applicant(Base):
    __tablename__ = "applicants"

    id = Column(Integer, primary_key=True, index=True)
    company = Column(String)
    detail_job = Column(String)
    job_title = Column(String)
    apply_term = Column(String)
    university = Column(String)
    major = Column(String)
    gpa = Column(Float)
    gpa_scale = Column(Float)
    toeic = Column(Integer)
    opic = Column(String)
    toeic_speaking = Column(String)
    work_experience = Column(String)
    job_category = Column(String)