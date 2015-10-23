<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="br.ages.crud.model.Usuario"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

	
<script type="text/javascript">

	function cadastrar() {
		var formCadastro =document.forms[0]; 
		formCadastro.action ="main?acao=addUser";
		formCadastro.submit();
	}

</script>

<jsp:include page="../template/head.jsp"></jsp:include>
	
	<div class="panel panel-primary">
    		
		<div class="panel-heading text-center">
			Cadastro de Usu�rio
		</div>
		
		
		<div class="panel-body">
		
        	<jsp:include page="/template/msg.jsp"></jsp:include>
        	
        	<div class="table-responsive">
                
                <form method="post" action="#">
                
               		<div class="form-group">
			           	<label class="form-label ages">Matr�cula:</label>
			           	<input class="form-control" id="matricula" name="matricula" value="${param.matricula}" type="text" maxlength="9" required>
		            </div>
		            
		            <div class="form-group">
			           	<label class="form-label ages">Nome:</label>
			           	<input class="form-control" id="nome" name="nome" value="${param.nome}" type="text" maxlength="120" required>
		            </div>

					<div class="form-group">
			           	<label class="form-label ages">Usu�rio:</label>
			           	<input class="form-control" id="usuario" name="usuario" value="${param.usuario}" type="text" maxlength="120" required>
		            </div>
                    
					<div class="form-group">
			           	<label class="form-label ages">Senha:</label>
			           	<input class="form-control" id="senha" name="senha" value="${param.senha}" type="password" maxlength="120" required>
		            </div>
				
					<div class="form-group">
			           	<label class="form-label ages">E-Mail:</label>
			           	<input class="form-control" id="email" name="email" value="${param.email}" type="text" maxlength="120" required>
		            </div>
                    
                    <div class="form-group">
			           	<label class="form-label ages">Perfil de Acesso:</label>
			           	<select id="perfilacesso" name="perfilacesso" required>
			           		<option>1</option>
			           		<option>2</option>
		            </div>
                    
                    <div class="selects">
                        <label for="status">
                            <span class="obg">*</span>Administrador:<!-- O <span> foi utilizado apenas para estilar o "*" -->
                        </label>
                        
                        <select id="adm" name="adm" required>
                            <option value="N" <%= "N".equals(request.getParameter("adm")) ? "selected" : "" %> required>N�o</option>
                            <option value="S" <%= "S".equals(request.getParameter("adm")) ? "selected" : "" %> required>Sim</option>
                        </select>
                    </div>
                    
                    
                    
                    <hr>
                    
                    <p>Campos que cont�m <span>*</span> s�o obrigat�rios</p>
                    
                    
                    
                    
                   
                    <input class="reset" type="reset" value="Limpar">
                     <input class="submit" type="submit" value="Cadastrar" onclick="cadastrar()">
                </form>
                </div>

        

        
        
        
<jsp:include page="/template/foot.jsp"></jsp:include>