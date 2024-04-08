*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}          Chrome
${URL}              https://form-ruby-theta.vercel.app
${Valid_Thai_Name_Title}  นางสาว
${Valid_Thai_Firstname}     อาทิตยา 
${Valid_Thai_Lastname}      คงดี
${Valid_English_Name_Title}  Ms.
${Valid_English_Firstname}     Arthittaya
${Valid_English_Lastname}      Kongdee
${Valid_Day}              10
${Valid_Month}            กันยายน
${Valid_YearB_E}          2544
${Valid_ID_Card}        1739300002297
${Valid_Password}        IsNotPassword1
${Valid_Phone_number}     0800782723
${Valid_Email_Webmail}    654259029@webmail.npru.ac.th
${SCROLL_SCRIPT_DOWN}    window.scrollTo(0, document.body.scrollHeight);

*** Test Cases ***
Successfully Signed Up
    [Documentation]    ผู้ใช้สามารถลงทะเบียนสำเร็จด้วยข้อมูลที่ถูกต้อง
    Open Signup Form
    Input TH Information    ${Valid_Thai_Name_Title}    ${Valid_Thai_Firstname}    ${Valid_Thai_Lastname}
    Input EN Information    ${Valid_English_Name_Title}    ${Valid_English_Firstname}    ${Valid_English_Lastname}
    Input Birthday    ${Valid_Day}    ${Valid_Month}    ${Valid_YearB_E}
    Input ID Card    ${Valid_ID_Card}
    Input Password    ${Valid_Password}
    Input Phone Number    ${Valid_Phone_number}
    Input Email    ${Valid_Email_Webmail}
    Input Checkbox
    Click Button
    Verify Signup Success

Check Invalid Name TH
    [Documentation]    ตรวจสอบข้อความผิดพลาดสำหรับชื่อไทยที่ไม่ถูกต้อง
    Open Signup Form
    Input TH Information    ${Valid_Thai_Name_Title}    ${Valid_English_Firstname}    ${Valid_Thai_Lastname}
    Verify Invalid Name_TH_Only

Check Invalid Name EN
    [Documentation]    ตรวจสอบข้อความผิดพลาดสำหรับชื่ออังกฤษที่ไม่ถูกต้อง
    Open Signup Form
    Input EN Information    ${Valid_English_Name_Title}    ${Valid_Thai_Firstname}    ${Valid_English_Lastname}
    Verify Invalid Name_EN_Only

Check Invalid ID Card
    [Documentation]    ตรวจสอบข้อความผิดพลาดสำหรับหมายเลขบัตรประชาชนที่ไม่ถูกต้อง
    Open Signup Form
    Input ID Card    W1739300002297
    Execute JavaScript    ${SCROLL_SCRIPT_DOWN}
    Sleep    2s
    Input Checkbox
    Click Button 
    Verify Invalid IDcard_Only
    Capture Page Screenshot

Check Invalid Password
    [Documentation]    ตรวจสอบข้อความผิดพลาดสำหรับรหัสผ่านไม่ถูกต้อง
    Open Signup Form
    Input Password    IsNotPassword
    Execute JavaScript    ${SCROLL_SCRIPT_DOWN}
    Sleep    2s
    Input Checkbox
    Click Button 
    Verify Invalid IDcard_Only
    Capture Page Screenshot

Check Invalid Phone_number
    [Documentation]    ตรวจสอบข้อความผิดพลาดสำหรับเบอร์โทรศัพท์ไม่ถูดต้อง
    Open Signup Form
    Input Phone_number     0800782723
    Execute JavaScript    ${SCROLL_SCRIPT_DOWN}
    Sleep    2s
    Input Checkbox
    Click Button 
    Verify Invalid IDcard_Only
    Capture Page Screenshot

Check Invalid Email_Webmail
    [Documentation]    ตรวจสอบข้อความผิดพลาดสำหรับEmailไม่ถูกต้อง
    Open Signup Form
    Input Email  Moshi2544@gmail.com
    Execute JavaScript    ${SCROLL_SCRIPT_DOWN}
    Sleep    2s
    Input Checkbox
    Click Button 
    Verify Invalid IDcard_Only
    Capture Page Screenshot

*** Keywords ***
Open Signup Form
    Open Browser    ${URL}    ${BROWSER}
    Wait Until Page Contains Element    id=root

Input TH Information
    [Arguments]    ${title}    ${firstname}    ${lastname}
    Select From List by Value    id=nameTitleTha    ${title}
    Input Text    id=firstnameTha    ${firstname}
    Input Text    id=lastnameTha    ${lastname}

Input EN Information
    [Arguments]    ${title}    ${firstname}    ${lastname}
    Select From List by Value    id=nameTitleEng    ${title}
    Input Text    id=firstnameEng    ${firstname}
    Input Text    id=lastnameEng    ${lastname}

Input Birthday
    [Arguments]    ${day}    ${month}    ${year}
    Select From List by Value    id=birthDate    ${day}
    Select From List by Label    id=birthMonth    ${month}
    Select From List by Label    id=birthYear    ${year}

Input ID Card
    [Arguments]    ${id_card}
    Input Text    id=idCard    ${id_card}

Input Password
    [Arguments]    ${password}
    Input Text    id=password    ${password}

Input Phone Number
    [Arguments]    ${phone}
    Input Text    id=mobile    ${phone}

Input Email
    [Arguments]    ${email}
    Input Text    id=email    ${email}

Input Checkbox
    Execute JavaScript    document.getElementById('accept').click()

Click Button
    Execute JavaScript    document.getElementById('submitbtn').click()

Verify Signup Success
    Page Should Contain    Submitting...

Verify Invalid Name_TH_Only
    Page Should Contain    ต้องเป็นภาษาไทยเท่านั้น

Verify Invalid Name_EN_Only
    Page Should Contain    ต้องเป็นภาษาอังกฤษเท่านั้น

Verify Invalid IDcard_Only
    Page Should Contain    ต้องเป็นตัวเลขเท่านั้น

Verify Invalid Password_Only
    Page Should Contain    Password must contain at least one number letter

Verify Invalid Phone_number_Only
    Page Should Contain    Must be exactly 10 characters

Verify Invalid Email_Webmail_Only
    Page Should Contain    Email must contain specific domain name