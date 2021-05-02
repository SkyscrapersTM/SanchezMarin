<jsp:include page="intranetValida.jsp" />
<!DOCTYPE html>
<html lang="esS">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Expires" content="-1" />
<meta http-equiv="Cache-Control" content="private" />
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<script type="text/javascript" src="js/global.js"></script>

<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrapValidator.css" />

<title>Intranet</title>
</head>
<body>
	<jsp:include page="intranetCabecera.jsp" />
	<div class="container" style="margin-top: 5%">
		<h4>Registro Reclamo</h4>
	</div>

	<div class="container" style="margin-top: 1%">
		<!-- Agregar aquí -->
		<form id="id_form" method="post">
			<div class="col-md-12" style="margin-top: 2%">
				<div class="row">
					<div class="form-group col-md-6">
						<label class="control-label" for="id_decripcion">decripcion</label>
						<input type="text" name="decripcion" id="id_decripcion" class="form-control">
					</div>
					<div class="form-group col-md-3">
						<label class="control-label" for="id_estado">Estado</label> <select
							id="id_estado" name="estado" class="form-control">
							<option value=" ">[Seleccione]</option>
							<option value="1">Activo</option>
							<option value="0">Inactivo</option>
						</select>

					</div>
				</div>
				<div class="row">
					<div class="form-group col-md-3">
						<label class="control-label" for="id_Cliente">Cliente</label> <select
							id="id_Cliente" name="cliente.idCliente" class='form-control'>
							<option value=" ">[Seleccione]</option>
						</select>
					</div>
					<div class="form-group col-md-3">
						<label class="control-label" for="id_TipoReclamo">Reclamo</label>
						<select id="id_TipoReclamo" name="tipoReclamo.idTipoReclamo"
							class='form-control'>
							<option value=" ">[Seleccione]</option>
						</select>
					</div>

				</div>
				<div class="row">
					<div class="form-group col-md-12" align="center">
						<button id="id_registrar" type="button" class="btn btn-primary">Registra</button>
					</div>
				</div>
			</div>
		</form>
	</div>

	<script type="text/javascript">
		$.getJSON("listaCliente", {}, function(data) {
			$.each(data, function(index, item) {
				$("#id_Cliente").append(
						"<option value="+item.idCliente +">" + item.nombres
								+ "</option>");
			});
		});

		$.getJSON("listaTipoReclamo", {}, function(data) {
			$.each(data, function(index, item) {
				$("#id_TipoReclamo").append(
						"<option value="+item.idTipoReclamo +">"
								+ item.descripcion + "</option>");
			});
		});

		$("#id_registrar").click(function() {

			var validator = $('#id_form').data('bootstrapValidator');
			validator.validate();

			if (validator.isValid()) {
				$.ajax({
					type : 'POST',
					data : $("#id_form").serialize(),
					url : 'RegistraReclamo',
					success : function(data) {
						mostrarMensaje(data.MENSAJE);
						validator.resetForm();
						limpiar();
					},
					error : function() {
						mostrarMensaje(MSG_ERROR);
					}
				});
			}
		});
	
		function limpiar(){
		    $("#id_decripcion").val('');
		    $("#id_estado").val('');
		    $("#id_Cliente").val('');
		    $("#id_TipoReclamo").val(' ');
		 
		}
		
		$('#id_form').bootstrapValidator({
			message : 'This value is not valid',
			feedbackIcons : {
				valid : 'glyphicon glyphicon-ok',
				invalid : 'glyphicon glyphicon-remove',
				validating : 'glyphicon glyphicon-refresh'
			},
			fields : {
				decripcion : {
					selector : '#id_decripcion',
					validators : {
						notEmpty : {
							message : 'La descripción es un campo obligatorio'
						},
						stringLength : {
							message : 'El nombre es de 5 a 100 caracteres',
							min : 5,
							max : 100
						}
					}
				},
				estado : {
					selector : '#id_estado',
					validators : {
						notEmpty : {
							message : 'El estado es un campo obligatorio'
						}
					}
				},
				cliente : {
					selector : '#id_Cliente',
					validators : {
						notEmpty : {
							message : 'El cliente es un campo obligatorio'
						}
					}
				},
				tipoReclamo : {
					selector : '#id_TipoReclamo',
					validators : {
						notEmpty : {
							message : 'El reclamo es un campo obligatorio'
						}
					}
				},
			}
		});
	</script>
</body>
</html>