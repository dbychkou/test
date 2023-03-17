*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/openweathermap.robot
Resource  ../Resources/variables.robot
Resource  ../Resources/PageObject/Login.robot


Test Setup    Open Login Page    ${URL}
Test Teardown    Close Browser


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
    [Tags]  openweathermap  logout
    Login to openweathermap    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Logout from openweathermap
    Signed Out Notification Should Be Displayed
