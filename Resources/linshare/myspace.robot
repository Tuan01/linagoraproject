*** Settings ***
Resource    ../common.robot

*** Variables ***
${TITLE_MYSPACE_PAGE} =     //div[@class='card-header ng-scope']//span[string()='My files']
${SEARCH_FILE_ELE} =        //input[@placeholder='Search by name']
${SELECT_ALL_ICON_ELE} =               //div[@ng-if='template']//i[@class='fa ls-check-o checkbox-table']
${LINSHARE_TOP_NUMBER_SELECTED_ITEM} =      //div[contains(@class,'show-multi-menu')]//div[@class='display-num-selected-items']//span[1]
${LINSHARE_TOP_DELETE_SELECTIONS} =         //a[@*='deleteDocuments(selectedDocuments)']
*** Keywords ***
Verify The MySpace Is Displayed 
    Wait Until Element Is Visible    ${TITLE_MYSPACE_PAGE}    ${WAIT_TIMEOUT_ELEMENT}

Search File By name
    [Arguments]    ${file_name}
    Clear Element Text    ${SEARCH_FILE_ELE}
    Input Into TextBox    ${SEARCH_FILE_ELE}    ${file_name}

The Searched File Exists
    [Arguments]    ${file_name}
    Wait Until Page Contains Element     //p/span[text()='${file_name}']    ${WAIT_TIMEOUT_ELEMENT}
    Page Should Contain Element          //p/span[text()='${file_name}']

Verify File Exists
    [Arguments]    ${file_name}
    ${status} =    Run Keyword And Ignore Error    The Searched File Exists    ${file_name}
    [Return]    ${status}

Click To Select File 
    Wait Until Page Contains Element    ${SELECT_ALL_ICON_ELE}    ${WAIT_TIMEOUT_ELEMENT}
    Click On Element    ${SELECT_ALL_ICON_ELE}

Delete selected File
    Wait Until Element Is Visible           ${LINSHARE_TOP_NUMBER_SELECTED_ITEM}
    Click On Element                        ${LINSHARE_TOP_DELETE_SELECTIONS}     
    Delete Files 
Delete Files
    Set Selenium Speed                      0.1    
    Wait Until Page Contains                You are about to remove
    Click On Element                        //button[text()='Yes, delete']
    Wait Until Page Contains                deleted successfully

Delete File
    Set Selenium Speed      0.1
    Click To Select File
    Delete Selected File