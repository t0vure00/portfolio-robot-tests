*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resources/Common.robot
Test Teardown    close browser
# Arrange
Test Setup    Start Browser Maximize and Wait Header    https://t0vure00.github.io/portfolio-app/#/background
Force Tags    Regression

*** Variables ***

*** Test Cases ***
Title of info block is koulutus and tyokokemus
    [Tags]    Smoke
    # Act & Assert
    element text should be    (//span[starts-with(@class,'Background_title')])[1]    Koulutus
    element text should be    (//span[starts-with(@class,'Background_title')])[2]    Työkokemus

Three blocks are shown per info block
    [Tags]    Smoke
    # Act
    ${count1}=    get element count    (//div[starts-with(@class,'Background_background__scroll')])[1]/div[starts-with(@class,'InfoBlock_info_block__')]
    ${count2}=    get element count    (//div[starts-with(@class,'Background_background__scroll')])[2]/div[starts-with(@class,'InfoBlock_info_block__')]

    # Assert
    ${correctValue}=    convert to integer    3
    should be equal    ${correctValue}    ${count1}
    should be equal    ${correctValue}    ${count2}

Education places has correct information
    [Tags]    Smoke
    # Act & Assert
    ${infoBlocks}=    Get WebElements    //div[starts-with(@class,'InfoBlock_info_block__place')]
    element should be visible    ${infoBlocks}[0]
    element text should be    ${infoBlocks}[0]    Oulun ammattikorkeakoulu

    element should be visible    ${infoBlocks}[1]
    element text should be    ${infoBlocks}[1]    Ammattikoulu Lappia

    element should be visible    ${infoBlocks}[2]
    element text should be    ${infoBlocks}[2]    ${EMPTY}

Education title has correct information
    [Tags]    Smoke
    # Act & Assert
    ${infoBlocks}=    Get WebElements    //div[starts-with(@class,'InfoBlock_info_block__title')]
    element should be visible    ${infoBlocks}[0]
    element text should be    ${infoBlocks}[0]    Tieto- ja viestintätekniikan insinööri

    element should be visible    ${infoBlocks}[1]
    element text should be    ${infoBlocks}[1]    Lähihoitaja

    element should be visible    ${infoBlocks}[2]
    element text should be    ${infoBlocks}[2]    ${EMPTY}

Education interval has correct
    [Tags]    Smoke
    # Act & Assert
    ${infoBlocks}=    Get WebElements    //div[starts-with(@class,'InfoBlock_info_block__interval')]
    element should be visible    ${infoBlocks}[0]
    element text should be    ${infoBlocks}[0]    2020-2024

    element should be visible    ${infoBlocks}[1]
    element text should be    ${infoBlocks}[1]    2015-2018

    element should be visible    ${infoBlocks}[2]
    element text should be    ${infoBlocks}[2]    ${EMPTY}

Education description has correct
    [Tags]    Smoke
    # Act & Assert
    ${infoBlocks}=    Get WebElements    //div[starts-with(@class,'InfoBlock_info_block__description')]
    element should be visible    ${infoBlocks}[0]
    element text should not be    ${infoBlocks}[0]    ${EMPTY}

    element should be visible    ${infoBlocks}[1]
    element text should not be    ${infoBlocks}[1]    ${EMPTY}

    element should not be visible    ${infoBlocks}[2]

Experience place has correct information
    # Act & Assert
    ${infoBlocks}=    Get WebElements    //div[starts-with(@class,'InfoBlock_info_block__place')]
    element should be visible    ${infoBlocks}[3]
    element text should be    ${infoBlocks}[3]    Jutel Oy

    element should be visible    ${infoBlocks}[4]
    element text should be    ${infoBlocks}[4]    Polar Electro Oy

    element should be visible    ${infoBlocks}[5]
    element text should be    ${infoBlocks}[5]    Oulun ammattikorkeakoulu

Experience title has correct information
    # Act & Assert
    ${infoBlocks}=    Get WebElements    //div[starts-with(@class,'InfoBlock_info_block__title')]
    element should be visible    ${infoBlocks}[3]
    element text should be    ${infoBlocks}[3]    Testaaja

    element should be visible    ${infoBlocks}[4]
    element text should be    ${infoBlocks}[4]    Harjoittelija, Sulatettu ohjelmisto

    element should be visible    ${infoBlocks}[5]
    element text should be    ${infoBlocks}[5]    Kesäharjoittelija


Experience interval has correct information
    # Act & Assert
    ${infoBlocks}=    Get WebElements    //div[starts-with(@class,'InfoBlock_info_block__interval')]
    element should be visible    ${infoBlocks}[3]
    element text should be    ${infoBlocks}[3]    08/2025-11/2025

    element should be visible    ${infoBlocks}[4]
    element text should be    ${infoBlocks}[4]    03/2023-08/2023

    element should be visible    ${infoBlocks}[5]
    element text should be    ${infoBlocks}[5]    05/2022-06/2022

Experience description has correct information
    # Act & Assert
    ${infoBlocks}=    Get WebElements    //div[starts-with(@class,'InfoBlock_info_block__description')]
    element should be visible    ${infoBlocks}[3]
    element text should not be    ${infoBlocks}[3]    ${EMPTY}

    element should be visible    ${infoBlocks}[4]
    element text should not be    ${infoBlocks}[4]    ${EMPTY}

    element should be visible    ${infoBlocks}[5]
    element text should not be    ${infoBlocks}[5]    ${EMPTY}