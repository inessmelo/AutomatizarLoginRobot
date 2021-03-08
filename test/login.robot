*** Settings ***
Resource            base.robot

Test Setup          Inicia cenario
Test Teardown       Finaliza cenario


*** Test Cases ***
Validar campos obrigatório
    [Tags]              campo_obrig
    Click Element       id:register

    ${nome_erro}=       Get WebElement         xpath:.//*[@id='name']/../p
    Should Contain      ${nome_erro.text}      O campo Nome é obrigatório.

    ${email_erro}=       Get WebElement         xpath:.//*[@id='email']/../p
    Should Contain      ${email_erro.text}      O campo E-mail é obrigatório.
    
    ${senha_erro}=       Get WebElement         xpath:.//*[@id='password']/../p
    Should Contain      ${senha_erro.text}      O campo Senha é obrigatório.
    

Validar campo nome
    [Tags]              campo_nome
    Input text          id:name         Joao
    Input text          id:email        joao@teste.com
    Input text          id:password     12345678
    Click Element       id:register

    ${nome_erro}=       Get webElement          xpath://*[@id='name']/../p
    Should Contain      ${nome_erro.text}       Por favor, insira um nome completo.


Validar campo email
    [Tags]              campo_email
    Input text          id:name         Joao Carlos
    Input text          id:email        joaoteste.com
    Input text          id:password     12345678
    Click Element       id:register

    ${email_erro}=       Get webElement          xpath://*[@id='email']/../p
    Should Contain      ${email_erro.text}       Por favor, insira um e-mail válido.


Validar campo senha
    [Tags]              campo_senha
    Input text          id:name         Joao Carlos
    Input text          id:email        joao@teste.com
    Input text          id:password     123456
    Click Element       id:register

    ${senha_erro}=      Get webElement           xpath://*[@id='password']/../p
    Should Contain      ${senha_erro.text}       A senha deve conter ao menos 8 caracteres.


Login com sucesso
    [Tags]              login
    Input text          id:name         Joao Carlos
    Input text          id:email        joao@teste.com
    Input text          id:password     12345678
    Click Element       id:register

    #validando o cadastro efetuado
    ${cadastrado}=      Get WebElement          css:h2[class='table-title']
    Should Contain      ${cadastrado.text}      Usuários cadastrados

    #validando cadastro do usuário     
    ${usu}=             Get WebElement          xpath:.//td[contains(., 'joao@teste.com')]
    Log                 ${usu.text}
    Should Contain      ${usu.text}             joao@teste.com


Excluindo usuario
    [Tags]              excluir
    #usuario n1
    Input text          id:name         Joao Carlos
    Input text          id:email        joao@teste.com
    Input text          id:password     12345678

    Click Element       id:register

    #usuario n2
    Input text          id:name         Maria Clara
    Input text          id:email        maria@teste.com
    Input text          id:password     123123123

    Click Element       id:register

    #validando o cadastro efetuado
    ${cadastrado}=      Get webElement          css:h2[class='table-title']
    Should Contain      ${cadastrado.text}      Usuários cadastrados

    #validando cadastro do usuário Joao
    ${usuario1}=        Get webElement          xpath:.//td[contains(., 'joao@teste.com')]
    Should Contain      ${usuario1.text}        joao@teste.com

    #validando cadastro do usuário Maria
    ${usuario2}=        Get webElement          xpath:.//td[contains(., 'maria@teste.com')]
    Should Contain      ${usuario2.text}        maria@teste.com

    #excluindo usuario Joao
    Click Element       id:removeUser1