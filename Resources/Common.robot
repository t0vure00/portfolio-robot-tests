*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${Browser}    Chrome

*** Keywords ***
Start Browser and Maximize
    [Arguments]    ${URL}
    open browser    ${URL}    ${Browser}
    maximize browser window

Start Browser Maximize and Wait Header
    [Arguments]    ${URL}
    open browser    ${URL}    ${Browser}
    maximize browser window
    wait until element is visible    //div[starts-with(@class,'Header_header__')]

Toggle Lang Button to EN
    mouse over    //span[contains(text(),'FI')]
    click element    //button[contains(text(),'EN')]

Get Elements Background Color
    [Arguments]    ${element}
    ${color}=   call method    ${element}    value_of_css_property    background-color
    RETURN    ${color}

Search for
    [Arguments]    ${searchWord}
    input text    name:search    ${searchWord}
    click element    //div[starts-with(@class,'Header_search_button')]