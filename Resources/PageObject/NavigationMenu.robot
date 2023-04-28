*** Keywords ***
Open Login Page
    Open Main Page And Wait
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


Username Should Be Updated In Menu
    [Arguments]    ${new_user_name}
    Element Should Contain    ${MENU_LOCATOR}    ${new_user_name}