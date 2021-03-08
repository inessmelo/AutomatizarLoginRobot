*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${url}=     http://prova.stefanini-jgr.com.br/teste/qa/

*** Keywords ***
Inicia cenario
    Open Browser        ${url}      chrome

Finaliza cenario
    Capture Page Screenshot
    Close Browser