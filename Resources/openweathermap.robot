*** Settings ***
Library  SeleniumLibrary


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
    Element Should Be Visible    //div[contains(text(),'Signed in successfully.')]


Invalid Email Or Password Alert Should Be Displayed
    Element Should Be Visible    //div[contains(text(),'Invalid Email or password.')]


Login with invalid credentials should fail
    [Arguments]      ${username}    ${password}
    Login to openweathermap    ${username}    ${password}
    Invalid Email Or Password Alert Should Be Displayed


Close Signed Successfully Alert
    Click Button    //*[@class='close']


Alert Should Not Be Displayed
    Element Should Not Be Visible    //div[contains(text(),'Signed in successfully.')]


Logout from openweathermap
    Click Element    //div[@class='inner-user-container']
    Click Element    //a[@class='logout']


Signed Out Notification Should Be Displayed
    Element Should Be Visible    //div[contains(text(),'You need to sign in or sign up before continuing.')]