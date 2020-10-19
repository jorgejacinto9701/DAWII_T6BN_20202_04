
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


<title>Intranet Colegio - Jorge Jacinto Gutarra</title>
</head>
<body>

<jsp:include page="intranetCabecera.jsp" />
<div class="container">&nbsp;<br>&nbsp;<br>&nbsp;<br>
<h4>REGISTRO DE DISPONIBILIDAD</h4>
</div>


<div class="container">

<h1>REGISTRO DE DISPONIBILIDAD</h1>
	

	
	
	<form action="insertaDisponibilidad" id="id_form" method="post"> 
			<input type="hidden" name="metodo" value="registra">	
			<div class="form-group">
				<label class="control-label" for="id_horaini">HORA-INICIO</label>
				<input class="form-control" type="time" id="id_horaini" name="horaInicio" placeholder="Ingrese la Hora de Inicio">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_horafin">HORA-FIN</label>
				<input class="form-control" id="id_horafin" name="horaFin" placeholder="Ingrese la Hora de Fin" type="time" />
			</div>
			<div class="form-group">
				<label class="control-label" for="id_dia">DIA</label>
				<select id="id_dia" name="dia" class='form-control'>
					<option value=" ">[Seleccione]</option> 
					<option value="Lunes">Lunes</option>
					<option value="Martes">Martes</option>
					<option value="Miercoles">Miercoles</option>
					<option value="Jueves">Jueves</option>
					<option value="Viernes">Viernes</option>
					<option value="Sabado">Sabado</option>
					<option value="Domingo">Domingo</option>
					
				</select>
		    </div>

			
			<div class="form-group">
				<label class="control-label" for="id_ciclo">CICLO</label>
				<select id="id_ciclo" name="ciclo.idCiclo" class='form-control'>
					<option value=" ">[Seleccione]</option>    
				</select>
		    </div>
		    
		    <div class="form-group">
				<label class="control-label" for="id_usuario">USUARIO</label>
				<select id="id_usuario" name="usuario.idUsuario" class='form-control'>
					<option value=" ">[Seleccione]</option>    
				</select>
		    </div>
		    
		    
		    
			<div class="form-group">
				<button type="submit" class="btn btn-primary" >CREAR DISPONIBILIDAD</button>
			</div>
	</form>
</div>


<script type="text/javascript">
$.getJSON("cargaCiclo", {}, function(data){
	$.each(data, function(index,item){
		$("#id_ciclo").append("<option value="+item.idCiclo +">"+ item.nombre +"</option>");
	});
});
</script>


<script type="text/javascript">
$.getJSON("cargaUsuario", {}, function(data){
	$.each(data, function(index,item){
		$("#id_usuario").append("<option value="+item.idUsuario +">"+ item.nombres +"</option>");
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
    	nombre: {
    		selector : '#id_horaini',
            validators: {
                notEmpty: {
                    message: 'La Hora de Inicio es un campo obligatorio'
                },
                
            }
        },
        numHombres: {
    		selector : '#id_horafin',
            validators: {
                notEmpty: {
                    message: 'La Hora Fin  es un campo obligatorio'
                },
                
            }
        },
        numMujeres: {
    		selector : '#id_dia',
            validators: {
            	notEmpty: {
                    message: 'El Dia es un campo Obligatorio'
                },
               
            }
        },
        edadMaxima: {
    		selector : '#id_ciclo',
            validators: {
            	notEmpty: {
                    message: 'El Ciclo es un campo obligatorio'
                },
                
            }
        },
        edadMinima: {
    		selector : '#id_usuario',
            validators: {
            	notEmpty: {
                    message: 'El Usuario es un campo Obligatorio'
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
<div class="container" >
 <div class="col-md-12" align="center"> 

 </div>
</div> 
       
   		
</body>
</html>