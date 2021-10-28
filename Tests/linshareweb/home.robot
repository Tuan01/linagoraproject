*** Settings ***
Library     SeleniumLibrary
Resource    ../../Resources/common.robot
Resource    ../../Resources/linshare/homepage.robot
Resource    ../../Resources/linshare/loginpage.robot
Resource    ../../Resources/linshare/common_linshare.robot
Resource    ../../Resources/linshare/myspace.robot
Resource    ../../Resources/linshare/sharespace.robot

Test Setup   Start Web Test
Test Teardown   End Web Test

*** Variables ***

*** Test Cases ***
TC_01_Click On Host Your File Button
    Open Linshare 
    Select Host Your File
    Verify The MySpace Is Displayed 

TC_02_Click On Upload To A Group Button
    Open Linshare
    Select To A Group
    Verify The ShareSpace Is Displayed

# TC_03_Click On Upload Request Button

# TC_04_Set My Space As Default Home Page

# TC_05_Set Shared Space As Default Home Page

# TC_06_Set Upload Request As Default Home Page
    