*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resources/Common.robot
Test Teardown    close browser
# Arrange
Test Setup    Start Browser Maximize and Wait Header    https://t0vure00.github.io/portfolio-app/#/
Force Tags    Regression

*** Variables ***

*** Test Cases ***
LinkedIn Button goes to LinkedIn
    [Tags]    Smoke
    # Act
    click element    //div[contains(text(),'LinkedIn')]

    # Assert
    title should be    Sign Up | LinkedIn

Language Button has Finnish by default and changes to English when pressed
    # Guard Assert
    element text should be    //span[contains(text(),'FI')]    FI

    # Act
    mouse over    //span[contains(text(),'FI')]
    click element    //button[contains(text(),'EN')]

    # Assert
    element text should be    //span[contains(text(),'EN')]    EN