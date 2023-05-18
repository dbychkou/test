*** Settings ***
Library    SeleniumLibrary

Resource    ../Resources/Variables.robot
Resource    ../Resources/PageObject/MyProfile.robot
Resource    ../Resources/PageObject/NavigationMenu.robot
Resource    ../Resources/Setup.robot
Resource    ../Resources/WebSteps.robot


Test Setup    Setup.Setup Steps
Test Teardown    SeleniumLibrary.Close Browser


*** Test Cases ***
Authorization after invalid password
    [Tags]  openweathermap  login
    WebSteps.Login with valid and invalid credentials    ${VALID_USERNAME}    ${INVALID_PASSWORD}    should_login=${False}
    WebSteps.Login with valid and invalid credentials    ${VALID_USERNAME}    ${VALID_PASSWORD}    should_login=${True}

Changing Username
    [Tags]  openweathermap  profile
    WebSteps.Login to openweathermap    ${VALID_USERNAME}    ${VALID_PASSWORD}
    NavigationMenu.Open My Profile

    ${new_username}=    WebSteps.Change User Name
    MyProfile.Profile Updated Successfully Alert Should Be Displayed

    NavigationMenu.Open Main Page Using Logo
    MainPage.Wait Main Page Loading
    NavigationMenu.Username Should Be Updated In Menu    ${new_username}

    NavigationMenu.Logout from openweathermap
    WebSteps.Login to openweathermap    ${VALID_USERNAME}    ${VALID_PASSWORD}
    NavigationMenu.Username Should Be Updated In Menu    ${new_username}