<jsp:include page="intranetValida.jsp" />
<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Expires" content="-1" />
<meta http-equiv="Cache-Control" content="private" />
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />


<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>

<title>Intranet</title>
</head>
<body>
<jsp:include page="intranetCabecera.jsp" />
<div class="container" style="margin-top: 5%"><h4>Registro Cliente</h4></div>

<div class="container" style="margin-top: 1%">
<!-- Agregar aquí -->
	<div class="row col-md-10 col-md-offset-1">
			<form id="id_formRegistro" method="POST" class="row">
				<div class="row ">
					  <div class="form-group col-md-6 ">
					    <label for="nombre_registro" class="form-label">Nombre</label>
					    <input name="nombres" type="text" class="form-control" id="nombre_registro"  placeholder="Ingrese el nombre">
					  </div>
					  <div class="form-group col-md-6">
					    <label for="apellido_registro" class="form-label">Apellido</label>
					    <input name="apellidos" type="text" class="form-control" id="apellido_registro" placeholder="Ingrese Apellido">
					  </div>
			    </div>
			     <div class="row">
					 <div class="form-group col-md-4">
					    <label for="correo_registro" class="form-label">Correo</label>
					    <input name="correo" type="text" class="form-control" id="correo_registro" placeholder="Ingrese Correo">
					  </div>
				
					  <div class="form-group col-md-4">
					    <label for="direccion_registro" class="form-label">Direccion</label>
					    <input name="direccion" type="text" class="form-control" id="direccion_registro" placeholder="Ingrese Direccion">
					  </div>
					  
					  <div class="form-group col-md-4">
					    <label for="estado_registro" class="form-label">Estado</label>
					    <select id="estado_registro" name="estado" class='form-control'>
						    <option value=" ">[Seleccione Estado]</option> 
							<option value="1">1</option>   
							<option value="0">0</option>    
					    </select>
					  </div>
				</div>	
			    <div class="row">  
				  <div class="form-group  col-md-4">
					<label class="control-label" for="id_departamento">DEPARTAMENTO</label>
					<select id="id_departamento" name="" class='form-control'>
						<option value=" ">[Seleccione Departamento]</option>    
					</select>
			    </div>
			   	<div class="form-group  col-md-4">
					<label class="control-label" for="id_provincia">PROVINCIA</label>
					<select id="id_provincia" name="" class='form-control'>
						<option value=" ">[Seleccione Provincia]</option>    
					</select>
			    </div>
			   <div class="form-group  col-md-4">
					<label class="control-label" for="id_distrito">DISTRITO</label>
					<select id="id_distrito" name="ubigeo.idUbigeo" class='form-control'>
						<option value=" ">[Seleccione Distrito]</option>    
					</select>
		       </div>
		      </div>
		      
			  <button type="button" id="btn_registra" class="btn btn-primary">Submit</button>
		</form>
	</div>
</div>
	
</body>

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<script type="text/javascript" src="js/global.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<script type="text/javascript">

$.getJSON("listaDepartamentos",{}, function(data){
	$.each(data, function(i, item){
		$("#id_departamento").append("<option value='"+ item +"'>"+ item+"</option>");
	});
});

$("#id_departamento").change(function(){
	var var_dep = $("#id_departamento").val();
	
	$("#id_provincia").empty();
	$("#id_provincia").append("<option value=' '>[Seleccione Provincia]</option>");
	
	$.getJSON("listaProvincias",{"departamento":var_dep},function(data){
        $.each(data,function(i,item){
        	$("#id_provincia").append("<option value='"+ item +"'>"+ item+"</option>");
        });
	});
});

$("#id_provincia").change(function(){
	var var_dep = $("#id_departamento").val();
	var var_pro = $("#id_provincia").val();
	
	$("#id_distrito").empty();
	$("#id_distrito").append("<option value=' '>[Seleccione Distrito]</option>");
	
	$.getJSON("listaDistritos",{"departamento":var_dep,"provincia":var_pro},function(data){
        $.each(data,function(i,item){
        	$("#id_distrito").append("<option value='"+ item.idUbigeo +"'>"+ item.distrito+"</option>");
        });
	});
});



	

			
</script>	

<script type="text/javascript">
function limpiarFormulario(){	
	$('#nombre_registro').val('');
	$('#apellido_registro').val(' ');
	$('#correo_registro').val(' ');
	$('#direccion_registro').val(' ');
	$('#estado_registro').val('');
	$('#id_departamento').val('[Seleccione Departemento]');
	$("#id_provincia").val('[Seleccione Provincia]');
	$("#id_distrito").val('[Seleccione Distrito]');
}

$("#btn_registra").click(function(){
	var validator = $('#id_formRegistro').data('bootstrapValidator');
    validator.validate();
    if (validator.isValid()) {
        $.ajax({
          type: "POST",
          url: "registroCliente", 
          data: $('#id_formRegistro').serialize(),
          success: function(data){
        	 
        	  Swal.fire({
        		  position: 'top-end',
        		  icon: 'success',
        		  title: data.Mensaje,
        		  showConfirmButton: false,
        		  timer: 1500
        		});
        	  limpiarFormulario();
        	  validator.resetForm();
        	 
          },
          error: function(data){
        	  Swal.fire({
        		  position: 'top-end',
        		  icon: 'error',
        		  title: "Error al Registrar",
        		  showConfirmButton: false,
        		  timer: 1500
        		})
          }
        });
    }
    
});



$('#id_formRegistro').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
    	nombre: {
    		selector : '#nombre_registro',
            validators: {
                notEmpty: {
                    message: 'El nombre es un campo obligatorio'
                },
                stringLength :{
                	message:'El nombre es de 5 a 20 caracteres',
                	min : 5,
                	max : 20
                }
            }
        },
        apellido: {
    		selector : '#apellido_registro',
            validators: {
                notEmpty: {
                    message: 'El Apellido es un campo obligatorio'
                },
                stringLength :{
                	message:'El apelldido es de 5 a 50 caracteres',
                	min : 5,
                	max : 50
                }
            }
        },
       correo: {
    		selector : '#correo_registro',
            validators: {
                notEmpty: {
                    message: 'El Correo es un campo obligatorio'
                },
                stringLength :{
                	message:'El correo es de 5 a 30 caracteres',
                	min : 5,
                	max : 30
                },
                emailAddress: {
                    message: 'Debe Ingresar un Correo existente'
                },
            }
        },
        
        direccion: {
    		selector : '#direccion_registro',
            validators: {
                notEmpty: {
                    message: 'La Direccion es un campo obligatorio'
                },
                stringLength :{
                	message:'La Direccion es de 5 a 50 caracteres',
                	min : 5,
                	max : 50
                },
               
            }
        },
        numHombres: {
    		selector : '#estado_registro',
            validators: {
                notEmpty: {
                    message: 'El Estado es un campo obligatorio'
                },
               
            }
        },
       
        provincia: {
    		selector : '#id_provincia',
            validators: {
                notEmpty: {
                    message: 'La provincia es un campo obligatorio'
                },
               
            }
        },
        departamento: {
    		selector : '#id_departamento',
            validators: {
            	notEmpty: {
                    message: 'El departamento es un campo obligatorio'
                },
            }
        },
        distrito: {
    		selector : '#id_distrito',
            validators: {
            	notEmpty: {
                    message: 'El Distrito es un campo obligatorio'
                },
            }
        },
    	
    }   
});
</script>
</html>


