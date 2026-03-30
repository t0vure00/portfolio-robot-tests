*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resources/Common.robot
Test Teardown    close browser
# Arrange
Test Setup    Start Browser Maximize and Wait Header    https://t0vure00.github.io/portfolio-app/#/projects
Force Tags    Regression

*** Variables ***

*** Test Cases ***
Page title is Projektit
    [Tags]    Smoke
    # Act & Assert
    element text should be    //div[starts-with(@class,'Header_header__title')]    PROJEKTIT

Page title changes to Projects
    # Act
    mouse over    //span[contains(text(),'FI')]
    click element    //button[contains(text(),'EN')]

    # Assert
    element text should be    //div[starts-with(@class,'Header_header__title')]    PROJECTS

Language is Finnish by default
    # Act & Assert
    element text should be    //div[starts-with(@class,'ProjectBlock_project_block__title')]    Käytetyt teknologiat

Language changes to English
    # Act
    mouse over    //span[contains(text(),'FI')]
    click element    //button[contains(text(),'EN')]

    # Assert
    element text should be    //div[starts-with(@class,'ProjectBlock_project_block__title')]    Used technologies

Three projects block are shown by default
    [Tags]    Smoke
    # Act
    ${projectElements}=    Get WebElements    //div[starts-with(@class,'Projects_background__scroll')]/div[starts-with(@class,'ProjectBlock_project_block')]

    # Assert
    ${states}=    create list    0    0    0    1    1
    Check projects visibility  ${projectElements}    ${states}

Projects move forward by one when next arrow is pressed
    [Tags]    Smoke
    # Act
    click element    //div[starts-with(@class,'Projects_carousel_arrow_next')]
    ${projectElements}=    Get WebElements    //div[starts-with(@class,'Projects_background__scroll')]/div[starts-with(@class,'ProjectBlock_project_block')]

    # Assert
    ${states}=    create list    1    0    0    0    1
    Check projects visibility  ${projectElements}    ${states}

Projects move back by one when prev arrow is pressed
    [Tags]    Smoke
    # Guard Act
    click element    //div[starts-with(@class,'Projects_carousel_arrow_next')]
    ${projectElements}=    Get WebElements    //div[starts-with(@class,'Projects_background__scroll')]/div[starts-with(@class,'ProjectBlock_project_block')]

    # Guard Assert
    ${states}=    create list    1    0    0    0    1
    Check projects visibility  ${projectElements}    ${states}

    # Act
    click element    //div[starts-with(@class,'Projects_carousel_arrow_prev')]
    ${projectElements}=    Get WebElements    //div[starts-with(@class,'Projects_background__scroll')]/div[starts-with(@class,'ProjectBlock_project_block')]

    # Assert
    ${states}=    create list    0    0    0    1    1
    Check projects visibility  ${projectElements}    ${states}

Last project is shown
    # Act
    ${projectElements}=    Get WebElements    //div[starts-with(@class,'Projects_background__scroll')]/div[starts-with(@class,'ProjectBlock_project_block')]
    ${length}=    evaluate    len($projectElements) - 3
    FOR    ${i}    IN RANGE   ${length}
    click element    //div[starts-with(@class,'Projects_carousel_arrow_next')]
    END

    # Assert
    ${states}=    create list    1    1    0    0    0
    Check projects visibility  ${projectElements}    ${states}

Search works with lower case letters
    [Tags]    Smoke
    # Act
    Search for    arduino

    # Assert
    ${projectElements}=    Get WebElements    //div[starts-with(@class,'Projects_background__scroll')]/div[starts-with(@class,'ProjectBlock_project_block')]
    FOR    ${element}    IN    @{projectElements}
    element should contain    ${element}    arduino    ignore_case=True
    END

Search works with upper case letters
    [Tags]    Smoke
    # Act
    Search for    HTML

    # Assert
    ${projectElements}=    Get WebElements    //div[starts-with(@class,'Projects_background__scroll')]/div[starts-with(@class,'ProjectBlock_project_block')]
    FOR    ${element}    IN    @{projectElements}
    element should contain    ${element}    html    ignore_case=True
    END

Search works with mixed case letters
    # Act
    Search for    JaVaSCRipT

    # Assert
    ${projectElements}=    Get WebElements    //div[starts-with(@class,'Projects_background__scroll')]/div[starts-with(@class,'ProjectBlock_project_block')]
    FOR    ${element}    IN    @{projectElements}
    element should contain    ${element}    javascript    ignore_case=True
    END

Search displays no projects found with inaccurate searchword
    [Tags]    Smoke
    # Act
    Search for    cow

    # Assert
    ${projectElements}=    Get WebElements    //div[starts-with(@class,'Projects_background__scroll')]/div[starts-with(@class,'ProjectBlock_project_block')]
    FOR    ${element}    IN    @{projectElements}
    element should contain    ${element}    no projects found    ignore_case=True
    END

Search field is emptied show again three first projects
    [Tags]    Smoke
    # Guard Act
    Search for    javascript
    sleep    3s

    # Guard Assert
    ${projectElements}=    Get WebElements    //div[starts-with(@class,'Projects_background__scroll')]/div[starts-with(@class,'ProjectBlock_project_block')]
    FOR    ${element}    IN    @{projectElements}
    element should contain    ${element}    javascript    ignore_case=True
    END

    # Act
    press keys    name:search    CTRL+A+BACKSPACE

    # Assert
    ${projectElements}=    Get WebElements    //div[starts-with(@class,'Projects_background__scroll')]/div[starts-with(@class,'ProjectBlock_project_block')]
    ${states}=    create list    0    0    0    1    1
    Check projects visibility  ${projectElements}    ${states}

*** Keywords ***
Check projects visibility
    [Arguments]    ${projects}    ${states}
    ${length}=    get length    ${projects}
    FOR    ${i}    IN RANGE    ${length}
        IF    ${states}[${i}] == 0
            element should be visible    ${projects}[${i}]
        ELSE
            element should not be visible    ${projects}[${i}]
        END
    END