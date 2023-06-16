*** Settings ***
Library  SeleniumLibrary

Resource  ../Resources/Variables.robot
Resource  ../Resources/PageObject/Common.robot
Resource  ../Resources/PageObject/NavigationMenu.robot
Resource    ../Resources/Setup.robot
Resource  ../Resources/WebSteps.robot


Test Setup    Setup.Setup Steps
Test Teardown    SeleniumLibrary.Close Browser


*** Test Cases ***
Only user with valid credentials can login
    [Documentation]    The following cases are tested: Login With Empty Username, Login With Empty Password,
    ...                Login With Invalid Username, Login With Invalid Password, Login With Valid Credentials
    [Tags]  openweathermap
    [Template]  WebSteps.Login with valid and invalid credentials
    ${EMPTY_USERNAME}    ${VALID_PASSWORD}    should_login=${False}
    ${VALID_USERNAME}    ${EMPTY_PASSWORD}    should_login=${False}
    ${INVALID_USERNAME}    ${VALID_PASSWORD}    should_login=${False}
    ${VALID_USERNAME}    ${INVALID_PASSWORD}    should_login=${False}
    ${VALID_USERNAME}    ${VALID_PASSWORD}    should_login=${True}


Authorization notification can be closed
    [Tags]  openweathermap
    WebSteps.Login to openweathermap    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Common.Close Signed Successfully Alert
    Common.Alert Should Not Be Displayed


Authorization notification is not closed automatically
    [Tags]  openweathermap
    WebSteps.Login to openweathermap    ${VALID_USERNAME}    ${VALID_PASSWORD}
    BuiltIn.Sleep  1m
    Common.Signed In Successfully Alert Should Be Displayed


User logout
    [Tags]  openweathermap  logout
    WebSteps.Login to openweathermap    ${VALID_USERNAME}    ${VALID_PASSWORD}
    NavigationMenu.Logout from openweathermap
    Common.Signed Out Notification Should Be Displayed
