*** Settings ***
Library  SeleniumLibrary


*** Keywords ***
Wait Main Page Loading
    SeleniumLibrary.Wait Until Element Is Not Visible    ${LOADER_LOCATOR}    10s

Open Main Page And Wait
    SeleniumLibrary.Go To    ${URL}
    Wait Main Page Loading


