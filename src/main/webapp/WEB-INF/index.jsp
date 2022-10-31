<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Autorizações</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.css">

<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.js"></script>

</head>

<body>
	<div style="padding-top: 2%;">
		<div class="container"
			style="padding-top: 2%; background-color: #F8F8FF">
			<div class="justify-content-center">
				<div class="row">
					<div class="form-group col-sm-10">
						<h4>Autorizações</h4>
					</div>
				</div>

				<div class="row">
						<div class="form-group col-4">
							<input type="text" class="form-control" placeholder="Nome do procedimento" id="pesquisaProcedimento" />
						</div>
	
						<div class="form-group col-4">
							 <input	type="text" class="form-control" placeholder="CPF" id="pesquisaCpf" />
						</div>
					    <div class="form-group col-4">
							<button type="button" class="btn btn-primary" id="pesquisar" >Pesquisar</button>
					    </div>
				</div>

				<div class="d-flex flex-row-reverse bd-highlight">
					<div class="p-2 bd-highlight">
						<button type="button" class="btn btn-success float-right"
							data-toggle="modal" data-target=".bd-example-modal-lg">Novo</button>
					</div>
				</div>

				<div class="modal fade bd-example-modal-lg" tabindex="-1"
					role="dialog" aria-labelledby="myLargeModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<form name="formModal" id="formModal">
								<div class="modal-header">
									<h5 class="modal-title">Autorizar</h5>
								</div>
								<div class="modal-body">
									<div class="container" id="cadastro">
										<div class="row">
											<div class="form-group col-6">
												<label class="control-label" for="cpf">CPF</label> <input
													type="text" class="form-control" id="solicitarCpf" required>
											</div>
											<div class="form-group col-6">
												<label class="control-label" for="cpf">Nome do Procedimento</label> <input
													type="text" class="form-control" id="solicitarNomeProcedimento" required>
											</div>

										</div>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-primary" id="submit">Autorizar</button>
									<button type="button" class="btn btn-danger"
										data-dismiss="modal">Cancelar</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>

			<div class="row justify-content-center">
				<div class="col-sm-12 mb-12">
					<div class="table-responsive  bw-tabela-simples">
						<table id="tabela-autorizacao"
							class="table table-striped table-hover table-bordered">
							<thead class="aw-table-header-solid">
								<tr>
									<th>CPF</th>
									<th>Nome</th>
									<th>Procedimento</th>
									<th>Data Autorização</th>
								</tr>
							</thead>

						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
	
	    function listar() {
	    	$('#tabela-autorizacao').dataTable().fnDestroy();
	    	$.extend(true, $.fn.dataTable.defaults, {
			    searching: false,
			    ordering: false,
			    paging: true,
			    info: true,
			    scrollX: false,
			    scrollY: false
			});
			$.ajax({
				url : 'autorizacao',
				data : {
					cpf : $('#pesquisaCpf').val(),
					nomeProcedimento : $('#pesquisaProcedimento').val()
				},
				success : function(responseText) {
					
					$('#tabela-autorizacao').DataTable({
						data : responseText,
						columns : [ {
							data : 'cpf'
						}, {
							data : 'nomeBeneficiario'
						}, {
							data : 'nomeProcedimento'
						}, {
							data : 'dataAutorizacao'
						} ]
					});
					
				}
			});
	    }
			
		$(document).ready(function() {
			
			listar();
		});
		
		$('#pesquisar').click(function() {
			listar();
			
		});
		
		$('#submit').click(function() {
			$('#tabela-autorizacao').dataTable().fnDestroy();

			$.ajax({
				url : 'autorizacao',
				type: "POST",
				data : {
					cpf : $('#solicitarCpf').val(),
					nomeProcedimento : $('#solicitarNomeProcedimento').val()
				},
				success : function(responseText) {
					listar();
					
				}, error: function (request, status, error) {
	                alert(request.responseText);
	            }
			});
		});
		

			

	</script>

</body>
</html>