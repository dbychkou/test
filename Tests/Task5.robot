*** Settings ***
Resource    ../Resources/PageObject/MainPage.robot
Resource    ../Resources/Setup.robot
Resource    ../Resources/Variables.robot
Resource    ../Resources/WebSteps.robot
Resource    ../Resources/API/openweatherapp_api.robot


Test Setup    Setup.Browser Setup And Go To Main Page
Test Teardown    SeleniumLibrary.Close Browser


*** Test Cases ***
Compare data from ui with api (celsius)
    [Tags]    Task5
    ${ui_temparature_celsius}=  WebSteps.Get Temperature On UI For Desired City
    ${temperature_celsius}    openweatherapp_api.Get OpenWeather Temperature In Specified Units    q=${city_name}    units=metric    appid=${appid}
    WebSteps.Difference Should Be Less Than One    ${temperature_celsius}    ${ui_temparature_celsius}


Compare data from ui with api (kelvin)
    [Tags]    Task5
    MainPage.Switch UI to Imperial
    ${ui_temparature_farenheit}=  WebSteps.Get Temperature On UI For Desired City
    ${temperature_farenheit}    openweatherapp_api.Get OpenWeather Temperature In Specified Units    q=${city_name}    units=imperial    appid=${appid}
    WebSteps.Difference Should Be Less Than One    ${temperature_farenheit}    ${ui_temparature_farenheit}