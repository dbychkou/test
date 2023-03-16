*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${SIGNED_ALERT_LOCATOR}    //div[contains(text(),'Signed in successfully.')]
${MENU_LOCATOR}            //div[@class='inner-user-container']


*** Keywords ***
Wait Main Page Loading
    Wait Until Element Is Not Visible    //*[contains(@class, 'owm-loader')]    10s


Open Login Page
    [Arguments]    ${login_page}
    Open Browser    ${login_page}    chrome
    Maximize Browser Window
    Wait Main Page Loading
    Wait Until Element Is Visible    //a[contains(text(),'Sign in')]
    Click Element    //a[contains(text(),'Sign in')]
    Wait Until Page Contains    Sign In To Your Account


Open My Profile
    Click Element    ${MENU_LOCATOR}
    Click Link    /home
    Wait Until Page Contains    My profile


Open Main Page Using Logo
    Click Element    //li[@class='logo']


Logout from openweathermap
    Click Element    ${MENU_LOCATOR}
    Click Element    //a[contains(text(),'Logout')]


Signed In Successfully Alert Should Be Displayed
    Element Should Be Visible    ${SIGNED_ALERT_LOCATOR}


Homepage Should Be Displayed After Login
    [Arguments]    ${HOME_URL}
    ${current_url}=    Get Location
    Should Be Equal  ${current_url}    ${HOME_URL}


Invalid Email Or Password Alert Should Be Displayed
    Element Should Be Visible    //div[contains(text(),'Invalid Email or password.')]


Close Signed Successfully Alert
    Click Button    //*[@class='close']


Alert Should Not Be Displayed
    Element Should Not Be Visible    ${SIGNED_ALERT_LOCATOR}


Signed Out Notification Should Be Displayed
    Element Should Be Visible    //div[contains(text(),'You need to sign in or sign up before continuing.')]


Username Should Be Updated In Menu
    [Arguments]    ${new_user_name}
    Element Should Contain    ${MENU_LOCATOR}    ${new_user_name}