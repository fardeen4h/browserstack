*** Settings ***
Library  SeleniumLibrary
#Library  Selenium2Library

#Variables  ${EXECDIR}\\Test\\config.py
Test Setup  Setup of test
Test Teardown  Close Browser
*** Variables ***
${URL}  https://flipkart.com
${browser}  chrome
${username}  fardeenkhan4
${key}  bXq6wGsvH9sq9iNFBupY
&{desiredcap}   os=Windows  browser=Chrome
*** Test Cases ***
Flipkart Search Test
    Set Selenium Speed  1s
#    Go To  ${URL}
    Click Element  xpath://button[@class='_2KpZ6l _2doB4z']
    Click element  xpath://input[@name='q']
    Press Keys  xpath://input[@name='q']  Samsung Galaxy S10  RETURN
#    Scroll Element Into View    xpath://section[@class='_2aDURW']//a[.='Mobiles']
#    Click Element  LinkText:Mobiles
    Wait Until Page Contains Element    //a[@title='Mobiles']
    Click element  //a[@title='Mobiles']
    Click Element  xpath://section[5]//div[@class='_24_Dny']
#    Click Element  xpath://input[@type='checkbox']
    Click Element  //div[@class='_24_Dny _3tCU7L']
#    Click Element  xpath://div[@class='_24_Dny _3tCU7L']
    Click Element  xpath://div[.='Price -- High to Low']

    @{nameResults_onPage}  Get WebElements    //div[@class='_4rR01T']
    @{priceResults_onPage}  Get WebElements    //div[@class='_30jeq3 _1_WHN1']
    @{linkResults_onPage}  Get WebElements    //a[@class='_1fQZEK']
    ${numofname}  get element count  //div[@class='_4rR01T']
    ${numofprice}  get element count  //div[@class='_30jeq3 _1_WHN1']
    ${numoflink}  get element count  //a[@class='_1fQZEK']

#    For  ${F}  IN RANGE 1  ${numofname}  ${numofprice}  ${numoflink}
    FOR  ${F}  IN RANGE  1  ${numoflink}+1
        ${name_text}   Get Text    (//div[@class='_4rR01T'])[${F}]
        ${price_text}   Get Text    (//div[@class='_30jeq3 _1_WHN1'])[${F}]
        ${link_text}   Get Text  (//a[@class='_1fQZEK'])[${F}]

#        ${name_text}   Get Text    (@{nameResults_onPage})[${F}]
#        ${price_text}   Get Text    (@{priceResults_onPage})[${F}]
#        ${link_text}   Get Text  (@{linkResults_onPage})[${F}]
        Log To Console  Product name-${name_text} Price of Product-${price_text} LinkText-${link_text}
    END
#    FOR  ${element1}    IN  @{nameResults_onPage}
#          ${name_text}   Get Text    ${element1}
#          FOR  ${element2}    IN  @{priceResults_onPage}
#            ${price_text}   Get Text    ${element2}
#
#            FOR  ${element3}    IN  @{linkResults_onPage}
#                ${link_text}   Get Text  ${element3}
#                Log To Console  Product name-${name_text}
#                Log To Console  Price of product-${price_text}
#                Log To Console  Price of product-${link_text}
#            END
#          END
#    END
#    @{priceResults_onPage}  Get WebElements    //div[@class='_30jeq3 _1_WHN1']
#    FOR  ${element2}    IN  @{priceResults_onPage}
#          ${price_text}   Get Text    ${element2}
#          Log To Console  Price of product-${price_text}
#    END
#        @{linkResults_onPage}  Get WebElements    //a[@class='_1fQZEK']
#        ${numoflink}  get element count  //a[@class='_1fQZEK']
#    FOR  ${element3}    IN  @{linkResults_onPage}
#          ${link_text}   Get Text  ${element3}
#          Log To Console  Price of product-${link_text}
#    END
#    FOR  ${F}  IN RANGE  1  ${numoflink}
#        ${link_text}  Get Text  (//a[@class='_1fQZEK'])[${F}]
#    END
*** Keywords ***
Setup of test
#    Open Browser    ${URL}  chrome  remote_url=http://fardeenkhan4:bXq6wGsvH9sq9iNFBupY@hub-cloud.browserstack.com/wd/hub
    Open Browser    ${URL}  chrome
    Maximize Browser Window