*** Keywords ***
Signed In Successfully Alert Should Be Displayed
    Element Should Be Visible    ${ALERT_SIGNED_SUCCESSFULLY_LOCATOR}


Close Signed Successfully Alert
    Click Button    ${ALERT_BUTTON_CLOSE_LOCATOR}


Alert Should Not Be Displayed
    Element Should Not Be Visible    ${ALERT_SIGNED_SUCCESSFULLY_LOCATOR}


Signed Out Notification Should Be Displayed
    Element Should Be Visible    ${SIGNEDOUT_ALERT_LOCATOR}