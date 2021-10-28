*** Settings ***
Library  SeleniumLibrary
Library    RPA.Desktop.Clipboard
Resource    ../../Resources/common.robot
Resource    ../../Resources/twakeconsole/loginpage.robot
Resource    ../../Resources/twakeconsole/homepage.robot


*** Variables ***
${HEADER_LAYOUT_TITLE} =                 //div[text()='Admin Panel']      
${TOAST_MESSAGE_ADD_USER_SUCCESS} =      //div[@class='ant-message-notice']//span[string()='New user added']
${COPY_PASSWORD_ICON} =                  //button[@class='ant-btn ant-btn-circle ant-btn-icon-only']//span[@aria-label='copy']
${SEARCH_TEXT} =                         //input[@placeholder='Search for members']
*** Keywords ***
Open Twake Console   
    Login to TwakeConsole  ${UserEmail}   ${UserPassword}
    Verify Home Page is Loaded Succesfully

Verify Home Page is Loaded Succesfully 
    Wait Until Element Is Visible    ${HEADER_LAYOUT_TITLE}    ${WAIT_TIMEOUT_ELEMENT}

Click To Cancel Or Save Button 
    [Arguments]     ${cancel_or_save_text}
    Wait Until Element Is Enabled    //div[text()='${cancel_or_save_text}']   ${WAIT_TIMEOUT_ELEMENT}   
    Click On Element    //div[text()='${cancel_or_save_text}']

Verify the toast message added new user displayed 
    [Arguments]     ${message_actual}
    Wait Until Element Is Visible     ${TOAST_MESSAGE_ADD_USER_SUCCESS}    ${WAIT_TIMEOUT_ELEMENT}
    ${message_expected} =    Get Text    ${TOAST_MESSAGE_ADD_USER_SUCCESS}
    Should Be Equal As Strings    ${message_expected}     ${message_actual}

Copy Password In The Add New User Form 
    Wait Until Element Is Enabled     ${COPY_PASSWORD_ICON}    ${WAIT_TIMEOUT_ELEMENT}
    Click On Element    ${COPY_PASSWORD_ICON}

Untick Checkbox to Enter Password 
    Wait Until Element Is Enabled    //input[@type='checkbox']    ${WAIT_TIMEOUT_ELEMENT}
    JS Click Element    //input[@type='checkbox']

Change Password
    [Arguments]    ${text}
    Wait Until Element Is Visible    //input[@type='password']    ${WAIT_TIMEOUT_ELEMENT}
    Delete Text From Field           //input[@type='password']
    Input Into TextBox    //input[@type='password']    ${text}