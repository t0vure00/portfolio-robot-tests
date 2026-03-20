*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resources/Common.robot
Test Teardown    close browser
Force Tags    Regression

*** Variables ***
${URL}  https://t0vure00.github.io/portfolio-app/#/background

*** Test Cases ***
Title of info block is koulutus and tyokokemus
    [Tags]    Smoke
     # Arrange
    Start Browser and Maximize    ${URL}
    sleep    4s

    # Act & Assert
    element text should be    (//span[starts-with(@class,"Background_title")])[1]    Koulutus
    element text should be    (//span[starts-with(@class,"Background_title")])[2]    Työkokemus

Three blocks are shown per info block
    [Tags]    Smoke
    # Arrange
    Start Browser and Maximize    ${URL}
    sleep    4s

    # Act
    ${count1}=    get element count    (//div[starts-with(@class,"Background_background__scroll")])[1]/div[starts-with(@class,"InfoBlock_info_block__")]
    ${count2}=    get element count    (//div[starts-with(@class,"Background_background__scroll")])[2]/div[starts-with(@class,"InfoBlock_info_block__")]

    # Assert
    ${correctValue}=    convert to integer    3
    should be equal    ${correctValue}    ${count1}
    should be equal    ${correctValue}    ${count2}

Education places has correct information
    [Tags]    Smoke
    # Arrange
    Start Browser and Maximize    ${URL}
    sleep    4s

    # Act & Assert
    element should be visible    //div[starts-with(@class,"InfoBlock_info_block__place")]
    element text should be    //div[starts-with(@class,"InfoBlock_info_block__place")]    Oulun ammattikorkeakoulu

    element should be visible    (//div[starts-with(@class,"InfoBlock_info_block__place")])[2]
    element text should be    (//div[starts-with(@class,"InfoBlock_info_block__place")])[2]    Ammattikoulu Lappia

    element should be visible    (//div[starts-with(@class,"InfoBlock_info_block__place")])[3]
    element text should be    (//div[starts-with(@class,"InfoBlock_info_block__place")])[3]    ${EMPTY}

Education title has correct information
    [Tags]    Smoke
    # Arrange
    Start Browser and Maximize    ${URL}
    sleep    4s

    # Act & Assert
    element should be visible    //div[starts-with(@class,"InfoBlock_info_block__title")]
    element text should be    //div[starts-with(@class,"InfoBlock_info_block__title")]    Tieto- ja viestintätekniikan insinööri

    element should be visible    (//div[starts-with(@class,"InfoBlock_info_block__title")])[2]
    element text should be    (//div[starts-with(@class,"InfoBlock_info_block__title")])[2]    Lähihoitaja

    element should be visible    (//div[starts-with(@class,"InfoBlock_info_block__title")])[3]
    element text should be    (//div[starts-with(@class,"InfoBlock_info_block__title")])[3]    ${EMPTY}


Education interval has correct
    [Tags]    Smoke
    # Arrange
    Start Browser and Maximize    ${URL}
    sleep    4s

    # Act & Assert
    element should be visible    //div[starts-with(@class,"InfoBlock_info_block__interval")]
    element text should be    //div[starts-with(@class,"InfoBlock_info_block__interval")]    2020-2024

    element should be visible    (//div[starts-with(@class,"InfoBlock_info_block__interval")])[2]
    element text should be    (//div[starts-with(@class,"InfoBlock_info_block__interval")])[2]    2015-2018

    element should be visible    (//div[starts-with(@class,"InfoBlock_info_block__interval")])[3]
    element text should be    (//div[starts-with(@class,"InfoBlock_info_block__interval")])[3]    ${EMPTY}

Education description has correct
    [Tags]    Smoke
    # Arrange
    Start Browser and Maximize    ${URL}
    sleep    4s

    # Act & Assert
    element should be visible    //div[starts-with(@class,"InfoBlock_info_block__description")]
    element text should not be    //div[starts-with(@class,"InfoBlock_info_block__description")]    ${EMPTY}

    element should be visible    (//div[starts-with(@class,"InfoBlock_info_block__description")])[2]
    element text should not be    (//div[starts-with(@class,"InfoBlock_info_block__description")])[2]    ${EMPTY}

    element should not be visible    (//div[starts-with(@class,"InfoBlock_info_block__description")])[3]

Experience place has correct information
    # Arrange
    Start Browser and Maximize    ${URL}
    sleep    4s

    # Act & Assert
    element should be visible    (//div[starts-with(@class,"InfoBlock_info_block__place")])[4]
    element text should be    (//div[starts-with(@class,"InfoBlock_info_block__place")])[4]    Jutel Oy

    element should be visible    (//div[starts-with(@class,"InfoBlock_info_block__place")])[5]
    element text should be    (//div[starts-with(@class,"InfoBlock_info_block__place")])[5]    Polar Electro Oy

    element should be visible    (//div[starts-with(@class,"InfoBlock_info_block__place")])[6]
    element text should be    (//div[starts-with(@class,"InfoBlock_info_block__place")])[6]    Oulun ammattikorkeakoulu

Experience title has correct information
    # Arrange
    Start Browser and Maximize    ${URL}
    sleep    4s

    # Act & Assert
    element should be visible    (//div[starts-with(@class,"InfoBlock_info_block__title")])[4]
    element text should be    (//div[starts-with(@class,"InfoBlock_info_block__title")])[4]    Testaaja

    element should be visible    (//div[starts-with(@class,"InfoBlock_info_block__title")])[5]
    element text should be    (//div[starts-with(@class,"InfoBlock_info_block__title")])[5]    Harjoittelija, Sulatettu ohjelmisto

    element should be visible    (//div[starts-with(@class,"InfoBlock_info_block__title")])[6]
    element text should be    (//div[starts-with(@class,"InfoBlock_info_block__title")])[6]    Kesäharjoittelija


Experience interval has correct information
    # Arrange
    Start Browser and Maximize    ${URL}
    sleep    4s

    # Act & Assert
    element should be visible    (//div[starts-with(@class,"InfoBlock_info_block__interval")])[4]
    element text should be    (//div[starts-with(@class,"InfoBlock_info_block__interval")])[4]    08/2025-11/2025

    element should be visible    (//div[starts-with(@class,"InfoBlock_info_block__interval")])[5]
    element text should be    (//div[starts-with(@class,"InfoBlock_info_block__interval")])[5]    03/2023-08/2023

    element should be visible    (//div[starts-with(@class,"InfoBlock_info_block__interval")])[6]
    element text should be    (//div[starts-with(@class,"InfoBlock_info_block__interval")])[6]    05/2022-06/2022

Experience description has correct information
    # Arrange
    Start Browser and Maximize    ${URL}
    sleep    4s

    # Act & Assert
    element should be visible    (//div[starts-with(@class,"InfoBlock_info_block__description")])[4]
    element text should not be    (//div[starts-with(@class,"InfoBlock_info_block__description")])[4]    ${EMPTY}

    element should be visible    (//div[starts-with(@class,"InfoBlock_info_block__description")])[5]
    element text should not be    (//div[starts-with(@class,"InfoBlock_info_block__description")])[5]    ${EMPTY}

    element should be visible    (//div[starts-with(@class,"InfoBlock_info_block__interval")])[6]
    element text should not be    (//div[starts-with(@class,"InfoBlock_info_block__interval")])[6]    ${EMPTY}