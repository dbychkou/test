*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${SIGNED_ALERT_LOCATOR}    //div[contains(text(),'Signed in successfully.')]


*** Keywords ***
Open Login Page
    [Arguments]    ${login_page}
    Open Browser    ${login_page}    chrome
    Maximize Browser Window
    Wait Until Element Is Not Visible    //*[contains(@class, 'owm-loader')]    10s
    Wait Until Element Is Visible    //a[contains(text(),'Sign in')]
    Click Element    //a[contains(text(),'Sign in')]
    Wait Until Page Contains  Sign In To Your Account


Login to openweathermap
    [Arguments]    ${username}    ${password}
    Input Text    //*[@id='user_email']    ${username}
    Input Password    //*[@id='user_password']    ${password}
    Click Button    //*[@value='Submit']


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


Logout from openweathermap
    Click Element    //div[@class='inner-user-container']
    Click Element    //a[@class='logout']


Signed Out Notification Should Be Displayed
    Element Should Be Visible    //div[contains(text(),'You need to sign in or sign up before continuing.')]