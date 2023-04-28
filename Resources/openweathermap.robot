*** Settings ***
Library  SeleniumLibrary


*** Keywords ***
Wait Main Page Loading
    Wait Until Element Is Not Visible    ${LOADER_LOCATOR}    10s


Open Main Page And Wait
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Wait Main Page Loading
    Wait Until Element Is Visible    ${MENU_SIGNIN_LOCATOR}


Homepage Should Be Displayed After Login
    [Arguments]    ${HOME_URL}
    ${current_url}=    Get Location
    Should Be Equal  ${current_url}    ${HOME_URL}





