*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resources/Common.robot
Test Teardown    close browser

*** Variables ***
${URL}  https://t0vure00.github.io/portfolio-app/#/

*** Test Cases ***
LinkedIn Button goes to LinkedIn
    [Tags]    Regression    Smoke
    # Arrange
    Start Browser and Maximize    ${URL}
    sleep    4s

    # Act
    click element    xpath://div[contains(text(),'LinkedIn')]

    # Assert
    title should be    Sign Up | LinkedIn

Language Button has Finnish by default and changes to English when pressed
    [Tags]    Regression
    # Arrange
    Start Browser and Maximize    ${URL}
    sleep    4s

    # Guard Assert
    element text should be    xpath://span[contains(text(),'FI')]    FI

    # Act
    mouse over    xpath://span[contains(text(),'FI')]
    click element    xpath://button[contains(text(),'EN')]

    # Assert
    element text should be    xpath://span[contains(text(),'EN')]    EN