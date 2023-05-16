*** Settings ***
Library  SeleniumLibrary
Library  String

Resource    PageObject/Common.robot
Resource    PageObject/LoginPage.robot
Resource    PageObject/MyProfile.robot
Resource    PageObject/MainPage.robot


*** Keywords ***
Generate New Username
    ${new_username}=    String.Generate Random String    8    [LETTERS][NUMBERS]
    [Return]    ${new_username}


Login to openweathermap
    [Arguments]    ${username}    ${password}
    LoginPage.Fill Username    ${username}
    LoginPage.Fill Password    ${password}
    LoginPage.Click Login Button


Open Main Page And Wait
    Setup.Browser setup
    MainPage.Wait Main Page Loading
    SeleniumLibrary.Wait Until Element Is Visible    ${MENU_SIGNIN_LOCATOR}


Homepage Should Be Displayed After Login
    ${current_url}=    SeleniumLibrary.Get Location
    BuiltIn.Should Be Equal  ${current_url}    ${HOME_URL}


Login with valid and invalid credentials
    [Arguments]      ${username}    ${password}    ${should_login}
    Login to openweathermap    ${username}    ${password}
    IF    ${should_login} == ${True}
        Common.Signed In Successfully Alert Should Be Displayed
        Homepage Should Be Displayed After Login
    ELSE
        Common.Invalid Email Or Password Alert Should Be Displayed
        LoginPage.User is redirected to sign in page on attempt to open home page
    END


Change User Name
    ${new_username}=    Generate New Username
    MyProfile.Fill Username On Profile Page    ${new_username}
    MyProfile.Click Save Button On Profile Page
    [Return]    ${new_username}





