*** Keywords ***
Calculate Sum
    [Arguments]  ${value1}  ${value2}
    ${result}=  BuiltIn.Evaluate  ${value1} + ${value2}
    [Return]  ${result}


Check Add Time To Date
    [Arguments]  ${delay}
    [Documentation]  Check that current time is ${delay} more than initial time
    ${date1}  Get Current Date
    ${date2}  Add Time To Date  ${date1}  ${delay}
    Log To Console  Wait ${delay}
    Sleep  ${delay}
    ${date3}  Get Current Date
    ${time}=  Subtract Date From Date  ${date3}
    ...                                ${date2}
    Should Be True  ${time} < 1