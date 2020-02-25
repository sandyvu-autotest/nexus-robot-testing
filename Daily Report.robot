*** Settings ***
Library    SeleniumLibrary  
Library    DateTime    
Library    String  
Library    Collections      
Resource    ../Objects/Objects_Login.robot 
Resource    ../Objects/Objects_DailyReport.robot
Resource    Common.robot
 
Suite Setup    Go To Home Page    ${URL_LOGIN}    ${email}    ${password}
# Test Teardown    Reload Page
Suite Teardown    Close Browser
*** Variables ***

*** Test Cases ***
Check display dedfault value on date picker
    # Go To Home Page    ${URL_LOGIN}    ${email}    ${password}
    Wait Until Element Is Visible    SAVE_BUTTON    
    ${default_date}     Get Element Attribute    ${Date_picker}    value
    ${default_date_1}    Replace String    ${default_date}    /    -       
    ${current_date}     Get Current Date    result_format=%Y-%m-%d 
    Should Be True    ${default_date_1}==${current_date}  
        
Check display when unticked 1 checkbox
    Wait Until Element Is Visible    SAVE_BUTTON   
    Mouse Over    ${project_Dropdown}  
    Wait Until Element Is Visible    //div[text()="@PRJ005 - Projectplus"]    
    Click Element    (//div[text()="@PRJ005 - Projectplus"])[2]   
    Page Should Contain    Are you sure you want to delete this project's report?   
    Click Element    //button[text()="No"]     
# Check display list assigned project
Check display placeholder on textbox
    Wait Until Element Is Visible    SAVE_BUTTON
    ${place_text}    Get Element Attribute    ${project_Dropdown}    placeholder
    Should Be True    "${place_text}"=="Add Project"    
    
Check display of "Progress Logged" when input Progress_Time
    Wait Until Element Is Visible    SAVE_BUTTON   
    Select Text From Dropdown    ${progressTime_Dropdown}     1
    Capture Page Screenshot    
    ${progressTime_input}=    Set Variable    Progress Logged: 1 hrs
    Sleep    2    
    ${progressTime_show}=     Get Text    //table[@class="table table-striped table-bordered"]//th[1]
    Should Be Equal    ${progressTime_input}    ${progressTime_show}    
    
Check display of "Plan Logged" when input Plan_Time
    Wait Until Element Is Visible    SAVE_BUTTON   
    Select Text From Dropdown    ${planTime_Dropdown}     1    
    Capture Page Screenshot    
    ${planTime_input}=    Set Variable    Plan Logged: 1 hrs
    Sleep    2    
    ${planTime_show}=     Get Text    //table[@class="table table-striped table-bordered"]//th[2]
    Should Be Equal    ${planTime_input}    ${planTime_show}
    
Check display of button when click button Delete
    Reload Page
    Wait Until Element Is Visible    SAVE_BUTTON
    Click Button        ${removePrj_Button}
    Page Should Contain    Are you sure you want to delete this project's report?
    # Click Element         ${noRemove_Button} 
Check display of screen when click No on Popup
    Reload Page
    Wait Until Element Is Visible    SAVE_BUTTON
    Click Button        ${removePrj_Button}
    Page Should Contain    Are you sure you want to delete this project's report?
    Click Element         ${noRemove_Button} 
Check display of screen when click Yes on Popup
    Reload Page
    Wait Until Element Is Visible    SAVE_BUTTON
    Click Button        ${removePrj_Button}
    Page Should Contain    Are you sure you want to delete this project's report?
    Click Element         ${yesRemove_Button} 
    # Click Element    ${project_Dropdown}    
    Page Should Not Contain Element    //p[text()="@PRJ005 - Projectplus"]  
# Case Re-Setup data
      
# Check enter Task ID more than 255 characters
# Check enter Task ID from 1 to 255 characters
# Check enter Task Name is blank
# Check enter Task Name more than 255 characters
# Check enter Task Name from 1 to 255 characters
# Check display of drop down list when choose 1 option in list time
# Check display of drop down list when click 
*** Keywords ***
Locator by Project Name
    [Arguments]    ${project_name}
    [Return]      //div[text()="${project_name}"]
Create data list
    ${list_ProgressTime}=     Create List    
    :FOR    ${i}    IN RANGE    48
    \    ${j}=  Evaluate    "%.2f"     ${i}/2
    \    ${list_ProgressTime}    Append To List    ${i}/2 
#Print list on console
     :FOR    ${item}    IN      ${list_ProgressTime}
    \   Log     ${list_ProgressTime}
Select Text From Dropdown
    [Arguments]    ${locator}    ${value}
    Click Element   ${locator}   
    Wait Until Element Is Visible    ${locator}/div[2]    
    Click Element    ${locator}/div[2]/div/div[text()="${value}"]
    
   
   