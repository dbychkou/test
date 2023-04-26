*** Settings ***
Library  SeleniumLibrary


*** Keywords ***
Wait Main Page Loading
    Wait Until Element Is Not Visible    ${LOADER_LOCATOR}    10s


Open Login Page
    [Arguments]    ${login_page}
    Open Browser    ${login_page}    chrome
    Maximize Browser Window
    Wait Main Page Loading
    Wait Until Element Is Visible    ${MENU_SIGNIN_LOCATOR}
    Click Element    ${MENU_SIGNIN_LOCATOR}
    Wait Until Page Contains    Sign In To Your Account


Open My Profile
    Click Element    ${MENU_LOCATOR}
    Click Link    /home
    Wait Until Page Contains    My profile


Open Main Page Using Logo
    Click Element    ${LOGO_LOCATOR}


Logout from openweathermap
    Click Element    ${MENU_LOCATOR}
    Click Element    ${MENU_LOGOUT_LOCATOR}


Signed In Successfully Alert Should Be Displayed
    Element Should Be Visible    ${ALERT_SIGNED_SUCCESSFULLY_LOCATOR}


Homepage Should Be Displayed After Login
    [Arguments]    ${HOME_URL}
    ${current_url}=    Get Location
    Should Be Equal  ${current_url}    ${HOME_URL}


Invalid Email Or Password Alert Should Be Displayed
    Element Should Be Visible    ${INVALID_EMAIL_OR_PASSWRD_ALERT_LOCATOR}


Close Signed Successfully Alert
    Click Button    ${ALERT_BUTTON_CLOSE_LOCATOR}


Alert Should Not Be Displayed
    Element Should Not Be Visible    ${ALERT_SIGNED_SUCCESSFULLY_LOCATOR}


Signed Out Notification Should Be Displayed
    Element Should Be Visible    ${SIGNEDOUT_ALERT_LOCATOR}


Username Should Be Updated In Menu
    [Arguments]    ${new_user_name}
    Element Should Contain    ${MENU_LOCATOR}    ${new_user_name}