*** Settings ***
Library    SeleniumLibrary
Resource    ../Objects/Objects_Login.robot
Resource    Common.robot
Suite Setup    Go To Login Page    ${URL_LOGIN}    
Suite Teardown    Close Browser

*** Variables ***
# data for Login page
${placeholder_email}     johndoe@nexusfrontier.tech
${placeholder_pass}    Password
*** Test Cases ***
Check place holder of textbox
   # Go To Login Page    ${URL_LOGIN} 
      ${pl_email}     Get Element Attribute    ${email_TextField}   placeholder  
      Should Be True    "${pl_email}" == "${placeholder_email}"   
      ${pl_pass}     Get Element Attribute    ${pass_TextField}   placeholder  
      Should Be True   "${pl_pass}" == "${placeholder_pass}"
Check click on Forgot password link
    # Go To Login Page    ${URL_LOGIN}
    Click Link    FORGOT_PASSWORD_LINK 
    Wait Until Element Is Visible    EMAIL_INPUT
    Page Should Contain    Forgot Password  
    Click Element    ${back_to_login_Button}    
              
Check click on Login button when enter invalid email/ password
    Input Text    ${email_TextField}     sandy.vu+100@nexusfrontier.tech
    Input Text    ${pass_TextField}    12345678
    Click Button    ${submit_Button}  
    
Check enter wrong fomat email  
     Input Text    ${email_TextField}     sandy.vu+100@nexusfrontier
    Input Text    ${pass_TextField}    12345678
    Click Button    ${submit_Button}  
    Element Should Contain    css:div.errors-message    Incorrect email address or password.   
     
Login to Nexus Insight successful
  #  Go To Login Page    ${URL_LOGIN}
    Input Text    ${email_TextField}     ${email}
    Input Text    ${pass_TextField}    ${password}
    Click Button    ${submit_Button}    
    Wait Until Page Contains    Daily Report  
