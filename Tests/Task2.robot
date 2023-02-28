*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/openweathermap.robot
Resource  ../Resources/variables.robot


Test Setup    Open Login Page    ${URL}
Test Teardown    Close Browser


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


*** Test Cases ***
Only user with valid credentials can login
    [Documentation]    The following cases are tested: Login With Empty Username, Login With Empty Password,
    ...                Login With Invalid Username, Login With Invalid Password, Login With Valid Credentials
    [Tags]  openweathermap
    [Template]  Login with valid and invalid credentials
    ${EMPTY_USERNAME}    ${VALID_PASSWORD}    should_login=${False}
    ${VALID_USERNAME}    ${EMPTY_PASSWORD}    should_login=${False}
    ${INVALID_USERNAME}    ${VALID_PASSWORD}    should_login=${False}
    ${VALID_USERNAME}    ${INVALID_PASSWORD}    should_login=${False}
    ${VALID_USERNAME}    ${VALID_PASSWORD}    should_login=${True}


Authorization notification can be closed
    [Tags]  openweathermap
    Login to openweathermap    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Close Signed Successfully Alert
    Alert Should Not Be Displayed


Authorization notification is not closed automatically
    [Tags]  openweathermap
    Login to openweathermap    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Sleep  1m
    Signed In Successfully Alert Should Be Displayed


User logout
    [Tags]  openweathermap
    Login to openweathermap    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Logout from openweathermap
    Signed Out Notification Should Be Displayed
