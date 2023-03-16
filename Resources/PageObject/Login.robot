*** Keywords ***
User is redirected to sign in page on attempt to open home page
    [Arguments]    ${HOME_URL}    ${SIGNIN_URL}
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
        User is redirected to sign in page on attempt to open home page     ${HOME_URL}    ${SIGNIN_URL}
    END


Login to openweathermap
    [Arguments]    ${username}    ${password}
    Input Text    //*[@id='user_email']    ${username}
    Input Password    //*[@id='user_password']    ${password}
    Click Button    //*[@value='Submit']