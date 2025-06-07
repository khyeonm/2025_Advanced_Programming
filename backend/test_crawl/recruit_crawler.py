from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import pandas as pd
import time

def crawl_zighang(job_name="서버·백엔드", max_clicks=10):
    options = Options()
    options.add_argument("--headless")  # 필요 시 제거 가능
    options.add_argument("--no-sandbox")
    options.add_argument("--disable-dev-shm-usage")
    driver = webdriver.Chrome(options=options)
    driver.set_window_size(1280, 1024)
    wait = WebDriverWait(driver, 20)

    try:
        driver.get("https://zighang.com/it")
        time.sleep(2)

        arrow_xpath = '//*[@id="root"]/main/div[3]/div/div/div/div/div[2]/div/section/button[2]/div/img'
        wait.until(EC.element_to_be_clickable((By.XPATH, arrow_xpath))).click()
        time.sleep(1)

        job_button_xpath = f'//button[normalize-space()="{job_name}"]'
        wait.until(EC.element_to_be_clickable((By.XPATH, job_button_xpath))).click()
        time.sleep(1)

        confirm_button = wait.until(EC.presence_of_element_located((By.CSS_SELECTOR, 'div.sticky.bottom-0 button.bg-primary')))
        driver.execute_script("arguments[0].scrollIntoView(true);", confirm_button)
        driver.execute_script("arguments[0].click();", confirm_button)
        wait.until(EC.presence_of_element_located((By.CSS_SELECTOR, 'p.ds-web-title2')))

        original_tab = driver.current_window_handle
        results = []

        for i in range(2, max_clicks + 1):
            try:
                title_xpath = f'(//p[contains(@class, "ds-web-title2")])[{i}]'
                title_elem = wait.until(EC.presence_of_element_located((By.XPATH, title_xpath)))
                driver.execute_script("arguments[0].scrollIntoView(true);", title_elem)
                driver.execute_script("window.scrollBy(0, -200);")
                time.sleep(0.3)

                parent_link = title_elem.find_element(By.XPATH, "./ancestor::a[1]")
                driver.execute_script("arguments[0].click();", parent_link)
                time.sleep(2)

                new_tab = [tab for tab in driver.window_handles if tab != original_tab][0]
                driver.switch_to.window(new_tab)

                data = {}
                data["회사명"] = driver.find_element(By.XPATH, '//*[@id="root"]/main/div[2]/div[1]/div[1]/div[1]/div[1]/div/a').text
                data["경력"] = driver.find_element(By.XPATH, '//*[@id="root"]/main/div[2]/div[1]/div[1]/div[1]/div[5]/div/section/div[1]/div/div').text
                data["학력"] = driver.find_element(By.XPATH, '//*[@id="root"]/main/div[2]/div[1]/div[1]/div[1]/div[5]/div/section/div[3]/div/div').text
                data["근무지"] = driver.find_element(By.XPATH, '//*[@id="root"]/main/div[2]/div[1]/div[1]/div[1]/div[5]/div/section/div[2]/div/div').text
                data["직군"] = job_name

                try:
                    data["우대사항"] = driver.find_element(By.XPATH, '//h2[text()="우대사항"]/following-sibling::p').text
                except:
                    data["우대사항"] = ""

                try:
                    data["자격요건"] = driver.find_element(By.XPATH, '//h2[text()="자격요건"]/following-sibling::p').text
                except:
                    data["자격요건"] = ""

                if data["우대사항"] == "" and data["자격요건"] == "":
                    try:
                        img_elem = driver.find_element(By.XPATH, '//*[@id="root"]/main/div[2]/div[1]/div[1]/div[4]/img')
                        data["이미지경로"] = img_elem.get_attribute("src")
                    except:
                        data["이미지경로"] = ""
                else:
                    data["이미지경로"] = ""

                results.append(data)
                driver.close()
                driver.switch_to.window(original_tab)

            except Exception as e:
                print(f"❌ [{i}]번째 공고 실패: {e}")
                continue

        return pd.DataFrame(results)

    finally:
        driver.quit()




def crawl_linkareer(max_pages=5):
    chrome_options = Options()
    chrome_options.add_experimental_option("detach", True)
    chrome_options.add_argument("--no-sandbox")
    chrome_options.add_argument("--disable-dev-shm-usage")
    # chrome_options.add_argument("--headless")  # 필요 시 주석 제거
    driver = webdriver.Chrome(options=chrome_options)
    wait = WebDriverWait(driver, 10)

    results = []

    try:
        for page in range(1, max_pages + 1):
            list_url = f"https://linkareer.com/list/recruit?filterBy_activityTypeID=5&filterBy_categoryIDs=58&filterBy_status=OPEN&orderBy_direction=DESC&orderBy_field=RECENT&page={page}"
            driver.get(list_url)
            time.sleep(2)
            print(f"📄 {page}페이지 접속 완료")

            main_window = driver.current_window_handle
            row_count = len(driver.find_elements(By.XPATH, '//*[@id="__next"]/div[1]/div/main/div/section/div[2]/table/tbody/tr'))
            print(f"🔍 {row_count}개의 공고 탐색 예정")

            for i in range(1, row_count + 1):
                try:
                    link_element = driver.find_element(By.XPATH, f'//*[@id="__next"]/div[1]/div/main/div/section/div[2]/table/tbody/tr[{i}]/td[2]/div/a/div/p')
                    link_element.click()

                    driver.switch_to.window(driver.window_handles[-1])

                    company_name = wait.until(EC.presence_of_element_located(
                        (By.XPATH, '//*[@id="__next"]/div[1]/div/main/div/div/section[1]/div/article/header/h2'))).text.strip()
                    company_type = wait.until(EC.presence_of_element_located(
                        (By.XPATH, '//*[@id="__next"]/div[1]/div/main/div/div/section[1]/div/article/div/dl[1]/dd'))).text.strip()
                    position_element = wait.until(EC.presence_of_element_located(
                        (By.XPATH, '//*[@id="__next"]/div[1]/div/main/div/div/section[1]/div/article/div/dl[5]/dd')))
                    position = position_element.text.strip()

                    p_elements = driver.find_elements(By.XPATH, '//*[@id="DETAIL"]/section[1]/div/p')
                    p_texts = [p.text.strip() for p in p_elements]

                    qual_idx = next((idx for idx, text in enumerate(p_texts) if '자격요건' in text or '자격 요건' in text), None)
                    pos_idx = next((idx for idx, text in enumerate(p_texts) if '모집 직무' in text or '세부 직무' in text), None)

                    qualification_texts = []
                    if qual_idx is not None:
                        for t in p_texts[qual_idx + 1:]:
                            if any(keyword in t for keyword in ['지원', '혜택', '우대', '다음', '근무']):
                                break
                            qualification_texts.append(t)
                    qualification = "\n".join(qualification_texts)

                    detail_position = ''
                    if pos_idx is not None and pos_idx + 1 < len(p_texts):
                        detail_position = p_texts[pos_idx + 1]

                    results.append({
                        '회사명': company_name,
                        '기업형태': company_type,
                        '모집직무': position,
                        '세부직무': detail_position,
                        '자격요건': qualification
                    })

                    print(f"✅ {company_name} ({i}/{row_count}, page {page}) 크롤링 완료")
                    driver.close()
                    driver.switch_to.window(main_window)
                    time.sleep(1)

                except Exception as e:
                    print(f"❌ {page}페이지 {i}번째 공고 오류: {e}")
                    if len(driver.window_handles) > 1:
                        driver.close()
                        driver.switch_to.window(main_window)
                    continue

        return pd.DataFrame(results)

    finally:
        driver.quit()