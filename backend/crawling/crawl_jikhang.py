from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import time
import pandas as pd

# 크롬 설정
options = Options()
options.add_experimental_option("detach", True)
driver = webdriver.Chrome(options=options)
driver.set_window_size(1280, 1024)
wait = WebDriverWait(driver, 20)

# 사이트 접속
driver.get("https://zighang.com/it")
time.sleep(2)

# 직무 설정
job_name = "서버·백엔드"

# 직무 필터 열기
arrow_xpath = '//*[@id="root"]/main/div[3]/div/div/div/div/div[2]/div/section/button[2]/div/img'
wait.until(EC.element_to_be_clickable((By.XPATH, arrow_xpath))).click()
print("직무 필터 열기 성공")
time.sleep(1)

# 직무 클릭
job_button_xpath = f'//button[normalize-space()="{job_name}"]'
wait.until(EC.element_to_be_clickable((By.XPATH, job_button_xpath))).click()
print(f" 직무 '{job_name}' 선택 완료")
time.sleep(1)

# 공고 보기 클릭
confirm_button = wait.until(EC.presence_of_element_located((By.CSS_SELECTOR, 'div.sticky.bottom-0 button.bg-primary')))
driver.execute_script("arguments[0].scrollIntoView(true);", confirm_button)
driver.execute_script("arguments[0].click();", confirm_button)
print("공고 보기 버튼 클릭 완료")
wait.until(EC.presence_of_element_located((By.CSS_SELECTOR, 'p.ds-web-title2')))
print("공고 리스트 로딩 완료")

# 공고 순회
MAX_CLICKS = 10
original_tab = driver.current_window_handle
results = []

for i in range(2, MAX_CLICKS + 1):
    try:
        title_xpath = f'(//p[contains(@class, "ds-web-title2")])[{i}]'
        title_elem = wait.until(EC.presence_of_element_located((By.XPATH, title_xpath)))
        driver.execute_script("arguments[0].scrollIntoView(true);", title_elem)
        driver.execute_script("window.scrollBy(0, -200);")
        time.sleep(0.3)
        parent_link = title_elem.find_element(By.XPATH, "./ancestor::a[1]")
        driver.execute_script("arguments[0].click();", parent_link)
        print(f"▶️ [{i}]번째 공고 클릭 → 새 탭 열림 예상")
        time.sleep(2)

        # 새 탭 전환
        new_tab = [tab for tab in driver.window_handles if tab != original_tab][0]
        driver.switch_to.window(new_tab)

        # 공고 정보 크롤링
        data = {}
        data["회사명"] = driver.find_element(By.XPATH, '//*[@id="root"]/main/div[2]/div[1]/div[1]/div[1]/div[1]/div/a').text
        data["경력"] = driver.find_element(By.XPATH, '//*[@id="root"]/main/div[2]/div[1]/div[1]/div[1]/div[5]/div/section/div[1]/div/div').text
        data["학력"] = driver.find_element(By.XPATH, '//*[@id="root"]/main/div[2]/div[1]/div[1]/div[1]/div[5]/div/section/div[3]/div/div').text
        data["근무지"] = driver.find_element(By.XPATH, '//*[@id="root"]/main/div[2]/div[1]/div[1]/div[1]/div[5]/div/section/div[2]/div/div').text
        data["직군"] = job_name

        try:
            data["우대사항"] = driver.find_element(By.XPATH, '//h2[text()="우대사항"]/following-sibling::p').text
            print(f"우대사항 크롤링 완료: {data['우대사항'][:10]}...")
        except:
            data["우대사항"] = ""

        try:
            data["자격요건"] = driver.find_element(By.XPATH, '//h2[text()="자격요건"]/following-sibling::p').text
            print(f"자격요건 크롤링 완료: {data['자격요건'][:10]}...")
        except:
            data["자격요건"] = ""

        if data["우대사항"] == "" and data["자격요건"] == "":
            try:
                img_elem = driver.find_element(By.XPATH, '//*[@id="root"]/main/div[2]/div[1]/div[1]/div[4]/img')
                data["이미지경로"] = img_elem.get_attribute("src")
                print("이미지 URL 저장 완료")
            except:
                data["이미지경로"] = ""
                print("이미지 URL 저장 실패")
        else:
            data["이미지경로"] = ""

        results.append(data)
        driver.close()
        driver.switch_to.window(original_tab)
        print(f"🔙 기존 탭 복귀 완료\n")

    except Exception as e:
        print(f"[{i}]번째 공고 실패: {e}")
        continue

# 엑셀 저장
df = pd.DataFrame(results)
df.to_excel("직행_크롤링_결과.xlsx", index=False)
print("엑셀 저장 완료")
