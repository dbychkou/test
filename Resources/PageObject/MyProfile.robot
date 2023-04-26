*** Keywords ***
Change User Name
    ${new_user_name}=    String.Generate Random String    8    [LETTERS][NUMBERS]
    Input Text   ${PROFILE_FORM_USERNAME_LOCATOR}    ${new_user_name}
    Click Element    ${PROFILE_BUTTON_SAVE_LOCATOR}
    [Return]    ${new_user_name}


Profile Updated Successfully Alert Should Be Displayed
    Element Should Be Visible    ${PROFILE_UPDATED_SUCCESSFULLY_ALERT_LOCATOR}