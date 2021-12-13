*** Settings ***
Documentation               Login Tests
Library                     Selenium2Library

*** Variables ***

*** Test Cases ***
Successful Login
    [Documentation]               Successful Login

    Open Browser                  https://www.saucedemo.com                     chrome
    Set Browser Implicit Wait     5
    Input Text                    name:user-name                                standard_user
    Input Password                name:password                                 secret_sauce
    Click Button                  name:login-button
    Log                           Credentials Entered

    Page Should Contain           Sauce Labs Backpack                           INFO
    Page Should Contain           $29.99                                        INFO
    Page Should Contain           carry.allTheThings() with the sleek, str      INFO

    Page Should Contain           Sauce Labs Bike Light                         INFO
    Page Should Contain           $9.99                                         INFO
    Page Should Contain           A red light isn't the desired state in t      INFO

    Close Browser

Unsucessful Login by Locked Out User
    [Documentation]               Unsucessful Login by a Locked Out User

    Open Browser                  https://www.saucedemo.com                     chrome
    Set Browser Implicit Wait     5
    Input Text                    name:user-name                                locked_out_user
    Input Password                name:password                                 secret_sauce
    Click Button                  name:login-button
    Log                           Credentials Entered

    Page Should Contain           Epic sadface: Sorry, this user has been       INFO
    Page Should Contain           Accepted usernames are:                       INFO
    Page Should Contain           Password for all users:                       INFO

    Close Browser

Wrong Password
    [Documentation]               Unsucessful Login due to wrong password

    Open Browser                  https://www.saucedemo.com                     chrome
    Set Browser Implicit Wait     5
    Input Text                    name:user-name                                standard_user
    Input Password                name:password                                 wrong_password
    Click Button                  name:login-button
    Log                           Credentials Entered

    Page Should Contain           Epic sadface: Username and password do n      INFO
    Page Should Contain           Accepted usernames are:                       INFO
    Page Should Contain           Password for all users:                       INFO

    Close Browser

Loggin as a Problem User
    [Documentation]               Sucessful Login by Problem user

    Open Browser                  https://www.saucedemo.com                     chrome
    Set Browser Implicit Wait     5
    Input Text                    name:user-name                                problem_user
    Input Password                name:password                                 secret_sauce
    Click Button                  name:login-button
    Log                           Credentials Entered

    Page Should Contain           Sauce Labs Backpack                           INFO
    Page Should Contain           $29.99                                        INFO
    Page Should Contain           carry.allTheThings() with the sleek, str      INFO

    Page Should Contain           Sauce Labs Bike Light                         INFO
    Page Should Contain           $9.99                                         INFO
    Page Should Contain           A red light isn't the desired state in t      INFO

    Page Should Contain Image     https://www.saucedemo.com/inventory.html#     INFO

    Close Browser

*** Keywords ***

