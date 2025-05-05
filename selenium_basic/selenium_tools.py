import time
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webrdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

import chromedriver_autoinstaller

chromedriver_autoinstaller.install()

driver = webdriver.Chrome()
driver.get("https://www.naver.com")

# # 1. Navigation (웹 페이지 이동) 관련 툴
# # get, back, forward, refresh 메서드를 사용하여 웹 페이지를 이동하는 방법을 알아보자.

# # 1-1. get() 원하는 페이지로 이동하는 함수
# driver.get("https://www.naver.com")
# time.sleep(1)
# driver.get("https://www.google.com")

# # 1-2. back() 이전 페이지로 이동하는 함수
# driver.back()
# time.sleep(2)

# # 1-3. forward() 다음 페이지로 이동하는 함수
# driver.forward()
# time.sleep(2)

# # 1-4. refresh() 현재 페이지를 새로고침하는 함수
# driver.refresh()
# time.sleep(2)
# print("동작 끝")
# input()

# # 2.browser information
# # 2-1. title ~ 웹 사이트의 제목을 가져오는 함수
# title = driver.title
# print("제목:", title)
# # 2-2. current_url ~ 현재 웹 페이지의 URL을 가져오는 함수
# current_url = driver.current_url
# print("현재 URL:", current_url)

# if "nid.naver.com" in current_url:
#     print("지금은 로그인 하는 로직이 필요함")
# else:
#     print("네이버 로그인 페이지가 아닙니다.")


# 3. Driver Wait (드라이버 대기)
# 3-1. 3초 때 로딩이 끝나서, element가 찾아짐.
# 3-2. 30초 까지는 기다리겠음.
# 3-3. 30초가 넘어가면 에러던짐

try:
    selector = "#shortcutArea > ul > li:nth-child(8) > a > span.service_name"
    WebDriverWait(driver, 30).until(EC.presence_of_element_located(
        By.CSS_SELECTOR, selector
    ))
except:
    print("예외 발생, 예외 처리 코드 실행하기")
print("엘리먼트 로딩 끝")
print("다음 코드 실행")

input()