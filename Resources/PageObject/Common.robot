*** Settings ***
Library    SeleniumLibrary


*** Keywords ***
Signed In Successfully Alert Should Be Displayed
    [Documentation]    Check that signed successfully alert is displayed
    SeleniumLibrary.Element Should Be Visible    ${ALERT_SIGNED_SUCCESSFULLY_LOCATOR}


Close Signed Successfully Alert
    [Documentation]    Close signed successfully alert
    SeleniumLibrary.Click Button    ${ALERT_BUTTON_CLOSE_LOCATOR}


Alert Should Not Be Displayed
    [Documentation]    Check that signed successfully alert is not displayed
    SeleniumLibrary.Element Should Not Be Visible    ${ALERT_SIGNED_SUCCESSFULLY_LOCATOR}


Signed Out Notification Should Be Displayed
    [Documentation]    Check that signed out successfully alert is displayed
    SeleniumLibrary.Element Should Be Visible    ${SIGNEDOUT_ALERT_LOCATOR}


Invalid Email Or Password Alert Should Be Displayed
    [Documentation]    Check that invalid email or password alert is displayed
    Element Should Be Visible    ${INVALID_EMAIL_OR_PASSWRD_ALERT_LOCATOR}