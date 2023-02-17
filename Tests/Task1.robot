*** Settings ***
Library  DateTime
Resource  ../Resources/Common.robot


*** Test Cases ***
Add two integers (case 1)
    [Tags]  checks  test1a
    ${result}=  Common.Check Evaluate Calculates Sum  3+9
    Should Be Equal  ${result}  ${12}

Add two integers (case 2)
    [Tags]  checks  test1b
    ${result}=  Common.Check Evaluate Calculates Sum  1+9
    Should Be Equal  ${result}  ${15}

Compare time after specified delay
    [Tags]  checks  test2
    Common.Check Add Time To Date  2 minutes