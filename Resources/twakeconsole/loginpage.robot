*** Settings ***
Library     SeleniumLibrary
Resource    ../../Resources/common.robot

*** Variables ***
${INPUT_EMAIL_TEXTBOX} =     //input[@id='userfield']
${INPUT_PASSWORD_TEXTBOX} =     //input[@id='passwordfield']
${SIGN_IN_BUTTON} =     //button[@id='sign_in_button']
${LOGIN_PAGE_VISIBLE} =     //div[@class='logo-container']
${OPEN_SOURCE_LINK} =     //span[text()='Open Source']
${TEXT_OPEN_SOURCE} =     //h1[text()='Yes, Twake is Open-Source']

*** Keywords ***

Login to TwakeConsole
    [Arguments]  ${UserEmail}   ${UserPassword}
    Navigate To
    Login To System     ${UserEmail}   ${UserPassword}

Navigate To
    [Arguments]     ${url}=${URL}
    Go To           ${url}    
        
Login To System
    [Arguments]     ${username}   ${password}
    Go To           ${url}
    Enter Input Data And Login     ${username}   ${password}

Enter Input Data And Login
    [Arguments]    ${Email}   ${Password}
   Enter To Email TextBox      ${Email}
   Enter To Password Textbox   ${Password}
   Click To Login Button

Enter To Email TextBox
    [Arguments]     ${text}
    ${login_email_input}    Set Variable   ${INPUT_EMAIL_TEXTBOX}
    Input Into TextBox     ${login_email_input}      ${text}

Enter To Password Textbox
     [Arguments]     ${text}
    ${login_password_input}    Set Variable   ${INPUT_PASSWORD_TEXTBOX}
    Input Into TextBox     ${login_password_input}      ${text}

Click To Login Button
    ${login_btn_ele}  Set Variable     ${SIGN_IN_BUTTON}
    Click On Button      ${login_btn_ele}

Verify Login Page Is Loaded 
    Wait Until Element Is Visible    ${LOGIN_PAGE_VISIBLE}    ${WAIT_TIMEOUT_ELEMENT}

Click To OPen Source Link 
    [Arguments]     ${expectedTitle}
    Click On Element    ${OPEN_SOURCE_LINK}
    Switch to Window By Title    ${expectedTitle}
    Wait Until Page Contains Element    ${TEXT_OPEN_SOURCE}
    Close Window