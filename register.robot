*** Settings ***
Library     Selenium2Library
Library     OperatingSystem

*** Keywords ***
Set Environment Variable    webdriver.gecko.driver  geckodriver.exe

*** Variables ***
# Browser Selection
${Browser}      Firefox

# Testing URL
${SiteUrl}      https://twitter.com/signup

# Registration Fields
${FullName}     Test Robot
${Email}        donny.jtk07@gmail.com
${Password}     qwerty111!!

# Time Delay
${Delay}        5s

*** Keywords ***
Open Page
    Open Browser    ${SiteUrl}      ${Browser}
    Maximize Browser Window
Fill Registration Form
    Input Text      id=full-name    ${FullName}
    Input Text      id=email        ${Email}
    Input Text      id=password     ${Password}
Submit Form
    Sleep   ${Delay}
    Click Element   xpath=//input[@id='submit_button']
    [Teardown]  Close Browser

*** Test Cases ***
Twitter Registration Flow
    Open Page
    Fill Registration Form
    Submit Form
