*** Settings ***
Library    OperatingSystem
Resource    ../../Resources/common.robot
Resource    ../../Resources/linshare/loginpage.robot
Resource    ../../Resources/linshare/homepage.robot
Resource    ../../Resources/linshare/myspace.robot

*** Variables ***
${item_name} =    My space
${title_name} =    My files
${LINSHARE_USER_PROFILE_AVATA} =    //i[@class='tm-icon ls-my-profile']
${LINSHARE_USER_TOGGLE} =           //ul[@class='dropdown-menu dm-icon pull-right']
${LINSHARE_USER_MENU_LOG_OUT} =     //ul[contains(@class,'dropdown-menu')]//span[text()='Logout']

*** Keywords ***
Open Linshare
    Login to Linshare    ${UserEmail}   ${UserPassword}
    Verify LinShare Loading Successful

Verify LinShare Loading Successful
    Wait Until Page Contains    Welcome to LinShare     ${WAIT_TIMEOUT_ELEMENT}
    Page Should Contain         Welcome to LinShare
    
Evaluate End Range Of File 
    [Arguments]    ${number_of_file}
    ${range_of_file} =    Evaluate    ${number_of_file} + 1
    [Return]    ${range_of_file}

Prepare Files To Upload 
    [Arguments]    ${number_of_file}    ${file_name}
    ${CurrentDate} =    Get Current Date    result_format=%a %B %d %H%M%S UTC %Y
    ${range_of_file} =    Evaluate End Range Of File    ${number_of_file}
    ${file_to_upload} =    Create List
    FOR    ${i}    IN RANGE    1    ${range_of_file}
        Append To List    ${file_to_upload}    ${file_name}_${CurrentDate}_${i}
    END
    FOR    ${i}    IN RANGE    0    ${number_of_file}
        Copy File    ${EXECDIR}/Data/${file_name}    ${EXECDIR}/Data/${file_to_upload}[${i}]
    END
    [Return]    ${file_to_upload}

### Left Menu ###
Go to items In Left Menu 
    [Arguments]    ${name_item}    ${title_in_page}
    Click On Element    //div[@class='sidebar-inner ng-scope']//span[string()='${name_item}']
    Wait Until Page Contains    ${title_in_page}

Linshare Logout 
    Wait Until Element Is Visible    ${LINSHARE_USER_PROFILE_AVATA}
    Click On Element    ${LINSHARE_USER_PROFILE_AVATA}
    Wait Until Element Is Visible    ${LINSHARE_USER_TOGGLE}
    Wait Until Element Is Visible    ${LINSHARE_USER_MENU_LOG_OUT}
    Click On Element    ${LINSHARE_USER_MENU_LOG_OUT}
    ${alert_status} =    Run Keyword And Ignore Error    Alert Should Be Present    action=LEAVE    timeout=5
    Run Keyword If      ${alert_status} == ('PASS', None)   Handle Alert
    Wait Until Page Does Not Contain Element    ${LINSHARE_USER_PROFILE_AVATA}
    Close Browser

Linshare TearDown
    [Arguments]     ${files_name}
    Linshare Logout
    Open Linshare
    Go to items In Left Menu    ${item_name}    ${title_name}
    Search File By name    ${files_name}
    FOR    ${file_name}    IN    @{files_name}
        Remove File    ${EXECDIR}/Data/${file_name}
        Search File By name    ${file_name}
        ${status} =    Verify File Exists    ${file_name}
        IF     ${status} == ('PASS', None)
            Delete File
        END    
    END
    Close All Browsers    


    
