*** Settings ***


*** Test Cases ***
Add two integers
    [Documentation]  Check that 3 + 9 == 12
    ${calculatedSum}=  Evaluate  ${3}+${9}
    Should Be Equal  ${calculatedSum}  ${12}