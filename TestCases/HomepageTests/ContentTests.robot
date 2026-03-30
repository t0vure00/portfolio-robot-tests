*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resources/Common.robot
Test Teardown    close browser
# Arrange
Test Setup    Start Browser Maximize and Wait Header    https://t0vure00.github.io/portfolio-app/#/
Force Tags    Regression

*** Variables ***

*** Test Cases ***
Page title is Portfolio
    [Tags]    Smoke
    # Act & Assert
    element text should be    //div[starts-with(@class,'Header_header__title')]    PORTFOLIO

Language is Finnish by default
    [Tags]    Smoke
    # Act & Assert
    element text should be    //div[starts-with(@class,'Homepage_homepage__greeting')]    Hei,

Language changes to English
    [Tags]    Smoke
    # Act
    mouse over    //span[contains(text(),'FI')]
    click element    //button[contains(text(),'EN')]

    # Assert
    element text should be    //div[starts-with(@class,'Homepage_homepage__greeting')]    Hello,