*** Settings ***
Library    SeleniumLibrary  
Resource    ../Objects/Objects_Login.robot
*** Variables ***
${email}    sandy.vu+102@nexusfrontier.tech
${password}    12345678
*** Keywords ***
Go To Login Page    
    [Arguments]    ${url}
    Open Browser    ${url}    ff
    Set Selenium Speed    0.1
    Maximize Browser Window
    Wait Until Page Contains    Login
    
Go To Home Page
     [Arguments]    ${url}    ${email}     ${pass}
    Go To Login Page    ${url}
    Input Text    ${email_TextField}    ${email}
    Input Text    ${pass_TextField}    ${pass}
    Click Button    ${submit_Button}  
    
Get Placeholder text
    [Arguments]    ${locator}
    Get Text    locator