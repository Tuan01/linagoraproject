*** Settings ***
Resource    ../common.robot

*** Variables ***
${HOME_ICON_ELEMENT} =      //i[@class='ls-homepage']
${HOST_YOUR_FILE} =         //div[@class='box-3 ng-scope']//i[@class='groups-home-my-files']
${UPLOAD_AND_SHARE} =       //div[@class='box-3 ng-scope']//i[@class='groups-home-share']
${UPLOAD_TO_A_GROUP} =      //div[@class='box-3 ng-scope']//i[@class='groups-home-workgroup']

*** Keywords ***
Verify Linshare Home Page Is Loaded 
    ${IsElementVisible} =     Run Keyword And Return Status    Wait Until Page Contains Element    ${HOME_ICON_ELEMENT}    ${WAIT_TIMEOUT_SELENIUM}
    Run Keyword If    "${IsElementVisible}" == "False"    Wait Until Page Contains    WELCOME TO LINSHARE    ${WAIT_TIMEOUT_SELENIUM}

Select Host Your File
    Click On Element    ${HOST_YOUR_FILE}

Select Upload And Share 
    Click On Element    ${UPLOAD_AND_SHARE}

Select To A Group 
    Click On Element    ${UPLOAD_TO_A_GROUP}

Select Upload Request
    Click On Element    ${UPLOAD_REQUEST}

Upload And Share
    Select Upload And Share
    Press Keys    None    \\ue00c    