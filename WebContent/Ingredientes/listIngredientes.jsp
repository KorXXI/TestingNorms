<%@page import="br.ages.crud.model.Ingrediente"%>
<%@page import="java.util.List"%>
<jsp:include page="../template/head.jsp"></jsp:include>

<!-- MODAL / POPUP -->
<jsp:include page="../template/modalIngrediente.jsp"></jsp:include>
 		
<div class="panel panel-success">
   		
	<div class="panel-heading text-center">Lista de Ingredientes</div>
               
       <div class="panel-body">
       
		<jsp:include page="/template/msg.jsp"></jsp:include>
        <div class="table-responsive">
        
        <table id="listaIngredientes" class="table table-responsive table-striped table-hover table-condensed table-bordered">

            <thead>
                <tr>
                    <th style="text-align: center;">Id</th>
                    <th style="text-align: center;">C�digo</th>
					<th style="text-align: center;">Descri��o</th>
					<th style="text-align: center;">Carboidratos</th>
					<th style="text-align: center;">Kcal Carboidratos</th>
					<th style="text-align: center;">Proteinas</th>
					<th style="text-align: center;">Kcal Proteinas</th>
					<th style="text-align: center;">Lipidios</th>
					<th style="text-align: center;">Kcal Lipidios</th>
					<th style="text-align: center;">Fator Corre��o</th>
					<th style="text-align: center;">�ndice Coc��o</th>
					<th style="text-align: center;">Custo</th>
					<th style="text-align: center;">Unidade de Medida</th>
					<th style="text-align: center;">Data Inser��o</th>
					<th style="text-align: center;"></th>
					<th style="text-align: center;"></th>
                </tr>
            </thead>

            <tbody> 
            	<%
	            	List<Ingrediente> listaIngredientes = (List<Ingrediente>) request.getAttribute("listaIngredientes");
					for (Ingrediente ing : listaIngredientes) {
				%>
				          
            	<tr>
	            	<td align="center"><%=ing.getId()%></td>
	            	<td align="center"><%=ing.getCodigo()%></td>
	            	<td align="center"><%=ing.getDescricao()%></td>
	            	<td align="center"><%=ing.getCarboidratos()%></td>
	            	<td align="center"><%=ing.getKcalCarboidratos()%></td>
	            	<td align="center"><%=ing.getProteinas()%></td> 
	            	<td align="center"><%=ing.getKcalProteinas()%></td>
	            	<td align="center"><%=ing.getLipidios()%></td>
	            	<td align="center"><%=ing.getKcalLipidios()%></td>
	            	<td align="center"><%=ing.getFatorCorrecao()%></td>
	            	<td align="center"><%=ing.getIndiceCoccao()%></td>
	            	<td align="center"><%=ing.getCusto()%></td>
	            	<td align="center"><%=ing.getUnidadeMedida()%></td>
	            	<td align="center"><%=ing.getDataAlteracao()%></td>
	            	<td align="center">
						<form action="" method="post">
            				<a href="" data-toggle="modal" data-id="<%=ing.getId() %>" data-ingrediente="<%=ing.getDescricao()%>" 
            				data-target="#modalEditar" title="Editar"> <i class="glyphicon glyphicon-pencil"></i></a>
            			</form>
            		</td>
            		
            		<td align="center">
            			<form action="" method="post">
            				<a href="" data-toggle="modal" data-id="<%=ing.getId() %>" data-ingrediente="<%=ing.getDescricao()%>" 
            				data-target="#modalExcluir" title="Deletar"> <i class="glyphicon glyphicon-trash"></i></a>
            			</form>
            		</td>
            	</tr>
				<% 
					} 
				%>
			</tbody>
            
        </table> 
		</div>
    </div>
</div>
<jsp:include page="../template/foot.jsp"></jsp:include>
<script>

$(document).ready(function(){
	$('#listaIngredientes').dataTable({
	    "language": {
            "lengthMenu": "Mostrando _MENU_ registros por p�gina",
            "zeroRecords": "Sem registros - sorry",
            "info": "Mostrando _PAGE_ de _PAGES_ p�ginas",
            "infoEmpty": "Nenhum registros encontrados!",
            "infoFiltered": "(Filtrado _MAX_ do total deregistros)",
            "search":"Busca",
           	"paginate": {
                "first":      "Primeiro",
                "last":       "�ltimo",
                "next":       "Pr�ximo",
                "previous":   "Anterior"
	        },
        }
	});
});;
</script>