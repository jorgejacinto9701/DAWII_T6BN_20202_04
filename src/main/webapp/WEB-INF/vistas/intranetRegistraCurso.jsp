<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<jsp:include page="intranetValida.jsp" />
<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>

<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>


<title>Ejemplos de CIBERTEC - Jorge Jacinto </title>
</head>
<body>
<jsp:include page="intranetCabecera.jsp" />
<div class="container">
<h1>Registra Curso</h1>

	<c:if test="${sessionScope.MENSAJE != null}">
		<div class="alert alert-success fade in" id="success-alert">
		 <a href="#" class="close" data-dismiss="alert">&times;</a>
		 <strong>${sessionScope.MENSAJE}</strong>
		</div>
	</c:if>
	<c:remove var="MENSAJE" />

	<form action="insertaCurso" id="id_form" method="post"> 
			<input type="hidden" name="metodo" value="registra">
			<div class="form-group">
				<label class="control-label" for="id_codigo">Codigo</label>
				<input class="form-control" type="text" id="id_codigo" name="codigo" placeholder="Ingrese el codigo">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_nombre">Nombre</label>
				<input class="form-control" type="text" id="id_nombre" name="nombre" placeholder="Ingrese el nombre">
			</div>
			
				<div class="form-group">
				<label class="control-label" for="id_estado">ESTADO</label>
				<select id="id_estado" name="estado" class='form-control'>
					<option value=" ">[Seleccione]</option> 
					<option value="ACTIVO">ACTIVO</option>
					<option value="INACTIVO">INACTIVO</option>
				</select>
		    </div>
			<div class="form-group">
				<label class="control-label" for="id_sistemaevaluacion">Sistema Evaluacion</label>
				<select id="id_sistemaevaluacion" name="sistemaevaluacion.idSistemaEvaluacion" class='form-control'>
					<option value=" ">[Seleccione]</option>    
				</select>
		    </div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary" >Crea Curso</button>
			</div>
	</form>
</div>

<script type="text/javascript">
$.getJSON("cargaSistemaEvaluacion", {}, function(data){
	$.each(data, function(index,item){
		$("#id_sistemaevaluacion").append("<option value="+item.idSistemaEvaluacion +">"+ item.nombre + "</option>");
	});
});
</script>

<script type="text/javascript">
$("#success-alert").fadeTo(1000, 500).slideUp(500, function(){
    $("#success-alert").slideUp(500);
});
</script>

<script type="text/javascript">

$('#id_form').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
    	codigo: {
    		selector : '#id_codigo',
            validators: {
                notEmpty: {
                    message: 'El codigo es un campo obligatorio'
                },
                stringLength :{
                	message:'El codigo es de 3 a 40 caracteres',
                	min : 3,
                	max : 40
                }
            }
        },
    	nombre: {
    		selector : '#id_nombre',
            validators: {
                notEmpty: {
                    message: 'El nombre es un campo obligatorio'
                },
                stringLength :{
                	message:'El nombre es de 3 a 40 caracteres',
                	min : 3,
                	max : 40
                }
            }
        },
        estado: {
    		selector : '#id_estado',
            validators: {
            	notEmpty: {
                    message: 'El estado un campo obligatorio'
                }
            }
        },
        deporte: {
    		selector : '#id_sistemaevaluacion',
            validators: {
            	notEmpty: {
                    message: 'El Sistema de Evaluacion un campo obligatorio'
                },
            }
        },
    	
    }   
});
</script>

<script type="text/javascript">
$("#success-alert").fadeTo(2000, 500).slideUp(500, function(){
    $("#success-alert").slideUp(500);
});
</script>

</body>
</html>



