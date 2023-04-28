*** Settings ***
Library    SeleniumLibrary
Library    String
Resource    ../Resources/openweathermap.robot
Resource    ../Resources/variables.robot
Resource    ../Resources/PageObject/Common.robot
Resource    ../Resources/PageObject/Login.robot
Resource    ../Resources/PageObject/MyProfile.robot
Resource    ../Resources/PageObject/NavigationMenu.robot


Test Setup    Open Login Page
Test Teardown    Close Browser


*** Test Cases ***
Authorization after invalid password
    [Tags]  openweathermap  login
    Login.Login with valid and invalid credentials    ${VALID_USERNAME}    ${INVALID_PASSWORD}    should_login=${False}
    Login.Login with valid and invalid credentials    ${VALID_USERNAME}    ${VALID_PASSWORD}    should_login=${True}

Changing Username
    [Tags]  openweathermap  profile
    Login.Login to openweathermap    ${VALID_USERNAME}    ${VALID_PASSWORD}
    NavigationMenu.Open My Profile

    ${new_user_name}=    MyProfile.Change User Name
    MyProfile.Profile Updated Successfully Alert Should Be Displayed

    NavigationMenu.Open Main Page Using Logo
    openweathermap.Wait Main Page Loading
    NavigationMenu.Username Should Be Updated In Menu    ${new_user_name}

    NavigationMenu.Logout from openweathermap
    Login.Login to openweathermap    ${VALID_USERNAME}    ${VALID_PASSWORD}
    NavigationMenu.Username Should Be Updated In Menu    ${new_user_name}