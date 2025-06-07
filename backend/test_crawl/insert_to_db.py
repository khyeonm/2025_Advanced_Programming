import os
from dotenv import load_dotenv
from sqlalchemy import create_engine, text
import pandas as pd


# 1. 환경변수 불러오기
load_dotenv()
DATABASE_URL = os.getenv("DATABASE_URL")
print("🔗 DATABASE_URL:", DATABASE_URL)

# 2. DB 연결
engine = create_engine(DATABASE_URL)

# 3. 연결 테스트 + 데이터 조회
try:
    with engine.connect() as conn:
        conn.execute(text("SELECT 1;"))  # SQLAlchemy 2.0+에서는 text() 필요
        print("✅ DB 연결 성공")

        # 실제 테이블에서 5개만 조회
        df = pd.read_sql("SELECT * FROM certifications LIMIT 5;", con=engine)
        print("📦 certifications 테이블 샘플:\n", df)

except Exception as e:
    print("❌ DB 연결 실패:", e)