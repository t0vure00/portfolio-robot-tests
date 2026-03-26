*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resources/Common.robot
Test Teardown    close browser
Force Tags    Regression

*** Variables ***
${URL}  https://t0vure00.github.io/portfolio-app/#/background

*** Test Cases ***
Page title is Tausta
    [Tags]    Smoke
    # Arrange
    Start Browser and Maximize    ${URL}
    sleep    4s

    # Act & Assert
    element text should be    //div[starts-with(@class,'Header_header__title')]    TAUSTA

Page title changes to Background
    # Arrange
    Start Browser and Maximize    ${URL}
    sleep    4s

    # Act
    mouse over    //span[contains(text(),'FI')]
    click element    //button[contains(text(),'EN')]

    # Assert
    element text should be    //div[starts-with(@class,'Header_header__title')]    BACKGROUND

