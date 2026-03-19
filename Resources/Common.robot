*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${Browser}    Chrome

*** Keywords ***
Start Browser and Maximize
    [Arguments]    ${URL}
    open browser    ${URL}    ${Browser}
    maximize browser window