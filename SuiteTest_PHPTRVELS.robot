*** Settings ***

Library  SeleniumLibrary
Library  String

Suite Setup    Open browser    ${homePage}   ${browser}
Suite Teardown    Close browser



*** Variables ***

${browser}   Chrome
${homePage}   https://www.phptravels.net/

${fromDestination_Test_02}   London
${expectedText_Test_02}   BQH to DXB

${email_Test_03}   diego_arteaga@hotmail.es
${password_Test_03}   holahola95
${expectedText_Test_03}   Hi, Diego Arteaga Martinez

${email_Test_04}   non-existing-email@hotmail.es
${password_Test_04}   I'm going to fail anyway
${expectedText_Test_04}   Invalid Email or Password

${expectedText_Test_05}   MI CUENTA

${expectedText_Test_06}   Featured Hotels


*** Test Cases ***

Testing Plan PHPTRAVELS
    Check Home Page
#   Flight serch
#    SuccessfullyLogin
#    Unsuccessfully Login
#    Change Language
#    Check Flights Content
#    Check Boats Content
#    Check Home Templates



*** Keywords ***

#Check that Home Page is the right one
Check Home Page

    Maximize Browser Window

    #Compare title we get with the right one
    title should be  PHPTRAVELS | Travel Technology Partner



#Do a flight search, Open a PDP and check the information that it should contains
Flight serch

    Maximize Browser Window

    #Click Flights button
    Wait Until Element Is Visible   xpath://*[@id="search"]/div/div/div/div/div/nav/ul/li[2]/a
    click element  xpath://*[@id="search"]/div/div/div/div/div/nav/ul/li[2]/a

    #Press Arrow
    Wait Until Element Is Visible   xpath://*[@id="s2id_location_from"]/a/span[2]
    click element  xpath://*[@id="s2id_location_from"]/a/span[2]

    #Input text to look for a flight Input the city
    Wait Until Element Is Visible   xpath://*[@id="select2-drop"]/div/input
    input text  xpath://*[@id="select2-drop"]/div/input   ${fromDestination_Test_02}

    #Chose London(BHQ)
    Wait Until Element Is Visible   xpath://*[@id="select2-drop"]/ul/li[1]/div
    click element  xpath://*[@id="select2-drop"]/ul/li[1]/div

    #Open depart schedule
    Wait Until Element Is Visible   name:departure_date
    click element  name:departure_date

    #Click a day
    Wait Until Element Is Visible   xpath://*[@id="datepickers-container"]/div[9]/div/div/div[2]/div[29]
    click element  xpath://*[@id="datepickers-container"]/div[9]/div/div/div[2]/div[29]

    #1 more adult
    Wait Until Element Is Visible   xpath://*[@id="flights"]/div/div/form/div/div/div[3]/div[3]/div/div/div[1]/div/div[2]/div/span/button[1]
    click element  xpath://*[@id="flights"]/div/div/form/div/div/div[3]/div[3]/div/div/div[1]/div/div[2]/div/span/button[1]

    #1 more child
    Wait Until Element Is Visible   xpath://*[@id="flights"]/div/div/form/div/div/div[3]/div[3]/div/div/div[2]/div/div[2]/div/span/button[1]
    click element  xpath://*[@id="flights"]/div/div/form/div/div/div[3]/div[3]/div/div/div[2]/div/div[2]/div/span/button[1]

    #Click search button
    Wait Until Element Is Visible   xpath://*[@id="flights"]/div/div/form/div/div/div[3]/div[4]/button
    click element  xpath://*[@id="flights"]/div/div/form/div/div/div[3]/div[4]/button

    #Get text about trip information
    Wait Until Element Is Visible   xpath:/html/body/div[2]/div[1]/div[1]/section/div/div[2]/div[2]/div/div/div[1]/h3
    ${foundText}    Get text  xpath:/html/body/div[2]/div[1]/div[1]/section/div/div[2]/div[2]/div/div/div[1]/h3

    #Assert in order to check that the found message is equals than the expect one
    Should Be Equal As Strings    ${foundText}    ${expectedText_Test_02}



