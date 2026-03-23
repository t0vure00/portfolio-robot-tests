*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resources/Common.robot
Test Teardown    close browser
Force Tags    Regression

*** Variables ***
${URL}  https://t0vure00.github.io/portfolio-app/#/

*** Test Cases ***
Page title is Portfolio
    [Tags]    Smoke
    # Arrange
    Start Browser and Maximize    ${URL}
    sleep    4s

    # Act & Assert
    element text should be    //div[starts-with(@class,'Header_header__title')]    PORTFOLIO

Language is Finnish by default
    [Tags]    Smoke
    # Arrange
    Start Browser and Maximize    ${URL}
    sleep    4s

    # Act & Assert
    element text should be    //div[starts-with(@class,'Homepage_homepage__greeting')]    Hei,

Language changes to English
    [Tags]    Smoke
    # Arrange
    Start Browser and Maximize    ${URL}
    sleep    4s

    # Act
    mouse over    //span[contains(text(),'FI')]
    click element    //button[contains(text(),'EN')]

    # Assert
    element text should be    //div[starts-with(@class,'Homepage_homepage__greeting')]    Hello,

Title of page button is Etusivu and highlighted as chosen tab
    [Tags]    Smoke
     # Arrange
    Start Browser and Maximize    ${URL}
    sleep    4s

    #Act & Assert
    element should be visible    (//a[starts-with(@class,'PageButtons_page_buttons__button')])[1]
    element text should be    (//a[starts-with(@class,'PageButtons_page_buttons__button')])[1]    ETUSIVU
    ${element}=    Get WebElement    (//a[starts-with(@class,'PageButtons_page_buttons__button')])[1]
    ${color}=   call method    ${element}    value_of_css_property    background-color
    should be equal    ${color}    rgba(255, 255, 255, 1)

Title changes to homepage and is highlighted as chosen tab
    # Arrange
    Start Browser and Maximize    ${URL}
    sleep    4s

    # Act
    mouse over    //span[contains(text(),'FI')]
    click element    //button[contains(text(),'EN')]

    # Assert
    element should be visible    (//a[starts-with(@class,'PageButtons_page_buttons__button')])[1]
    element text should be    (//a[starts-with(@class,'PageButtons_page_buttons__button')])[1]    HOMEPAGE
    ${element}=    Get WebElement    (//a[starts-with(@class,'PageButtons_page_buttons__button')])[1]
    ${color}=   call method    ${element}    value_of_css_property    background-color
    should be equal    ${color}    rgba(255, 255, 255, 1)
