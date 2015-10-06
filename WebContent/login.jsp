<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html><!-- Informa ao browser a vers�o do HTML. Nesse caso HTML5. -->
<html lang="pt-br"><!-- lang="pt-br" informa que a p�gina est� na linguagem portugu�s(Brasil) -->
    <head>
        <meta charset="utf-8"><!-- Codifica��o de caracteres. A UTF-8 permite utilizar caaracteres especiais e acentos -->
        
        <title>AGES - Ag�ncia Experimental de Engenharia de Software</title><!-- T�tulo da p�gina -->
        
        <link rel="icon" href="img/favicon.ico"><!-- Favicon � aquela imagem que vai na aba do navegador -->
        <link rel="stylesheet" href="css/reset.css"><!-- Esse arquivo css reseta todos os padr�es de todas as tags -->
        <link rel="stylesheet" href="css/style.css"><!-- Estilo geral de todas as p�ginas -->
        <link rel="stylesheet" href="css/index.css"><!-- Estilo dessa p�gina -->
        
        <script src="js/index.js"></script>
    </head>
    <body>
        <!-- Conte�do principal -->
        <main>
            <img href="index.jsp" class="logo" src="img/logo-ages.png" alt="AGES">
           
            <section class="login">
                <h1>Bem <span>v</span>indo!</h1><!-- T�tulo principal -->
                
                <label id="msg" name="msg"><jsp:include page="/template/msg.jsp"></jsp:include></label>
                
                <form method="post" action="main?acao=login">
                    <label for="login">Usu�rio:</label>
                    <input id="login" name="login" value="${param.login}" type="text" maxlength="120" required>
                    
                    <label for="senha">Senha:</label>
                    <input id="senha" name="senha" value="${param.senha}" type="password" maxlength="15" required>
                    <a class="forgot-password" href="#">Esqueci minha senha</a>
                    
                    <hr>
                    
                    <input class="submit" type="submit" value="Entrar">
                </form>
            </section>
        </main>
        
        <!-- Rodap� -->
        <footer>
            <!-- Pseudo rodap� -->
        </footer>
    </body>
</html>