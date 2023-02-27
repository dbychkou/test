*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/openweathermap.robot
Resource  ../Resources/variables.robot


Test Setup    Open Login Page    ${URL}
Test Teardown    Close Browser


*** Keywords ***
User is redirected to sign in page on attempt to open home page
    [Arguments]    ${HOME_URL}
    Go to    ${HOME_URL}
    Sleep    5s
    ${current_url}=    Get Location
    Should Be Equal  ${current_url}    ${HOME_URL}

Login with invalid credentials should fail
    [Arguments]      ${username}    ${password}
    Login to openweathermap    ${username}    ${password}
    Invalid Email Or Password Alert Should Be Displayed
    #user is redirected to sign in page on attempt to open home page


*** Test Cases ***
Login with valid credentials should pass
    [Tags]  openweathermap
    Login to openweathermap    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Signed In Successfully Alert Should Be Displayed


Login with invalid credentials should fail
    [Documentation]    The following cases are tested: Login With Empty Username, Login With Empty Password,
    ...                Login With Invalid Username, Login With Invalid Password
    [Tags]  openweathermap
    [Template]  Login with invalid credentials should fail

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
