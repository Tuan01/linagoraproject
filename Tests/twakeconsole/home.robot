*** Settings ***
Library  SeleniumLibrary
Library    ../../Libraries/CustomLib.py
Resource    ../../Resources/common.robot
Resource    ../../Resources/twakeconsole/loginpage.robot
Resource    ../../Resources/twakeconsole/homepage.robot
Resource    ../../Resources/twakeconsole/commontwakeconsole.robot

Test Setup   Start Web Test
# Test Teardown   End Web Test

*** Variables ***
${EXPECTED_TITLE} =      Yes, Twake is Open-Source - TWAKE
${TOAST_MESSSAGE_ADD_USER_SUCCESS} =    New user added
${EMAIL} =               saoke012@yopmail.com
${NAME} =                Sao Ke
${reset_password} =       Secret1@
${EXPECTED_ROLE} =       Admin
${emailTextbox} =        Email
${nameTextbox} =         Name
${save_button} =         Save 

*** Test Cases ***
# TC_01: User With Owner Role Can Create a New Member With Member Role
    # ${random_email} =        Get Random Email
    # Open Twake Console    
    # Close TourGuide     
    # Click To Create A New Member Button
    # The Popup Add new user Is Displayed 
    # Enter Email And Name Into Textbox   ${random_email}    ${emailTextbox}
    # Enter Email And Name Into Textbox    ${NAME}    ${nameTextbox}
    # Select To Role Member In DropdownList    ${EXPECTED_ROLE}
    # Click To Cancel Or Save Button           ${save_button} 
    # Verify the toast message added new user displayed    ${TOAST_MESSSAGE_ADD_USER_SUCCESS}
    

TC_02: User Can Create A New Member With Guest Role 
    ${random_email} =        Get Random Email
    Open Twake Console    
    Close TourGuide     
    Click To Create A New Member Button
    The Popup Add new user Is Displayed 
    Enter Email And Name Into Textbox   ${random_email}    ${emailTextbox}
    Enter Email And Name Into Textbox    ${NAME}    ${nameTextbox}
    Select To Role Member In DropdownList    ${EXPECTED_ROLE}
    Untick Checkbox to Enter Password
    Change Password    ${reset_password}}   
    Click To Cancel Or Save Button           ${save_button} 
    Verify the toast message added new user displayed    ${TOAST_MESSSAGE_ADD_USER_SUCCESS}


# TC_03: User Can Create A New Member With Member Role 


# TC_04: User Can Ser Password When Creating A New User 


# TC_05: User Can Ser New Password When Creating A New User 


# TC_05: User Can Ser Password When Creating A New User 







    

