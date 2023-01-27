*** Settings ***
Library  DateTime

*** Test Cases ***
Check that current time is 2 minutes more than initial time
    ${date1}  Get Current Date
    ${date2}  Add Time to Date  ${date1}  2 minutes
    Log To Console  Wait 2 minutes
    Sleep  2 minutes
    ${date3}  Get Current Date
    ${time}=  Subtract Date From Date  ${date3}  ${date2}
    Should Be True  ${date3}-${date2} < 1 second

