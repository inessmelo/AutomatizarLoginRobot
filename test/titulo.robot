*** Settings ***
Resource            base.robot
Test Setup          Inicia cenario
Test Teardown       Finaliza cenario

*** Test Cases ***
Validação do titulo da página
    Title Should Be     Cadastro de usuários