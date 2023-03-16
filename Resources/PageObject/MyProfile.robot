*** Keywords ***
Change User Name
    ${new_user_name}=    String.Generate Random String    8    [LETTERS][NUMBERS]
    Input Text   //input[@id='profile_form_username']    ${new_user_name}
    Click Element    //input[@value='Save']
    [Return]    ${new_user_name}


Profile Updated Successfully Alert Should Be Displayed
    Element Should Be Visible    //div[contains(text(),'Profile was updated successfully')]