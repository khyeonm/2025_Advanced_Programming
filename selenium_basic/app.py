from selenium import webdriver

import chromedriver_autoinstaller

chromedriver_autoinstaller.install()

driver = webdriver.Chrome()

input()