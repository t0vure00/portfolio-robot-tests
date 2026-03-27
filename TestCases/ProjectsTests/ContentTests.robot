*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resources/Common.robot
Test Teardown    close browser
Force Tags    Regression

*** Variables ***
${URL}  https://t0vure00.github.io/portfolio-app/#/projects

*** Test Cases ***
Page title is Projektit
    [Tags]    Smoke
    # Arrange
    Start Browser and Maximize    ${URL}
    sleep    4s

    # Act & Assert
    element text should be    //div[starts-with(@class,'Header_header__title')]    PROJEKTIT

Page title changes to Projects
    # Arrange
    Start Browser and Maximize    ${URL}
    sleep    4s

    # Act
    mouse over    //span[contains(text(),'FI')]
    click element    //button[contains(text(),'EN')]

    # Assert
    element text should be    //div[starts-with(@class,'Header_header__title')]    PROJECTS

Language is Finnish by default
    # Arrange
    Start Browser and Maximize    ${URL}
    sleep    4s

    # Act & Assert
    element text should be    //div[starts-with(@class,'ProjectBlock_project_block__title')]    Käytetyt teknologiat

Language changes to English
    # Arrange
    Start Browser and Maximize    ${URL}
    sleep    4s

    # Act
    mouse over    //span[contains(text(),'FI')]
    click element    //button[contains(text(),'EN')]

    # Assert
    element text should be    //div[starts-with(@class,'ProjectBlock_project_block__title')]    Used technologies

Three projects block are shown by default
    [Tags]    Smoke
    # Arrange
    Start Browser and Maximize    ${URL}
    sleep    4s

    # Act
    ${projectElements}=    Get WebElements    //div[starts-with(@class,'Projects_background__scroll')]/div[starts-with(@class,'ProjectBlock_project_block')]

    # Assert
    element should be visible    ${projectElements}[0]
    element should be visible    ${projectElements}[1]
    element should be visible    ${projectElements}[2]
    element should not be visible    ${projectElements}[3]
    element should not be visible    ${projectElements}[4]


Projects move forward by one when next arrow is pressed
    [Tags]    Smoke
    # Arrange
    Start Browser and Maximize    ${URL}
    sleep    4s

    # Act
    click element    //div[starts-with(@class,'Projects_carousel_arrow_next')]
    ${projectElements}=    Get WebElements    //div[starts-with(@class,'Projects_background__scroll')]/div[starts-with(@class,'ProjectBlock_project_block')]

    # Assert
    element should not be visible    ${projectElements}[0]
    element should be visible    ${projectElements}[1]
    element should be visible    ${projectElements}[2]
    element should be visible    ${projectElements}[3]
    element should not be visible    ${projectElements}[4]

Projects move back by one when prev arrow is pressed
    [Tags]    Smoke
    # Arrange
    Start Browser and Maximize    ${URL}
    sleep    4s

    # Guard Act
    click element    //div[starts-with(@class,'Projects_carousel_arrow_next')]
    ${projectElements}=    Get WebElements    //div[starts-with(@class,'Projects_background__scroll')]/div[starts-with(@class,'ProjectBlock_project_block')]

    # Guard Assert
    element should not be visible    ${projectElements}[0]
    element should be visible    ${projectElements}[1]
    element should be visible    ${projectElements}[2]
    element should be visible    ${projectElements}[3]
    element should not be visible    ${projectElements}[4]

    # Act
    click element    //div[starts-with(@class,'Projects_carousel_arrow_prev')]
    ${projectElements}=    Get WebElements    //div[starts-with(@class,'Projects_background__scroll')]/div[starts-with(@class,'ProjectBlock_project_block')]

    # Assert
    element should be visible    ${projectElements}[0]
    element should be visible    ${projectElements}[1]
    element should be visible    ${projectElements}[2]
    element should not be visible    ${projectElements}[3]
    element should not be visible    ${projectElements}[4]

Last project is shown
    # Arrange
    Start Browser and Maximize    ${URL}
    sleep    4s

    # Guard Act
    ${projectElements}=    Get WebElements    //div[starts-with(@class,'Projects_background__scroll')]/div[starts-with(@class,'ProjectBlock_project_block')]
    ${length}=    evaluate    len($projectElements) - 3
    FOR    ${i}    IN RANGE   ${length}
    click element    //div[starts-with(@class,'Projects_carousel_arrow_next')]
    END

    # Guard Assert
    element should not be visible    ${projectElements}[0]
    element should not be visible    ${projectElements}[1]
    element should be visible    ${projectElements}[2]
    element should be visible    ${projectElements}[3]
    element should be visible    ${projectElements}[4]

Search works with lower case letters
    [Tags]    Smoke
    # Arrange
    Start Browser and Maximize    ${URL}
    sleep    4s

    # Act
    input text    name:search    arduino
    click element    //div[starts-with(@class,'Header_search_button')]

    # Assert
    ${projectElements}=    Get WebElements    //div[starts-with(@class,'Projects_background__scroll')]/div[starts-with(@class,'ProjectBlock_project_block')]
    FOR    ${element}    IN    @{projectElements}
    element should contain    ${element}    arduino    ignore_case=True
    END

Search works with upper case letters
    [Tags]    Smoke
    # Arrange
    Start Browser and Maximize    ${URL}
    sleep    4s

    # Act
    input text    name:search    HTML
    click element    //div[starts-with(@class,'Header_search_button')]

    # Assert
    ${projectElements}=    Get WebElements    //div[starts-with(@class,'Projects_background__scroll')]/div[starts-with(@class,'ProjectBlock_project_block')]
    FOR    ${element}    IN    @{projectElements}
    element should contain    ${element}    html    ignore_case=True
    END

Search works with mixed case letters
    # Arrange
    Start Browser and Maximize    ${URL}
    sleep    4s

    # Act
    input text    name:search    JaVaSCRipT
    click element    //div[starts-with(@class,'Header_search_button')]

    # Assert
    ${projectElements}=    Get WebElements    //div[starts-with(@class,'Projects_background__scroll')]/div[starts-with(@class,'ProjectBlock_project_block')]
    FOR    ${element}    IN    @{projectElements}
    element should contain    ${element}    javascript    ignore_case=True
    END

Search displays no projects found with inaccurate searchword
    [Tags]    Smoke
    # Arrange
    Start Browser and Maximize    ${URL}
    sleep    4s

    # Act
    input text    name:search    cow
    click element    //div[starts-with(@class,'Header_search_button')]

    # Assert
    ${projectElements}=    Get WebElements    //div[starts-with(@class,'Projects_background__scroll')]/div[starts-with(@class,'ProjectBlock_project_block')]
    FOR    ${element}    IN    @{projectElements}
    element should contain    ${element}    no projects found    ignore_case=True
    END