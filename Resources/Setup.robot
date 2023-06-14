*** Settings ***
Library  SeleniumLibrary
Resource    PageObject/NavigationMenu.robot
Resource    PageObject/MainPage.robot

*** Keywords ***
Browser Setup
    [Documentation]    Open browser window and maximize it
    SeleniumLibrary.Open Browser    browser=chrome
    SeleniumLibrary.Maximize Browser Window


Setup Steps
    [Documentation]    Setup Browser and go to Login Page
    Browser Setup
    MainPage.Open Main Page And Wait
    NavigationMenu.Open Login Page