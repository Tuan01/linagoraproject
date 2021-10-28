*** Settings ***
Resource    ../common.robot

*** Variables ***
${TITLE_SHARED_SPACE_PAGE} =     //div[@class='card-header']//span[string()='Shared space']

*** Keywords ***
Verify The ShareSpace Is Displayed 
    Wait Until Element Is Visible    ${TITLE_SHARED_SPACE_PAGE}    ${WAIT_TIMEOUT_ELEMENT}
