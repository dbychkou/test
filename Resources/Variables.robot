*** Variables ***
${URL}    https://openweathermap.org
${HOME_URL}    https://home.openweathermap.org/
${SIGNIN_URL}    https://home.openweathermap.org/users/sign_in

${BASE_API_URL}    https://api.openweathermap.org/data/2.5
${APPID}        45d1a5bfa4a03eb1c7edb0b3574311d8
${CITY_NAME}    Batumi
${CITY_ID}      615532
${BATUMI_LON}          41.6359
${BATUMI_LAT}          41.6416


${VALID_USERNAME}    totest0935@gmail.com
${VALID_PASSWORD}    GhrKL0935!

${EMPTY_USERNAME}    ${EMPTY}
${EMPTY_PASSWORD}    ${EMPTY}

${INVALID_USERNAME}    totest0936@gmail.com
${INVALID_PASSWORD}    GhrKL0936!


${LOGIN_FORM_EMAIL_LOCATOR}    //*[@id='user_email']
${LOGIN_FORM_PASSWORD_LOCATOR}    //*[@id='user_password']
${LOGIN_BUTTON_SAVE_LOCATOR}    //*[@value='Submit']

${PROFILE_FORM_USERNAME_LOCATOR}    //input[@id='profile_form_username']
${PROFILE_BUTTON_SAVE_LOCATOR}    //input[@value='Save']

${ALERT_SIGNED_SUCCESSFULLY_LOCATOR}    //div[contains(text(),'Signed in successfully.')]
${ALERT_BUTTON_CLOSE_LOCATOR}    //*[@class='close']

${MENU_LOCATOR}            //div[@class='inner-user-container']

${LOADER_LOCATOR}    //*[contains(@class, 'owm-loader')]

${MENU_SIGNIN_LOCATOR}    //a[contains(text(),'Sign in')]
${MENU_LOGOUT_LOCATOR}    //a[contains(text(),'Logout')]

${INVALID_EMAIL_OR_PASSWRD_ALERT_LOCATOR}    //div[contains(text(),'Invalid Email or password.')]
${SIGNEDOUT_ALERT_LOCATOR}    //div[contains(text(),'You need to sign in or sign up before continuing.')]

${PROFILE_UPDATED_SUCCESSFULLY_ALERT_LOCATOR}    //div[contains(text(),'Profile was updated successfully')]

${LOGO_LOCATOR}    //li[@class='logo']


${FULL_CITY_NAME}             Batumi, GE
${CITY_SEARCH_FIELD_LOCATOR}    //*[@id="weather-widget"]//div/input
${CITY_SEARCH_BUTTON_LOCATOR}    //*[@id="weather-widget"]//button
${CITY_DROPDOWN_LOCATOR}    //ul[@class="search-dropdown-menu"]/li/span[contains(text(),'${FULL_CITY_NAME}')]

${CITY_NAME_ON_UI_LOCATOR}    //div[@class="current-container mobile-padding"]/div/h2
${TEMPETATURE_ON_UI_LOCATOR}    //div[@class="current-temp"]/span
${IMPERIAL_SWITCHER_LOCATOR}    //div[contains(text(),'Imperial: °F, mph')]
