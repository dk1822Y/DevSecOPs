from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from datetime import datetime
import re

# Call headless driver path and set url
chrome_options = Options()
chrome_options.add_argument("--headless")
driver = webdriver.Chrome(executable_path="C:\\chromedriver.exe")
url = 'db/item/1'

list_of_items = [114, 100, 112]

def print_current_time():
    return datetime.now().strftime('%m/%d/%Y %I:%M:%S')

def find(xpath):
    return driver.find_element_by_xpath(xpath)

def remove_first_n_char(org_str, n):
    mod_string = ""
    for i in range(n, len(org_str)):
        mod_string = mod_string + org_str[i]
    return mod_string

def automate():
    # Visit webpage and maximize window
    driver.get(url)
    driver.maximize_window()

    print(find('//*[@id="item_title"]').text)

    # Login
    driver.close()
    driver.quit()
automate()
