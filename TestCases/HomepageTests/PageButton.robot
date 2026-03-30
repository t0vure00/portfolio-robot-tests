*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resources/Common.robot
Test Teardown    close browser
Force Tags    Regression

*** Variables ***
${URL_H}  https://t0vure00.github.io/portfolio-app/#/
${URL_B}  https://t0vure00.github.io/portfolio-app/#/background
${URL_P}  https://t0vure00.github.io/portfolio-app/#/projects

*** Test Cases ***
Title of page button is Etusivu and highlighted as chosen tab
    [Tags]    Smoke
     # Arrange
     Start Browser Maximize and Wait Header  ${URL_H}

    #Act & Assert
    ${homepageButton}=    Get WebElement  (//a[starts-with(@class,'PageButtons_page_buttons__button')])[1]
    element should be visible    ${homepageButton}
    element text should be    ${homepageButton}    ETUSIVU
    ${color}=   Get Elements Background Color    ${homepageButton}
    should be equal    ${color}    rgba(255, 255, 255, 1)

Etusivu is highlighted as chosen tab and others
     # Arrange
    Start Browser Maximize and Wait Header    ${URL_H}

    #Act & Assert
    ${homepageButton}=    Get WebElement  (//a[starts-with(@class,'PageButtons_page_buttons__button')])[1]
    element should be visible    ${homepageButton}
    element text should be    ${homepageButton}    ETUSIVU
    ${color_h}=   Get Elements Background Color    ${homepageButton}
    should be equal    ${color_h}    rgba(255, 255, 255, 1)

    ${backgroundButton}=    Get WebElement    (//a[starts-with(@class,'PageButtons_page_buttons__button')])[2]
    ${color_b}=   Get Elements Background Color    ${backgroundButton}
    should be equal    ${color_b}    rgba(113, 113, 112, 1)

    ${projectsButton}=    Get WebElement    (//a[starts-with(@class,'PageButtons_page_buttons__button')])[3]
    ${color_p}=   Get Elements Background Color    ${projectsButton}
    should be equal    ${color_p}    rgba(113, 113, 112, 1)

Title changes to Homepage and is highlighted as chosen tab
    # Arrange
    Start Browser Maximize and Wait Header    ${URL_H}

    # Act
    Toggle Lang Button to EN

    # Assert
    ${homepageButton}=    Get WebElement  (//a[starts-with(@class,'PageButtons_page_buttons__button')])[1]
    element should be visible    ${homepageButton}
    element text should be    ${homepageButton}    HOMEPAGE
    ${color}=   Get Elements Background Color    ${homepageButton}
    should be equal    ${color}    rgba(255, 255, 255, 1)

Title of page button is Tausta and highlighted as chosen tab
    [Tags]    Smoke
     # Arrange
    Start Browser Maximize and Wait Header    ${URL_B}

    #Act & Assert
    ${backgroundButton}=    Get WebElement  (//a[starts-with(@class,'PageButtons_page_buttons__button')])[2]
    element should be visible    ${backgroundButton}
    element text should be    ${backgroundButton}    TAUSTA
    ${color}=   Get Elements Background Color    ${backgroundButton}
    should be equal    ${color}    rgba(255, 255, 255, 1)

Title changes to Background and is highlighted as chosen tab
    [Tags]    Smoke
    # Arrange
    Start Browser Maximize and Wait Header    ${URL_B}

    # Act
    Toggle Lang Button to EN

    #
    ${backgroundButton}=    Get WebElement  (//a[starts-with(@class,'PageButtons_page_buttons__button')])[2]
    element should be visible    ${backgroundButton}
    element text should be    ${backgroundButton}    BACKGROUND
    ${color}=   Get Elements Background Color    ${backgroundButton}
    should be equal    ${color}    rgba(255, 255, 255, 1)

Title of page button is Projektit and highlighted as chosen tab
    [Tags]    Smoke
     # Arrange
    Start Browser Maximize and Wait Header    ${URL_P}

    #Act & Assert
    ${projectsButton}=    Get WebElement  (//a[starts-with(@class,'PageButtons_page_buttons__button')])[3]
    element should be visible    ${projectsButton}
    element text should be    ${projectsButton}    PROJEKTIT
    ${color}=   Get Elements Background Color    ${projectsButton}
    should be equal    ${color}    rgba(255, 255, 255, 1)

Title changes to Projects and is highlighted as chosen tab
    # Arrange
    Start Browser Maximize and Wait Header    ${URL_P}

    # Act
    Toggle Lang Button to EN

    # Assert
    ${projectsButton}=    Get WebElement  (//a[starts-with(@class,'PageButtons_page_buttons__button')])[3]
    element should be visible    ${projectsButton}
    element text should be    ${projectsButton}    PROJECTS
    ${color}=   Get Elements Background Color    ${projectsButton}
    should be equal    ${color}    rgba(255, 255, 255, 1)