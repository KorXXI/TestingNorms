
<script>
    $( document ).ready(function() {
        $('#modalExcluir').on('show.bs.modal', function (event) {
            var botao = $(event.relatedTarget);
            var unidadeMedidaCaseira = botao.data('unidade-medida-caseira');
            var id = botao.data('id');

            $(this).find('.modal-title')
                   .text('Excluir unidade medida caseira');

            $(this).find('#modal-descricao')
                   .text('Você realmente deseja excluir a unidade medida caseira (' + unidadeMedidaCaseira + ')?');

            $('#formExcluir').attr('action', "main?acao=removerUnidadeMedidaCaseira&id_unidade_medida_caseira=" + id);
        });


        $('#modalEditar').on('show.bs.modal', function (event) {
            var botao = $(event.relatedTarget);
            var unidadeMedidaCaseira = botao.data('unidade-medida-caseira');
            var id = botao.data('id');

            $(this).find('.modal-title').text('Editar unidade medida caseira');
            $(this).find('#modal-descricao').text('Você realmente deseja editar a unidade medida caseira (' + unidadeMedidaCaseira + ')?');

            $('#formEditar')
                    .attr('action', "main?acao=telaUnidadeMedidaCaseira&id_unidade_medida_caseira=" + id + "&isEdit=true");
        });
    });
</script>

<div class="modal fade" id="modalExcluir" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-header modal-ages">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title"></h4>
            </div>

            <div class="modal-body">
                <p id="modal-descricao"></p>
            </div>

            <div class="modal-footer">
                <form action="" method="post" id="formExcluir">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
                    <button type="submit" class="btn btn-primary">Excluir</button>
                </form>
            </div>

        </div>
    </div>
</div>

<div class="modal fade" id="modalEditar" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-header modal-ages">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title"></h4>
            </div>

            <div class="modal-body">
                <p id="modal-descricao"></p>
            </div>

            <div class="modal-footer">
                <form action="" method="post" id="formEditar">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
                    <button type="submit" class="btn btn-primary">Editar</button>
                </form>
            </div>

        </div>
    </div>
</div>

