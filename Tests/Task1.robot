*** Settings ***
Library  DateTime
Resource  ../Resources/Common.robot

*** Variables
${FIRST}  ${3}
${SECOND}  ${9}
${SUM}  ${12}


*** Test Cases ***
Add two integers
    [Tags]  checks  test1
    Common.Check Evaluate Calculates Sum

Compare time after specified delay
    [Tags]  checks  test2
    ${delay}=  Set Variable  2 minutes
    Common.Check Add Time To Date  ${delay}