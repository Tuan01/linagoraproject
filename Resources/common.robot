*** Settings ***
Library     SeleniumLibrary
Library    String
Library    DateTime
Library    Collections

*** Variables ***
${WAIT_TIMEOUT_ELEMENT} =   30
${WAIT_TIMEOUT_SELENIUM} =  60
${BROWSER} =  chrome

*** Keywords ***
Start Web Test
    Open Browser        about:blank      ${BROWSER}
    Set Window Size    1920    1080
    Set Selenium Timeout  ${WAIT_TIMEOUT_SELENIUM}

End Web Test
    Close All Browsers

Click On Link
    [Arguments]     ${locator}
    Wait Until Element Is Visible   ${locator}   ${WAIT_TIMEOUT_ELEMENT}
    Click Link   ${locator}

Click On Element
    [Arguments]     ${locator}
    Wait Until Element Is Visible   ${locator}   ${WAIT_TIMEOUT_ELEMENT}
    Click Element   ${locator}

Click On Button
    [Arguments]     ${locator}
    Wait Until Element Is Visible   ${locator}   ${WAIT_TIMEOUT_ELEMENT}
    Click Button   ${locator}

Click On Image
    [Arguments]     ${locator}
    Wait Until Element Is Visible   ${locator}   ${WAIT_TIMEOUT_ELEMENT}
    Click Image   ${locator}

Input Into TextBox
    [Arguments]     ${locator}      ${text}
    Wait Until Element Is Visible  ${locator}   ${WAIT_TIMEOUT_ELEMENT}
    Set Focus To Element    ${locator}
    Input Text      ${locator}      ${text}

Delete Text From Field
    [Arguments]     ${locator}
    ${Value} =     Get Element Attribute   ${locator}      value
    ${Backspaces_Count}=    Get Length      ${value}
    Run Keyword If    "${value}" != ''    # if there's no current value - no need to slow down by an extra SE call
    ...     Repeat Keyword  ${Backspaces_Count +1}  Press Keys  ${locator}   \ue003

JS Click Element
    [Arguments]     ${element_xpath}
    Wait Until Page Contains Element     ${element_xpath}
    Execute JavaScript  document.evaluate("${element_xpath}", document, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null).snapshotItem(0).click();


Set Element Visible 
    [Arguments]    ${element}
    Execute Javascript
    ...    var ele = document.querySelector("${element}");
    ...    ele.style.visibility = "visible";

Accept Alert
    Handle Alert    ACCEPT    ${WAIT_TIMEOUT_ELEMENT}

Canncel Alert
     Handle Alert    DISMISS    ${WAIT_TIMEOUT_ELEMENT}


Select Element From List By Lable
    [Arguments]    ${locator}        ${label_value}
    Wait Until Element Is Visible      ${locator}    ${WAIT_TIMEOUT_ELEMENT}
    Select From List By Label          ${locator}    ${label_value}

Switch To Window By ID      
    [Arguments]    ${parentID}
    @{all_windows} =     Get Window Handles
    FOR    ${windowID}    IN    @{all_windows}
        Log    ${windowID}
        ${check} =    Run Keyword And Return Status    Should Be Equal As Strings    ${windowID}    ${parentID}
        Run Keyword If    "${check}" == "False"    Select Window   ${windowID} 
        Exit For Loop If    "${check}" == "False"        
    END

Switch to Window By Title 
    [Arguments]    ${expectedTitle}
    @{all_windows} =     Get Window Handles
    FOR    ${windowID}    IN    @{all_windows}
       Select Window    ${windowID} 
       ${actualTitle} =    Get Title
       Exit For Loop If    " ${actualTitle}" == "${expectedTitle}"
    END

Select Item In Custom Dropdown 
    [Arguments]     ${parentLocator}    ${childItemLocator}    ${expectedItem}
    Click On Element    ${parentLocator}
    @{all_items} =     Get WebElements    ${childItemLocator}
    FOR    ${item}    IN    @{all_items}
        ${item_text} =    Get Text    ${item}
        ${time_stamp} =    Evaluate    '${item_text}'.replace(" ", "")
        IF    "${time_stamp}" == "${expectedItem}"
              Click On Element    ${item}   
              Exit For Loop 
        END      
    END

Get Random Number 
    ${random_number} =    Generate Random String    5    [NUMBERS]
    [Return]    ${random_number}

Get Random Email 
    ${random_number_int} =  Get Random Number
    ${str2} =	Catenate	SEPARATOR=@	Automationtwake${random_number_int}     yopmail.com 
    [Return]    ${str2}    