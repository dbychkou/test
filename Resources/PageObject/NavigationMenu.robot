*** Settings ***
Library    SeleniumLibrary

Resource    MainPage.robot


*** Keywords ***
Open Login Page
    SeleniumLibrary.Click Element    ${MENU_SIGNIN_LOCATOR}
    SeleniumLibrary.Wait Until Page Contains    Sign In To Your Account


Open My Profile
    SeleniumLibrary.Click Element    ${MENU_LOCATOR}
    SeleniumLibrary.Click Link    /home
    SeleniumLibrary.Wait Until Page Contains    My profile


Open Main Page Using Logo
    SeleniumLibrary.Click Element    ${LOGO_LOCATOR}


Logout from openweathermap
    SeleniumLibrary.Click Element    ${MENU_LOCATOR}
    SeleniumLibrary.Click Element    ${MENU_LOGOUT_LOCATOR}


Username Should Be Updated In Menu
    [Arguments]    ${new_username}
    SeleniumLibrary.Element Should Contain    ${MENU_LOCATOR}    ${new_username}