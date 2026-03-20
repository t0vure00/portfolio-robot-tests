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
    [Tags]    Regression
    # Arrange
    Start Browser and Maximize    ${URL}
    sleep    4s

    # Act
    mouse over    //span[contains(text(),'FI')]
    click element    //button[contains(text(),'EN')]

    # Assert
    element text should be    //div[starts-with(@class,'Header_header__title')]    BACKGROUND

Title of page button is Tausta and highlighted as chosen tab
    [Tags]    Smoke
     # Arrange
    Start Browser and Maximize    ${URL}
    sleep    4s

    #Act & Assert
    element should be visible    (//a[starts-with(@class,'PageButtons_page_buttons__button')])[2]
    element text should be    (//a[starts-with(@class,'PageButtons_page_buttons__button')])[2]    TAUSTA
    ${element}=    Get WebElement    (//a[starts-with(@class,'PageButtons_page_buttons__button')])[2]
    ${color}=   call method    ${element}    value_of_css_property    background-color
    should be equal    ${color}    rgba(255, 255, 255, 1)

Title changes to background and is highlighted as chosen tab
    # Arrange
    Start Browser and Maximize    ${URL}
    sleep    4s

    # Act
    mouse over    //span[contains(text(),'FI')]
    click element    //button[contains(text(),'EN')]

    # Assert
    element should be visible    (//a[starts-with(@class,'PageButtons_page_buttons__button')])[2]
    element text should be    (//a[starts-with(@class,'PageButtons_page_buttons__button')])[2]    BACKGROUND
    ${element}=    Get WebElement    (//a[starts-with(@class,'PageButtons_page_buttons__button')])[2]
    ${color}=   call method    ${element}    value_of_css_property    background-color
    should be equal    ${color}    rgba(255, 255, 255, 1)


