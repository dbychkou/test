*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/openweathermap.robot
Resource  ../Resources/variables.robot


Test Setup    Open Login Page    ${URL}
Test Teardown    Close Browser


*** Test Cases ***
Login with valid credentials should pass
    [Tags]  openweathermap
#Verify User logins to openweathermap
    Login to openweathermap    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Signed In Successfully Alert Should Be Displayed


Login with invalid credentials should fail
    [Tags]  openweathermap
    [Template]  Login with invalid credentials should fail
#The following cases are tested:
#Login With Empty Username
#Login With Empty Password
#Login With Invalid Username
#Login With Invalid Password
    ${EMPTY_USERNAME}    ${VALID_PASSWORD}
    ${VALID_USERNAME}    ${EMPTY_PASSWORD}
    ${INVALID_USERNAME}    ${VALID_PASSWORD}
    ${VALID_USERNAME}    ${INVALID_PASSWORD}


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
