*** Keywords ***
Start OpenWeatherMap Session
    ${certifi_path}=    Evaluate    certifi.where()
    Create Session      OpenWeatherMap    ${BASE_API_URL}
    [Return]    ${certifi_path}

Compare Coordinates With Reference
    [Arguments]    ${json_data}
    ${response_lon}    Set Variable    ${json_data['coord']['lon']}
    ${response_lat}    Set Variable    ${json_data['coord']['lat']}
    Should Be Equal As Strings    ${response_lon}    ${lon}
    Should Be Equal As Strings    ${response_lat}    ${lat}


Get OpenWeather Data With Params
    [Arguments]    &{params}
    ${certifi_path}=    Start OpenWeatherMap Session
    ${response}=        GET On Session    OpenWeatherMap    url=/weather    params=&{params}    verify=${certifi_path}
    Should Be Equal As Strings    ${response.status_code}    200
    ${json_data}            Set Variable    ${response.json()}
    Remove From Dictionary    ${json_data}    dt
    [Return]    ${json_data}


Convert Kelvin to Celsius
    [Arguments]    ${kelvin}
    ${celsius}=    Evaluate    ${kelvin} - 273.15
    ${rounded_celsius}    Convert To Number    ${celsius}    2
    [Return]    ${rounded_celsius}


Convert Kelvin to Fahrenheit
    [Arguments]    ${kelvin}
    ${fahrenheit}=    Evaluate    ${kelvin} * 9/5 - 459.67
    ${rounded_celsius}    Convert To Number    ${fahrenheit}    2
    [Return]    ${rounded_celsius}


Get OpenWeather Temperature In Specified Units
    [Arguments]    &{params}
    ${certifi_path}=    Start OpenWeatherMap Session
    ${response}=        GET On Session    OpenWeatherMap    url=/weather    params=&{params}    verify=${certifi_path}
    Should Be Equal As Strings    ${response.status_code}    200
    ${json_data}            Set Variable    ${response.json()}
    ${temp}      Set Variable    ${json_data['main']['temp']}
    [Return]    ${temp}


Get OpenWeather Temperature In Standard Units
    [Arguments]    ${city_name}    ${appid}
    ${certifi_path}=    Start OpenWeatherMap Session
    ${response}=        GET On Session    OpenWeatherMap    url=/weather?q=${city_name}&appid=${appid}&units=standard    verify=${certifi_path}
    Should Be Equal As Strings    ${response.status_code}    200
    #Should Contain          ${response.headers['Content-Type']}    application/json
    ${json_data}            Set Variable    ${response.json()}
    ${kelvin}    Set Variable    ${json_data['main']['temp']}
    [Return]    ${kelvin}


Get OpenWeather Temperature In Metric Units
    [Arguments]    ${city_name}    ${appid}
    ${certifi_path}=    Start OpenWeatherMap Session
    ${response}=        GET On Session    OpenWeatherMap    url=/weather?q=${city_name}&appid=${appid}&units=metric    verify=${certifi_path}
    Should Be Equal As Strings    ${response.status_code}    200
    #Should Contain          ${response.headers['Content-Type']}    application/json
    ${json_data}            Set Variable    ${response.json()}
    ${celsius}    Set Variable    ${json_data['main']['temp']}
    [Return]    ${celsius}


Get OpenWeather Temperature In Imperial Units
    [Arguments]    ${city_name}    ${appid}
    ${certifi_path}=    Start OpenWeatherMap Session
    ${response}=        GET On Session    OpenWeatherMap    url=/weather?q=${city_name}&appid=${appid}&units=imperial    verify=${certifi_path}
    Should Be Equal As Strings    ${response.status_code}    200
    #Should Contain          ${response.headers['Content-Type']}    application/json
    ${json_data}            Set Variable    ${response.json()}
    ${farenheit}    Set Variable    ${json_data['main']['temp']}
    [Return]    ${farenheit}


Get OpenWeather Temperature Using Invalid Units
    [Arguments]    ${city_name}    ${appid}
    ${certifi_path}=    Start OpenWeatherMap Session
    ${response}=        GET On Session    OpenWeatherMap    url=/weather?q=${city_name}&appid=${appid}&units=invalid    verify=${certifi_path}
    Should Be Equal As Strings    ${response.status_code}    200
    #Should Contain          ${response.headers['Content-Type']}    application/json
    ${json_data}            Set Variable    ${response.json()}
    ${kelvin_invalid_case}    Set Variable    ${json_data['main']['temp']}
    [Return]    ${kelvin_invalid_case}