<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
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


<title>Sistemas - Jorge Jacinto Gutarra</title>
</head>
<body>
<jsp:include page="intranetCabecera.jsp" />
<div class="container">
<h3>Usuarios de rol</h3>

	<form accept-charset="UTF-8" action="ListaAutor" class="simple_form" id="defaultForm2" method="post">
				
				<div class="row">
						<div class="col-md-2" style="width: 40%" >
							<label class="control-label" for="id_autor">Usuario</label>
							<select id="id_autor" name="autor"	class='form-control'>
									<option value="-1"> [Seleccione Usuario] </option>
							</select>
						</div>
				</div>
				<div class="row" ><br></div>
				<div class="row" >
						<div class="col-md-2" style="width: 40%">
							<label class="control-label" for="id_todos">Todas los Roles</label>
							<select id="id_todos" class='form-control' multiple='multiple' style="height: 350px">
									
							</select>
						</div>
						<div  class="col-md-2" style="width: 20%; " align="center">
									<br><br><button type="button" id="id_todos_derecha" style="width: 100px" class="btn btn-primary"> &#62; &#62;</button><br><br>
									<button type="button" id="id_seleccion_derecha" style="width: 100px" class="btn btn-primary"> &#62; </button><br><br>
									<button type="button" id="id_seleccion_izquierda"  style="width: 100px" class="btn btn-primary"> &#60; </button><br><br>
									<button type="button" id="id_todos_izquierda" style="width: 100px" class="btn btn-primary"> &#60; &#60; </button>
						</div>
						<div  class="col-md-2" style="width: 40%" >
							<label class="control-label" for="id_seleccion">Selecci�n de roles</label>
							<select id="id_seleccion" class='form-control' multiple='multiple' style="height: 350px">
									
							</select>
						</div>
				</div>
				
		</form>			
					
<script type="text/javascript">
	$.getJSON("cargaAutor",{}, function(data,q,txt){
		$.each(data, function(key,value){
			$("#id_autor").append("<option value='" + value.idUsuario +  "'>" + value.nombres  + "</option>")
		})
	});
	
	$.getJSON("cargaInvestigacion",{}, function(data,q,txt){
		$.each(data, function(key,value){
			$("#id_todos").append("<option value='" + value.idRol + "'>" + value.nombre  + "</option>")
		})
	});
	
	$("#id_autor").change(function (){
		var  var_sel =  $("#id_autor").val();
		console.log(var_sel);
		
		$("#id_seleccion").empty();
		
		$.getJSON("cargaInvestigacionPorAutor",{"idUsuario":var_sel}, function(data,q,txt){
			$.each(data, function(key,value){
				$("#id_seleccion").append("<option value='" + value.idRol +  "'>" + value.nombre  + "</option>")
			})
		});
		
	});
	
	$("#id_seleccion_derecha").click(function(){
		var  var_sel_1 =  $("#id_autor").val();
		var  var_sel_2 =  $("#id_todos").val();
		
		console.log("--> idUsuario : " + parseInt(var_sel_1));
		console.log("--> idRol :" + parseInt(var_sel_2));
		
		var jsonParam = {"idRol":parseInt(var_sel_2), "idUsuario":parseInt(var_sel_1)};
		
		$.ajax({
			url:  'agregarUnaInvestigacionPorAutor',
			type: 'POST',
			dataType:'json',
			data: jsonParam,
			success:function(data){
				console.log(data);
				if(data != null){
					$("#id_seleccion").empty();
					$.each(data, function(key,value){
						$("#id_seleccion").append("<option value='" + value.idRol + "'>" + value.nombre  + "</option>")
					})
				}else
					console("Error en traer los datos");
					return false;
				},
			error: function (jqXhr) { 
				console("Error en la conexi�n");
			}
	   });	
	});
	
	
	$("#id_seleccion_izquierda").click(function(){
		var  var_sel_1 =  $("#id_autor").val();
		var  var_sel_2 =  $("#id_seleccion").val();
		
		console.log("--> idUsuario : " + parseInt(var_sel_1));
		console.log("--> idRol :" + parseInt(var_sel_2));
		
		var jsonParam = {"idRol":parseInt(var_sel_2), "idUsuario":parseInt(var_sel_1)};
		
		$.ajax({
			url:  'eliminaUnaInvestigacionPorAutor',
			type: 'POST',
			dataType:'json',
			data: jsonParam,
			success:function(data){
				console.log(data);
				if(data != null){
					$("#id_seleccion").empty();
					$.each(data, function(key,value){
						$("#id_seleccion").append("<option value='" + value.idRol +  "'>" + value.nombre  + "</option>")
					})
				}else
					console("Error en traer los datos");
					return false;
				},
			error: function (jqXhr) { 
				console("Error en la conexi�n");
			}
	   });	
	});
	
	
	$("#id_todos_derecha").click(function(){
		var  var_sel =  $("#id_autor").val();
		console.log(var_sel);
		
		var jsonParam = {"idUsuario":var_sel};
		
		$.ajax({
			url:  'agregarTodosInvestigacionPorAutor',
			type: 'POST',
			dataType:'json',
			data: jsonParam,
			success:function(data){
				console.log(data);
				if(data != null){
					$("#id_seleccion").empty();
					$.each(data, function(key,value){
						$("#id_seleccion").append("<option value='" + value.idRol +  "'>" + value.nombre  + "</option>")
					})
				}else
					console("Error en traer los datos");
					return false;
				},
			error: function (jqXhr) { 
				console("Error en la conexi�n");
			}
	   });	
	});
	
	$("#id_todos_izquierda").click(function(){
		var  var_sel =  $("#id_autor").val();
		console.log(var_sel);
		$("#id_seleccion").empty();
		var jsonParam = {"idUsuario":var_sel};
		
		$.ajax({
			url:  'eliminarTodosInvestigacionPorAutor',
			type: 'POST',
			dataType:'json',
			data: jsonParam,
			success:function(data){
				console.log(data);
				if(data != null){
					console("Se eliminaron correctamente");
					return false;
				}else
					console("Error en traer los datos");
					return false;
				},
			error: function (jqXhr) { 
				console("Error en la conexi�n");
			}
	   });	
	});
	
</script>

</div>
</body>
</html>



