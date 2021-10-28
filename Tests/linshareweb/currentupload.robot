*** Settings ***
Library     SeleniumLibrary
Resource    ../../Resources/common.robot
Resource    ../../Resources/linshare/homepage.robot
Resource    ../../Resources/linshare/loginpage.robot
Resource    ../../Resources/linshare/common_linshare.robot
Resource    ../../Resources/linshare/myspace.robot
Resource    ../../Resources/linshare/sharespace.robot
Resource    ../../Resources/linshare/currentuploadpage.robot

Test Setup   Start Web Test
Test Teardown   Linshare TearDown    ${file_to_upload}

*** Variables ***
${name_item} =        Current uploads
${title_in_page} =    Upload and share 
${action_name} =      Pause
# @{file_name} =      {"fun.jpg", "abc.jpg"}

*** Test Cases ***
# TC_01_Verify User Can Upload Single File 
#     ${file_to_upload} =    Prepare Files To Upload    1    fun.jpg
#     # ${file_names} =    Create List    cat.jpg    dog.jpg    fun.jpg        
#     Open Linshare
#     Go to items In Left Menu    ${name_item}    ${title_in_page}
#     Upload File     ${file_to_upload}[0]
#     Verify The Uploaded File is Listed In The Current Upload    ${file_to_upload}[0]
#     Verify the File Was Uploaded Successfully    ${file_to_upload}
#     Notification Upload File Successfully    ${file_to_upload}[0]

# TC_02_Verify User Can Upload Multiple Files 
#     ${file_to_upload} =    Prepare Files To Upload    4    fun.jpg
#     Open Linshare
#     Go to items In Left Menu    ${name_item}    ${title_in_page}
#     Upload Multiple Files   ${file_to_upload}
#     Verify Uploaded File Is Listed In The Current Upload    ${file_to_upload}
#     Verify the File Was Uploaded Successfully    ${file_to_upload}

TC_03_Verify User Can Pause Uploading File In List Of Uploading Files 
    ${file_to_upload} =    Prepare Files To Upload    1    chromedriver.zip
    Open Linshare
    Go to items In Left Menu    ${name_item}    ${title_in_page}
    Upload Multiple Files   ${file_to_upload}
    Verify Uploaded File Is Listed In The Current Upload    ${file_to_upload}
    Verify the File Was Uploaded Successfully    ${file_to_upload}
    # Action For Multiple Files     ${file_to_upload}    ${action_name}
    # Verify Actions Of Files Sucessfull    ${file_to_upload}    ${action_name}
