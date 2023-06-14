*** Settings ***
Library    RequestsLibrary
Library    Collections


*** Keywords ***
Start OpenWeatherMap Session
    ${certifi_path}=    BuiltIn.Evaluate    certifi.where()
    RequestsLibrary.Create Session      OpenWeatherMap    ${BASE_API_URL}
    [Return]    ${certifi_path}

Compare Coordinates With Reference
    [Arguments]    ${json_data}    ${lon}   ${lat}
    ${response_lon}    BuiltIn.Set Variable    ${json_data['coord']['lon']}
    ${response_lat}    BuiltIn.Set Variable    ${json_data['coord']['lat']}
    BuiltIn.Should Be Equal As Strings    ${response_lon}    ${lon}
    BuiltIn.Should Be Equal As Strings    ${response_lat}    ${lat}


Get Full OpenWeather JSON With Params
    [Arguments]    &{params}
    ${certifi_path}=    Start OpenWeatherMap Session
    ${response}=        RequestsLibrary.GET On Session    OpenWeatherMap    url=/weather    params=&{params}    verify=${certifi_path}
    BuiltIn.Should Be Equal As Strings    ${response.status_code}    200
    ${json_data}            Set Variable    ${response.json()}
    [Return]    ${json_data}


Get OpenWeather Data With Params
    [Arguments]    &{params}
    ${json_data}    Get Full OpenWeather JSON With Params    &{params}
    Collections.Remove From Dictionary    ${json_data}    dt
    [Return]    ${json_data}


Convert Kelvin to Celsius
    [Arguments]    ${kelvin}
    ${celsius}=    BuiltIn.Evaluate    ${kelvin} - 273.15
    ${rounded_celsius}    BuiltIn.Convert To Number    ${celsius}    2
    [Return]    ${rounded_celsius}


Convert Kelvin to Fahrenheit
    [Arguments]    ${kelvin}
    ${fahrenheit}=    BuiltIn.Evaluate    ${kelvin} * 9/5 - 459.67
    ${rounded_celsius}    BuiltIn.Convert To Number    ${fahrenheit}    2
    [Return]    ${rounded_celsius}


Get OpenWeather Temperature In Specified Units
    [Arguments]    &{params}
    ${json_data}    Get Full OpenWeather JSON With Params    &{params}
    [Return]        ${json_data['main']['temp']}