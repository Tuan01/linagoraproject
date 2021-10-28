*** Settings ***
Library  SeleniumLibrary
Resource    ../../Resources/common.robot
Resource    ../../Resources/twakeconsole/loginpage.robot
Resource    ../../Resources/twakeconsole/homepage.robot
Resource    ../../Resources/twakeconsole/commontwakeconsole.robot

Test Setup   Start Web Test
Test Teardown   End Web Test

*** Variables ***
${EXPECTED_TITLE} =    Yes, Twake is Open-Source - TWAKE

*** Test Cases ***
# # User can access to Open Paas's Login page
#     Navigate To
#     Verify Login Page Is Loaded

User Can Click Open Source 
    Navigate To
    Verify Login Page Is Loaded
    Click To OPen Source Link    ${EXPECTED_TITLE} 

User Can Login To Twake Console Successfully
    Navigate To
    Login to TwakeConsole  ${UserEmail}   ${UserPassword}
    Verify Home Page is Loaded Succesfully
    




