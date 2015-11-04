<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="br.ages.crud.model.Usuario"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%Usuario usuario = (Usuario) request.getAttribute("usuario"); %>

<jsp:include page="../template/head.jsp"></jsp:include>
	
	<div class="panel panel-primary panel-addUser">
    		
		<div class="panel-heading text-center">
			Cadastro de Usu�rio
		</div>
		
		
		<div class="panel-body">
		
        	<jsp:include page="/template/msg.jsp"></jsp:include>
        	
        	<div class="table-responsive">
                
                <form method="post" action="main?acao=editUser">
                	<input class="form-control" type="hidden" id="idUsuario" name="idUsuario" value="<%=usuario.getIdUsuario()%>">
               		<div class="form-group">
			           	<label class="form-label ages">Matr�cula:
			           	<input class="form-control" id="matricula" name="matricula" value="<%=usuario.getMatricula() %>" type="text" maxlength="9" disabled="disabled">
		            </div>
		            
		            <div class="form-group">
			           	<label class="form-label ages">Nome: <span class="red">*</span></label>
			           	<input class="form-control" id="nome" name="nome" value="<%=usuario.getNome() %>" type="text" maxlength="120" required>
		            </div>

					<div class="form-group">
			           	<label class="form-label ages">Usu�rio:
			           	<input class="form-control" id="usuario" name="usuario" value="<%=usuario.getUsuario() %>" type="text" maxlength="120" disabled>
		            </div>
                    
					<div class="form-group">
			           	<label class="form-label ages">Senha: <span class="red">*</span></label>
			           	<input class="form-control" id="senha" name="senha" value="<%=usuario.getSenha() %>" type="text" maxlength="120" required>
		            </div>
				
					<div class="form-group">
			           	<label class="form-label ages">E-Mail: <span class="red">*</span></label>
			           	<input class="form-control" id="email" name="email" value="<%=usuario.getEmail() %>" type="text" maxlength="120" required>
		            </div>
                    
                    <div class="form-group">
			           	<label class="form-label ages">Perfil de Acesso: <span class="red">*</span></label>
			           	<select class="form-control" id="perfilAcesso" name="perfilAcesso" required>
			           		<option value="ADMINISTRADOR" <%= "ADMINISTRADOR".equals(usuario.getPerfilAcesso()) ? "selected" : "" %>>Administrador</option>
                            <option value="NAVEGADOR" <%= "NAVEGADOR".equals(usuario.getPerfilAcesso()) ? "selected" : "" %>>Navegador</option>
		           		</select>
		            </div>
		            
		            <div class="form-group">
			           	<label class="form-label ages">Status: <span class="red">*</span></label>
			           	<select class="form-control" id="statusUsuario" name="statusUsuario" required>
			           		<option value="ATIVO" <%= "ATIVO".equals(usuario.getStatusUsuario()) ? "selected" : "" %>>Ativo</option>
                            <option value="INATIVO" <%= "INATIVO".equals(usuario.getStatusUsuario()) ? "selected" : "" %>>Inativo</option>
		           		</select>
		            </div>
		            
		            <div class="form-group">
			           	<label class="form-label ages">Tipo de Usu�rio: <span class="red">*</span></label>
			           	<select class="form-control" id="tipoUsuario" name="tipoUsuario" required>
                            <option value="2" <%= "ALUNO".equals(usuario.getTipoUsuario()) ? "selected" : "" %>>Aluno</option>
			           		<option value="1" <%= "ARQUITETO".equals(usuario.getTipoUsuario()) ? "selected" : "" %>>Arquiteto</option>
		           		</select>
		            </div>
                    
                    <hr>
                    
                    <p>Campos que cont�m <span class="red">*</span> s�o obrigat�rios</p>
                    
                    
                    <div class="text-center">
			           	<input class="btn btn-warning limparUser pull-left" type="reset" value="Limpar">
			           	<input class="btn btn-primary addUser pull-right" type="submit" value="Salvar">
			        </div>
			        
                </form>
            </div>
		</div>
	</div>

<jsp:include page="/template/foot.jsp"></jsp:include>