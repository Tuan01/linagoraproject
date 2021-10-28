*** Settings ***
Library     SeleniumLibrary
Resource    ../../Resources/common.robot

*** Variables ***
${LOGIN_WELCOME_HEADER} =        Welcome
${INPUT_EMAIL_TEXTBOX} =        //input[@id='inputEmail']
${INPUT_PASSWORD_TEXTBOX} =     //input[@id='inputPassword']
${SIGN_IN_BUTTON} =             //button[text()='Log in']

*** Keywords ***     
Login to Linshare
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
    Input Into TextBox     ${INPUT_EMAIL_TEXTBOX}      ${text}

Enter To Password Textbox
     [Arguments]     ${text}
    Input Into TextBox     ${INPUT_PASSWORD_TEXTBOX}      ${text}

Click To Login Button
    Click On Button      ${SIGN_IN_BUTTON}

Verify Login Page Is Loaded 
    Wait Until Page Contains    ${LOGIN_WELCOME_HEADER}