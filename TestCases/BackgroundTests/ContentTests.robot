*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resources/Common.robot
Test Teardown    close browser
# Arrange
Test Setup    Start Browser Maximize and Wait Header    https://t0vure00.github.io/portfolio-app/#/background
Force Tags    Regression

*** Variables ***

*** Test Cases ***
Page title is Tausta
    [Tags]    Smoke
    # Act & Assert
    element text should be    //div[starts-with(@class,'Header_header__title')]    TAUSTA

Page title changes to Background
    # Act
    mouse over    //span[contains(text(),'FI')]
    click element    //button[contains(text(),'EN')]

    # Assert
    element text should be    //div[starts-with(@class,'Header_header__title')]    BACKGROUND