#Check that you log in successfully with an existing account
Successfully Login

    Maximize Browser Window

    #Click My Account Button
    Wait Until Element Is Visible   xpath:/html/body/div[2]/header/div[1]/div/div/div[2]/div/ul/li[3]/div/a
    click element  xpath:/html/body/div[2]/header/div[1]/div/div/div[2]/div/ul/li[3]/div/a

    #Click My Login Button
    Wait Until Element Is Visible   xpath:/html/body/div[2]/header/div[1]/div/div/div[2]/div/ul/li[3]/div/div/div/a[1]
    click element  xpath:/html/body/div[2]/header/div[1]/div/div/div[2]/div/ul/li[3]/div/div/div/a[1]

    #Input email
    Wait Until Element Is Visible   name:username
    input text  name:username   ${email_Test_03}

    #Input password
    Wait Until Element Is Visible   name:username
    input text  name:password   ${password_Test_03}

    #Click Login Button
    Wait Until Element Is Visible   xpath://*[@id="loginfrm"]/button
    click element  xpath://*[@id="loginfrm"]/button

    #Get text about profile's name
    Wait Until Element Is Visible   xpath:/html/body/div[2]/div[1]/div[1]/div/div/div[1]/div/div[2]/h3
    ${foundText}    Get text  xpath:/html/body/div[2]/div[1]/div[1]/div/div/div[1]/div/div[2]/h3

    #Assert in order to check that the found message is equals than the expect one
    Should Be Equal As Strings    ${foundText}    ${expectedText_Test_03}



#Check that you log in unsuccessfully with an non-existing account
Unsuccessfully Login

    Maximize Browser Window

    #Click My Account Button
    Wait Until Element Is Visible   xpath:/html/body/div[2]/header/div[1]/div/div/div[2]/div/ul/li[3]/div/a
    click element  xpath:/html/body/div[2]/header/div[1]/div/div/div[2]/div/ul/li[3]/div/a

    #Click My Login Button
    Wait Until Element Is Visible   xpath:/html/body/div[2]/header/div[1]/div/div/div[2]/div/ul/li[3]/div/div/div/a[1]
    click element  xpath:/html/body/div[2]/header/div[1]/div/div/div[2]/div/ul/li[3]/div/div/div/a[1]

    #Input email
    Wait Until Element Is Visible   name:username
    input text  name:username   ${email_Test_04}

    #Input password
    Wait Until Element Is Visible   name:username
    input text  name:password   ${password_Test_04}

    #Click Login Button
    Wait Until Element Is Visible   xpath://*[@id="loginfrm"]/button
    click element  xpath://*[@id="loginfrm"]/button

    #Get text invalid email or password
    Wait Until Element Is Visible   xpath://*[@id="loginfrm"]/div[1]/div
    ${foundText}    Get text  xpath://*[@id="loginfrm"]/div[1]/div

    #Assert in order to check that the found message is equals than the expect one
    Should Be Equal As Strings    ${foundText}    ${expectedText_Test_04}



#Check that the language switch works correctly
Change Language

    Maximize Browser Window

    #Click language button
    Wait Until Element Is Visible   xpath://*[@id="dropdownLangauge"]
    click element  xpath://*[@id="dropdownLangauge"]

    #Click spain button
    Wait Until Element Is Visible   xpath://*[@id="es"]
    click element  xpath://*[@id="es"]

    #Get text  My Account Button in Spanish
    Wait Until Element Is Visible   xpath:/html/body/div[2]/header/div[1]/div/div/div[2]/div/ul/li[3]/div/a
    ${foundText}    Get text  xpath:/html/body/div[2]/header/div[1]/div/div/div[2]/div/ul/li[3]/div/a

    #Assert in order to check that the found message is equals than the expect one
    Should Be Equal As Strings    ${foundText}    ${expectedText_Test_05}



#Check that when you press the flights button you go to the flights page
Check Flights Content

    Maximize Browser Window

    #Click Flights button
    Wait Until Element Is Visible   xpath://*[@id="search"]/div/div/div/div/div/nav/ul/li[2]/a
    click element  xpath://*[@id="search"]/div/div/div/div/div/nav/ul/li[2]/a

    #Assert in order to check that the page contains the radio button
    Page Should Contain Radio Button   flightSearchRadio-2



#Check that when you press the boats button you go to the boats page
Check Boats Content

    Maximize Browser Window

    #Click Boats button
    Wait Until Element Is Visible   xpath://*[@id="search"]/div/div/div/div/div/nav/ul/li[3]/a
    click element  xpath://*[@id="search"]/div/div/div/div/div/nav/ul/li[3]/a

    #Assert in order to check that the page contains the boat type
    Page Should Contain   Boat Type



#Check a template in Home Page (Featured Hotels)
Check Home Templates

    Maximize Browser Window

    #Get text Featured Hotels
    Wait Until Element Is Visible   xpath:/html/body/div[2]/div[1]/div[3]/div[1]/div[1]/h2
    ${foundText}    Get text  xpath:/html/body/div[2]/div[1]/div[3]/div[1]/div[1]/h2

    #Assert in order to check that the found message is equals than the expect one
    Should Be Equal As Strings    ${foundText}    ${expectedText_Test_06}
















