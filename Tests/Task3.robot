*** Settings ***
Library    SeleniumLibrary
Library    String
Resource    ../Resources/openweathermap.robot
Resource    ../Resources/variables.robot
Resource    ../Resources/PageObject/Login.robot
Resource    ../Resources/PageObject/MyProfile.robot


Test Setup    Open Login Page    ${URL}
Test Teardown    Close Browser


*** Test Cases ***
Authorization after invalid password
    [Tags]  openweathermap  login
    login.Login with valid and invalid credentials    ${VALID_USERNAME}    ${INVALID_PASSWORD}    should_login=${False}
    login.Login with valid and invalid credentials    ${VALID_USERNAME}    ${VALID_PASSWORD}    should_login=${True}

Changing Username
    [Tags]  openweathermap  profile
    login.Login to openweathermap    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Open My Profile

    ${new_user_name}=    myprofile.Change User Name
    Profile Updated Successfully Alert Should Be Displayed

    Open Main Page Using Logo
    Wait Main Page Loading
    Username Should Be Updated In Menu    ${new_user_name}

    Logout from openweathermap
    Login to openweathermap    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Username Should Be Updated In Menu    ${new_user_name}