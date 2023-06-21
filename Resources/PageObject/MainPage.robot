*** Settings ***
Library  SeleniumLibrary


*** Keywords ***
Wait Main Page Loading
    SeleniumLibrary.Wait Until Element Is Not Visible    ${LOADER_LOCATOR}    10s

Open Main Page And Wait
    SeleniumLibrary.Go To    ${URL}
    Wait Main Page Loading


Fill City Name And Select
    SeleniumLibrary.Element Should Be Visible    ${CITY_SEARCH_FIELD_LOCATOR}
    SeleniumLibrary.Input Text    ${CITY_SEARCH_FIELD_LOCATOR}    ${FULL_CITY_NAME}
    SeleniumLibrary.Element Should Be Visible    ${CITY_SEARCH_BUTTON_LOCATOR}
    SeleniumLibrary.Click Button    ${CITY_SEARCH_BUTTON_LOCATOR}
    SeleniumLibrary.Wait Until Element Is Visible    ${CITY_DROPDOWN_LOCATOR}
    SeleniumLibrary.Click Element    ${CITY_DROPDOWN_LOCATOR}


Find Temperature On UI
    SeleniumLibrary.Wait Until Element Contains    ${CITY_NAME_ON_UI_LOCATOR}    ${FULL_CITY_NAME}
    SeleniumLibrary.Element Should Be Visible    ${TEMPETATURE_ON_UI_LOCATOR}
    ${ui_temperature_celsius_text}=    SeleniumLibrary.Get Text    ${TEMPETATURE_ON_UI_LOCATOR}
    ${ui_temperature_celsius}=    String.Get Substring    ${ui_temperature_celsius_text}    start=0    end=-2
    [Return]    ${ui_temperature_celsius}


Switch UI to Imperial
    SeleniumLibrary.Element Should Be Visible    ${IMPERIAL_SWITCHER_LOCATOR}
    SeleniumLibrary.Click Element    ${IMPERIAL_SWITCHER_LOCATOR}
