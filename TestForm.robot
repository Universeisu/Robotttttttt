*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}              Chrome
# ${FIRST_NAME_THA}       ฟ้า
${FIRST_NAME_ENG}       Catherine
${ID_CARD}              1739300002297
${PASSWORD}             12123121aB
${MOBILE}               0800782723
${EMAIL}                654259029@webmail.npru.ac.th

#${RESULT_FIRST_NAME_THA}  กรุณากรอกชื่อเป็นภาษาไทยเท่านั้น
${RESULT_FIRST_NAME_ENG}    กรุณากรอกชื่อเป็นภาษาอังกฤษเท่านั้น
${RESULT_ID_CARD}           กรุณากรอกหมายเลขบัตรประชาชน 13 หลัก เป็นตัวเลขทั้งหมด
${RESULT_PASSWORD}          รหัสผ่านต้องมีอย่างน้อย 8 ตัวอักษร ประกอบด้วยอักษรตัวเล็ก อักษรตัวใหญ่ และตัวเลข
${RESULT_MOBILE}            กรุณากรอกเบอร์โทรศัพท์ 10 หลักเท่านั้น
${RESULT_EMAIL}             กรุณากรอกอีเมลที่มีโดเมน @webmail.npru.ac.th เท่านั้น


*** Test Cases ***
Search chrome and Verify Results
    [Documentation]    Test case to search chrome and verify results
    [Tags]              search
    Open chrome ReactForm
    # Input firstnamethai
    Input firstnameeng
    Input IDCard
    Input Password
    Input Mobile
    Input Email
    Verify Results

*** Keywords ***
Open chrome ReactForm
    Open Browser    http://localhost:5174    ${BROWSER}
    Maximize Browser Window

# Input firstnamethai
#     Input Text    name=firstnameTha     ${FIRST_NAME_THA}

Input firstnameeng
    Input Text    id=firstnameEng    ${FIRST_NAME_ENG}
Input IDCard
    Input Text    name=idCard    ${ID_CARD}

Input Password
    Input Text    id=password    ${PASSWORD}
Input Mobile
    Input Text    name=mobile    ${MOBILE}

Input Email
    Input Text    id=email    ${EMAIL}
Verify Results
    # Wait Until Page Contains    ${RESULT_FIRST_NAME_THA}
    Wait Until Page Contains    ${RESULT_FIRST_NAME_ENG}
    Page Should Contain        ${RESULT_FIRST_NAME_ENG}
    Wait Until Page Contains    ${RESULT_ID_CARD}
    Page Should Contain    ${RESULT_ID_CARD}
    Wait Until Page Contains    ${RESULT_PASSWORD}
    Page Should Contain    ${RESULT_PASSWORD}
    Wait Until Page Contains    ${RESULT_MOBILE}
    Page Should Contain    ${RESULT_MOBILE}
    Wait Until Page Contains    ${RESULT_EMAIL}
    Page Should Contain    ${RESULT_EMAIL}
    Close Browser   