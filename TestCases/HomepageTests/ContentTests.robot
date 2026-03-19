*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resources/Common.robot
Test Teardown    close browser

*** Variables ***
${URL}  https://t0vure00.github.io/portfolio-app/#/

*** Test Cases ***
Page title is Portfolio
    [Tags]    Regression    Smoke
    # Arrange
    Start Browser and Maximize    ${URL}
    sleep    4s

    # Act & Assert
    element text should be    css=[class^="Header_header__title"]    PORTFOLIO

Language is Finnish by default
    [Tags]    Regression    Smoke
    # Arrange
    Start Browser and Maximize    ${URL}
    sleep    4s

    # Act & Assert
    element text should be    css=[class^="Homepage_homepage__greeting"]    Hei,


Language changes to English
    [Tags]    Regression    Smoke
    # Arrange
    Start Browser and Maximize    ${URL}
    sleep    4s

    # Act
    mouse over    xpath://span[contains(text(),'FI')]
    click element    xpath://button[contains(text(),'EN')]

    # Assert
    element text should be    css=[class^="Homepage_homepage__greeting"]    Hello,
