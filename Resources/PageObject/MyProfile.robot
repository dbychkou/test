*** Settings ***
Library    SeleniumLibrary


*** Keywords ***
Fill Username On Profile Page
    [Arguments]    ${new_username}
    SeleniumLibrary.Input Text   ${PROFILE_FORM_USERNAME_LOCATOR}    ${new_username}


Click Save Button On Profile Page
    SeleniumLibrary.Click Element    ${PROFILE_BUTTON_SAVE_LOCATOR}


Profile Updated Successfully Alert Should Be Displayed
    SeleniumLibrary.Element Should Be Visible    ${PROFILE_UPDATED_SUCCESSFULLY_ALERT_LOCATOR}