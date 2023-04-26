*** Keywords ***
User is redirected to sign in page on attempt to open home page
    Go to    ${HOME_URL}
    Wait Until Location Is    ${SIGNIN_URL}


Login with valid and invalid credentials
    [Arguments]      ${username}    ${password}    ${should_login}
    Login to openweathermap    ${username}    ${password}
    IF    ${should_login} == ${True}
        Signed In Successfully Alert Should Be Displayed
        Homepage Should Be Displayed After Login    ${HOME_URL}
    ELSE
        Invalid Email Or Password Alert Should Be Displayed
        User is redirected to sign in page on attempt to open home page
    END


Login to openweathermap
    [Arguments]    ${username}    ${password}
    Input Text    ${LOGIN_FORM_EMAIL_LOCATOR}    ${username}
    Input Password    ${LOGIN_FORM_PASSWORD_LOCATOR}    ${password}
    Click Button    ${LOGIN_BUTTON_SAVE_LOCATOR}