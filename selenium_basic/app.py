import time
from selenium import webdriver
from selenium.webdriver.common.by import By
import chromedriver_autoinstaller

chromedriver_autoinstaller.install()

driver = webdriver.Chrome()
# 1. 드라이버.get() 메서드를 사용하여 웹 페이지를 연다.
driver.get("https://www.naver.com")
time.sleep(3)

# 2. 웹 페이지가 열리면, 웹 페이지의 요소를 찾기 위해 find_element() 메서드를 사용한다.
css_selector = "#shortcutArea > ul > li:nth-child(8) > a > span.service_name"
group_navigation = driver.find_element(By.CSS_SELECTOR, css_selector)

print(group_navigation.text)
group_navigation.click()
input()