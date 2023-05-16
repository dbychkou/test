*** Settings ***
Library    SeleniumLibrary


*** Keywords ***
User is redirected to sign in page on attempt to open home page
    [Documentation]    Go to main page and wait redirection to sign in
    SeleniumLibrary.Go to    ${HOME_URL}
    SeleniumLibrary.Wait Until Location Is    ${SIGNIN_URL}


Fill Username
    [Documentation]    Type username value in email field
    [Arguments]    ${username}
    SeleniumLibrary.Element Should Be Visible    ${LOGIN_FORM_EMAIL_LOCATOR}
    Input Text    ${LOGIN_FORM_EMAIL_LOCATOR}    ${username}


Fill Password
    [Documentation]    Type password value in password field
    [Arguments]    ${password}
    SeleniumLibrary.Element Should Be Visible    ${LOGIN_FORM_PASSWORD_LOCATOR}
    Input Password    ${LOGIN_FORM_PASSWORD_LOCATOR}    ${password}


Click Login Button
    [Documentation]    Wait until login button is displayed and click it
    SeleniumLibrary.Element Should Be Enabled    ${LOGIN_BUTTON_SAVE_LOCATOR}
    Click Button    ${LOGIN_BUTTON_SAVE_LOCATOR}





