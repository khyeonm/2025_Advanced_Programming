from fastapi import FastAPI, Query
from pydantic import BaseModel
from typing import List

app = FastAPI()

class SpecInput(BaseModel):
    skills: List[str]
    certifications: List[str]
    project_count: int

@app.post("/spec-search")
def spec_search(spec: SpecInput):
    return {
        "recommended_companies": ["카카오", "라인", "네이버"],
        "recommended_certifications": ["SQLD", "ADsP"]
    }

@app.get("/company-search")
def company_search(company: str = Query(...), job: str = Query(...)):
    return {
        "job_description": f"{company}의 {job} 직무입니다.",
        "accepted_applicants_spec": [
            {
                "certifications": ["SQLD"],
                "skills": ["Python", "SQL"],
                "project_count": 2
            },
            {
                "certifications": ["정보처리기사"],
                "skills": ["Python", "R"],
                "project_count": 3
            }
        ]
    }
