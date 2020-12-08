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
<div class="container" style="margin-top: 4%">
<h4>Opciones de Rol</h4>

<c:if test="${sessionScope.MENSAJE != null}">
		<div class="alert alert-success fade in" id="success-alert">
		 <a href="#" class="close" data-dismiss="alert">&times;</a>
		 <strong>${sessionScope.MENSAJE}</strong>
		</div>
	</c:if>
	<c:remove var="MENSAJE" />


<form accept-charset="UTF-8" action="ListaRol" class="simple_form" id="defaultForm2" method="post">
				
				<div class="row">
						<div class="col-md-2" style="width: 40%" >
							<label class="control-label" for="id_rol">Roles</label>
							<select id="id_rol" name="autor"	class='form-control'>
									<option value="-1"> [Seleccione Rol] </option>
							</select>
						</div>
				</div>
				<div class="row" ><br></div>
				<div class="row" >
						<div class="col-md-2" style="width: 40%">
							<label class="control-label" for="id_todos">Todas las Opciones</label>
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
							<label class="control-label" for="id_seleccion">Selecci�n de Opciones</label>
							<select id="id_seleccion" class='form-control' multiple='multiple' style="height: 350px">
									
							</select>
						</div>
				</div>
				
		</form>	
		

<script type="text/javascript">
$("#success-alert").fadeTo(2000, 500).slideUp(500, function(){
    $("#success-alert").slideUp(500);
});
</script>		
					
<script type="text/javascript">
	$.getJSON("cargaRol",{}, function(data,q,txt){
		$.each(data, function(key,value){
			$("#id_rol").append("<option value='" + value.idRol +  "'>" + value.nombre  + "</option>")
		})
	});
	
	$.getJSON("cargaOpcion",{}, function(data,q,txt){
		$.each(data, function(key,value){
			$("#id_todos").append("<option value='" + value.idOpcion + "'>" + value.nombre  + "</option>")
		})
	});
	
	$("#id_rol").change(function (){
		var  var_sel =  $("#id_rol").val();
		console.log(var_sel);
		
		$("#id_seleccion").empty();
		
		$.getJSON("cargaOpcionPorRol",{"idRol":var_sel}, function(data,q,txt){
			$.each(data, function(key,value){
				$("#id_seleccion").append("<option value='" + value.idOpcion +  "'>" + value.nombre  + "</option>")
			})
		});
		
	});
	
	$("#id_seleccion_derecha").click(function(){
		var  var_sel_1 =  $("#id_rol").val();
		var  var_sel_2 =  $("#id_todos").val();

		if(var_sel_1 == -1){
			alert("Seleccione un rol");
			return;
		}
		
		if(var_sel_2 == null){
			alert("Seleccione una opci�n");
			return;
		}

		
		if(var_sel_2 != null){
			alert("Opci�n agregada");
			
		}

	
			
	


		
		
		
		console.log("--> idRol : " + parseInt(var_sel_1));
		console.log("--> idOpcion :" + parseInt(var_sel_2));
		
		var jsonParam = {"idOpcion":parseInt(var_sel_2), "idRol":parseInt(var_sel_1)};
		
		$.ajax({
			url:  'agregarUnaOpcionPorRol',
			type: 'POST',
			dataType:'json',
			data: jsonParam,
			success:function(data){
				console.log(data);
				if(data != null){
					$("#id_seleccion").empty();
					$.each(data, function(key,value){
						$("#id_seleccion").append("<option value='" + value.idOpcion + "'>" + value.nombre  + "</option>")
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
		var  var_sel_1 =  $("#id_rol").val();
		var  var_sel_2 =  $("#id_seleccion").val();


		if(var_sel_1 == -1){
			alert("Seleccione un rol");
			return;
		}

		if(var_sel_2 == null){
			alert("Seleccione una opci�n");
			return;
		}
		
		
		if(var_sel_2 != null){
			alert("Opci�n Eliminada");
			
		}
		
		
		console.log("--> idRol : " + parseInt(var_sel_1));
		console.log("--> idOpcion :" + parseInt(var_sel_2));
		
		var jsonParam = {"idOpcion":parseInt(var_sel_2), "idRol":parseInt(var_sel_1)};
		
		$.ajax({
			url:  'eliminaUnaOpcionPorRol',
			type: 'POST',
			dataType:'json',
			data: jsonParam,
			success:function(data){
				console.log(data);
				if(data != null){
					$("#id_seleccion").empty();
					$.each(data, function(key,value){
						$("#id_seleccion").append("<option value='" + value.idOpcion +  "'>" + value.nombre  + "</option>")
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

		var  var_sel_1 =  $("#id_rol").val();
		var  var_sel =  $("#id_rol").val();


		if(var_sel_1 == -1){
			alert("Seleccione un rol");
			return;
		}
		

		if(var_sel != null){
			alert("Se agregaron todas las opciones ");
			
		}

		
		console.log(var_sel);

		
		var jsonParam = {"idRol":var_sel};
		
		$.ajax({
			url:  'agregarTodosOpcionPorRol',
			type: 'POST',
			dataType:'json',
			data: jsonParam,
			success:function(data){
				console.log(data);
				if(data != null){
					$("#id_seleccion").empty();
					$.each(data, function(key,value){
						$("#id_seleccion").append("<option value='" + value.idOpcion +  "'>" + value.nombre  + "</option>")
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
		var  var_sel_1 =  $("#id_rol").val();
		var  var_sel =  $("#id_rol").val();



		if(var_sel_1 == -1){
			alert("Seleccione un rol");
			return;
		}
		
		
		if(var_sel != null){
			alert("Se eliminaron todas las opciones ");
			
		}
		
		console.log(var_sel);
		$("#id_seleccion").empty();
		var jsonParam = {"idRol":var_sel};
		
		$.ajax({
			url:  'eliminarTodosOpcionPorRol',
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

<script type="text/javascript">
$("#success-alert").fadeTo(2000, 500).slideUp(500, function(){
    $("#success-alert").slideUp(500);
});
</script>
	</div>	

</body>
</html>







