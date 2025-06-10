from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import time

import pandas as pd
import time


chrome_options = Options()
chrome_options.add_experimental_option("detach", True)
driver = webdriver.Chrome(options=chrome_options)
wait = WebDriverWait(driver, 10)

results = []

# 크롤링할 페이지 범위 (1~5페이지 예시)
for page in range(1, 6):  # 필요시 1~원하는 페이지 범위 수정
    list_url = f"https://linkareer.com/list/recruit?filterBy_activityTypeID=5&filterBy_categoryIDs=58&filterBy_status=OPEN&orderBy_direction=DESC&orderBy_field=RECENT&page={page}"
    driver.get(list_url)
    time.sleep(2)

    print(f"📄 {page}페이지 접속 완료")

    # 메인 탭 핸들 저장
    main_window = driver.current_window_handle

    # 공고 row 개수 가져오기
    row_count = len(driver.find_elements(By.XPATH, '//*[@id="__next"]/div[1]/div/main/div/section/div[2]/table/tbody/tr'))
    print(f"{row_count}개의 공고 탐색 예정")

    for i in range(1, row_count + 1):
        try:
            link_element = driver.find_element(By.XPATH, f'//*[@id="__next"]/div[1]/div/main/div/section/div[2]/table/tbody/tr[{i}]/td[2]/div/a/div/p')
            link_element.click()

            # 새 탭으로 전환
            driver.switch_to.window(driver.window_handles[-1])

            # 기본 정보 크롤링
            company_name = wait.until(EC.presence_of_element_located((By.XPATH, '//*[@id="__next"]/div[1]/div/main/div/div/section[1]/div/article/header/h2'))).text.strip()
            company_type = wait.until(EC.presence_of_element_located((By.XPATH, '//*[@id="__next"]/div[1]/div/main/div/div/section[1]/div/article/div/dl[1]/dd'))).text.strip()

            position_element = wait.until(EC.presence_of_element_located((By.XPATH, '//*[@id="__next"]/div[1]/div/main/div/div/section[1]/div/article/div/dl[5]/dd')))
            position = position_element.text.strip()

            # 모든 p 태그 텍스트 수집
            p_elements = driver.find_elements(By.XPATH, '//*[@id="DETAIL"]/section[1]/div/p')
            p_texts = [p.text.strip() for p in p_elements]

            # 자격요건/모집직무 인덱스 탐색
            qual_idx = next((idx for idx, text in enumerate(p_texts) if '자격요건' in text or '자격 요건' in text), None)
            pos_idx = next((idx for idx, text in enumerate(p_texts) if '모집 직무' in text or '세부 직무' in text), None)

            # 자격요건 텍스트 추출
            qualification_texts = []
            if qual_idx is not None:
                for t in p_texts[qual_idx + 1:]:
                    if any(keyword in t for keyword in ['지원', '혜택', '우대', '다음', '근무']):
                        break
                    qualification_texts.append(t)
            qualification = "\n".join(qualification_texts)

            # 세부직무 추출
            detail_position = ''
            if pos_idx is not None:
                detail_position = p_texts[pos_idx + 1] if pos_idx + 1 < len(p_texts) else ''

            # 결과 저장
            results.append({
                '회사명': company_name,
                '기업형태': company_type,
                '모집직무': position,
                '세부직무': detail_position,
                '자격요건': qualification
            })

            print(f"{company_name} ({i}/{row_count}, page {page}) 크롤링 완료")

            # 새 탭 닫기 & 메인 탭으로 전환
            driver.close()
            driver.switch_to.window(main_window)

            time.sleep(1)

        except Exception as e:
            print(f"{page}페이지 {i}번째 공고 오류: {e}")
            # 예외 시 새 탭 닫고 메인 탭 복귀
            if len(driver.window_handles) > 1:
                driver.close()
                driver.switch_to.window(main_window)
            continue

driver.quit()

# DataFrame 변환 및 저장
df = pd.DataFrame(results)
df.to_csv('linkareer_crawling.csv', index=False, encoding='utf-8-sig')

print("크롤링 완료! CSV 저장됨.")