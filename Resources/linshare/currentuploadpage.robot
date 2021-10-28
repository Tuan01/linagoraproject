*** Settings ***
Resource    ../common.robot
Resource    common_linshare.robot

*** Variables ***
${CURRENT_UPLOAD_FILE_UPLOAD_ELE} =        //div[@class='menu-popover-ctn hidden-xs waves-effect clickable']//input[@type="file"]
${CURRENT_UPLOAD_FILE_ADD_FILE_ICON} =     div.menu-popover-ctn.hidden-xs.waves-effect.clickable input
${MESSAGE_A_FILE_NAME} =                   //div[@class='toast-upper-panel']//span[@class='ng-scope ng-binding']

### Waiting Time To Complete Upload 
${SHORT_WAITING_TIME_UPLOAD} =    30
${LONG_WAITING_TIME_UPLOAD} =     100

*** Keywords ***
Upload File 
    [Arguments]    ${file_name}
    Wait Until Page Contains Element    ${CURRENT_UPLOAD_FILE_UPLOAD_ELE}
    Set Element Visible                 ${CURRENT_UPLOAD_FILE_ADD_FILE_ICON}
    Choose File    ${CURRENT_UPLOAD_FILE_UPLOAD_ELE}    ${EXECDIR}/Data/${file_name}


# Upload Multiple Files
#     [Arguments]    ${file_name}    ${number_of_file}
#     Wait Until Page Contains Element    ${CURRENT_UPLOAD_FILE_UPLOAD_ELE}
#     Set Element Visible                 ${CURRENT_UPLOAD_FILE_ADD_FILE_ICON}
#     ${input_text} =    Set Variable     ${EXECDIR}/Data/${file_name}[0]
#     FOR    ${i}    IN RANGE    1    ${number_of_file}
#          ${input_text} =    Set Variable    ${input_text}\n${EXECDIR}/Data/${file_name}[${i}]
#     END
#     Input Text    ${CURRENT_UPLOAD_FILE_UPLOAD_ELE}    ${input_text}

Upload Multiple Files
    [Arguments]    ${files_name}
    Wait Until Page Contains Element    ${CURRENT_UPLOAD_FILE_UPLOAD_ELE}
    Set Element Visible                 ${CURRENT_UPLOAD_FILE_ADD_FILE_ICON}
    ${length} =    Get Length    ${files_name}
    ${input_text} =    Set Variable     ${EXECDIR}/Data/${files_name}[0]
    FOR    ${i}    IN RANGE    1    ${length}
        ${input_text} =    Set Variable    ${input_text}\n${EXECDIR}/Data/${files_name}[${i}]
    END
    Input Text    ${CURRENT_UPLOAD_FILE_UPLOAD_ELE}    ${input_text}

Verify Uploaded File Is Listed In The Current Upload 
    [Arguments]    ${files_name}
    ${length} =    Get Length    ${files_name}
    FOR    ${i}    IN RANGE    0    ${length}
        Wait Until Page Contains   ${files_name}[${i}]
        Page Should Contain     ${files_name}[${i}]
    END

# Verify the File Was Uploaded Successfully 
#     [Arguments]    ${files_name}    ${waiting_time_upload}=${SHORT_WAITING_TIME_UPLOAD}    
#     FOR    ${file_name}    IN    @{files_name}
#         Wait Until Element Is Visible    //div[text()='${file_name}[${i}]']//parent::div[@class='data-list-ctn']/small[text()='done']    ${waiting_time_upload}
#         Element Should Be Visible    //div[text()='${file_name}[${i}]']//parent::div[@class='data-list-ctn']/small[text()='done'] 
# #     END
# Action For Multiple Files 
#     [Arguments]    ${number_of_file}    ${files_name}    ${action_name}
#     ${number of files} =    Prepare Files To Upload    ${number_of_file}    ${files_name}  
#     FOR    ${file_name}    IN    @{${number of files}}
#         Wait Until Element Is Enabled    //div[text()='${file_name}']/../../following-sibling::div//i[@title='${action_name}']
#         Click On Element    //div[text()='${file_name}']/../../following-sibling::div//i[@title='${action_name}']
#     END      

Action For Multiple Files
    [Arguments]    ${files_name}    ${action_name}
    ${length} =    Get Length    ${files_name}
    FOR    ${i}    IN RANGE    0    ${length}
        Wait Until Element Is Enabled    //div[text()='${files_name}[${i}]']/../../following-sibling::div//i[@title='${action_name}']
        Click On Element    //div[text()='${files_name}[${i}]']/../../following-sibling::div//i[@title='${action_name}']
    END


Verify the File Was Uploaded Successfully 
    [Arguments]    ${files_name}     
    ${length} =    Get Length    ${files_name}
    FOR    ${i}    IN RANGE    0    ${length}
        Wait Until Element Is Visible    //div[text()='${files_name}[${i}]']//parent::div[@class='data-list-ctn']/small[text()='done']    ${WAIT_TIMEOUT_ELEMENT}
        Element Should Be Visible    //div[text()='${files_name}[${i}]']//parent::div[@class='data-list-ctn']/small[text()='done'] 
    END

Verify Actions Of Files Sucessfull 
    [Arguments]    ${files_name}    ${action_name}         
    ${length} =    Get Length    ${files_name}   
    FOR    ${i}    IN RANGE    0    ${length}  
        Wait Until Page Does Not Contain Element   //div[text()='${files_name}[${i}]']/../../following-sibling::div//i[@title=' ${action_name}']    ${WAIT_TIMEOUT_ELEMENT}
        Page Should Not Contain Element            //div[text()='${files_name}[${i}]']/../../following-sibling::div//i[@title=' ${action_name}']
    END

Notification Upload File Successfully 
    [Arguments]    ${file_name}
    Wait Until Page Contains    ${file_name} has been successfully uploaded
    Page Should Contain         ${file_name} has been successfully uploaded

Notification Upload Files Successfully 
    Wait Until Page Contains    Some files have been successfully uploaded
    Page Should Contain         Some files have been successfully uploaded

Verify The Notification Uploaded File Displayed
    [Arguments]    @{file_name}
    FOR    ${file_name}    IN    @{files_name}
        Wait Until Element Is Visible   ${MESSAGE_A_FILE_NAME}    ${WAIT_TIMEOUT_ELEMENT}    
    END