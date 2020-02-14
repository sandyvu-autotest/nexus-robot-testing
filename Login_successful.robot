*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${email_TextField}    id=EMAIL_INPUT
${pass_TextField}    id=PASSWORD_INPUT
${submit_Button}    id=SUBMIT_BUTTON
${forgotpass_HyperLink}    id=FORGOT_PASSWORD_LINK

*** Test Cases ***
Login to Nexus Insight successful
    Open Browser    http://inno-insight-server-dev-1.ap-southeast-1.elasticbeanstalk.com/#/login    chrome
    Maximize Browser Window
    Wait Until Page Contains    Login
    Input Text    ${email_TextField}     sandy.vu+102@nexusfrontier.tech
    Input Text    ${pass_TextField}    12345678
    Click Button    ${submit_Button}    
    Wait Until Page Contains    Daily Report  
    