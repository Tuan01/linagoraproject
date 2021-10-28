*** Settings ***
Library     SeleniumLibrary
Resource    ../../Resources/common.robot

*** Variables ***
${HEADER_LAYOUT_TITLE} =         //div[text()='Admin Panel']
${BUTTON_CREATE_MEMBER} =        //span[text()='Create a new member']
${TOURGUIDE_POPUP} =             //div[@class='uf-modal-inner']
${CLOSE_BUTTON} =                //button[@class='uf-close-button']
${POPUP_ADD_NEW_USER} =          //div[@class='ant-modal-content']
${PARENT_LOCATOR} =              //span[@class='ant-select-selection-item']
${CHILD_ITEM_LOCATOR} =          //div[@class='ant-select-dropdown-content']//div[@class='ant-select-item-option-content']//span[@class='select-input__option-item-text']
# ${CHILD_ITEM_LOCATOR} =          //div[@class='rc-virtual-list-holder']
*** Keywords ***
# Verify Home Page is Loaded Succesfully 
#     Wait Until Element Is Visible    ${HEADER_LAYOUT_TITLE}    ${WAIT_TIMEOUT_ELEMENT}

Close TourGuide 
    Wait Until Page Contains Element    ${TOURGUIDE_POPUP}
    Click On Element    ${CLOSE_BUTTON}

Click To Create A New Member Button
    Click On Element    ${BUTTON_CREATE_MEMBER}

The Popup Add new user Is Displayed 
    Wait Until Element Is Visible    ${POPUP_ADD_NEW_USER}     ${WAIT_TIMEOUT_ELEMENT}

Enter Email And Name Into Textbox
    [Documentation]    This keyword is used to enter the email and name in add member popup 
    [Arguments]    ${emailTextbox}    ${emailOrNameTextbox}     
    Wait Until Element Is Visible    //label[text()='${emailOrNameTextbox}']/parent::div//input[@type='string']    ${WAIT_TIMEOUT_ELEMENT}     
    Input Into TextBox    //label[text()='${emailOrNameTextbox}']/parent::div//input[@type='string']    ${emailTextbox}

Select To Role Member In DropdownList
    [Arguments]    ${expectedRole}
    Wait Until Element Is Visible     ${PARENT_LOCATOR}   
    Select Item In Custom Dropdown    ${PARENT_LOCATOR}    ${CHILD_ITEM_LOCATOR}   ${expectedRole} 