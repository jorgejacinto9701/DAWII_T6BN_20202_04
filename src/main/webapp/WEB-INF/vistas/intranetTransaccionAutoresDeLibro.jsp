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
<h4>Autores de Libro</h4>

<c:if test="${sessionScope.MENSAJE != null}">
		<div class="alert alert-success fade in" id="success-alert">
		 <a href="#" class="close" data-dismiss="alert">&times;</a>
		 <strong>${sessionScope.MENSAJE}</strong>
		</div>
	</c:if>
	<c:remove var="MENSAJE" />


<form accept-charset="UTF-8" action="ListaAutor" class="simple_form" id="defaultForm2" method="post">
				
				<div class="row">
						<div class="col-md-2" style="width: 40%" >
							<label class="control-label" for="id_autor">Autor</label>
							<select id="id_autor" name="autor"	class='form-control'>
									<option value="-1"> [Seleccione Autor] </option>
							</select>
						</div>
				</div>
				<div class="row" ><br></div>
				<div class="row" >
						<div class="col-md-2" style="width: 40%">
							<label class="control-label" for="id_todos">Todos los Libros</label>
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
							<label class="control-label" for="id_seleccion">Selección de Libros</label>
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
	$.getJSON("cargarAutor",{}, function(data,q,txt){
		$.each(data, function(key,value){
			$("#id_autor").append("<option value='" + value.idAutor +  "'>" + value.nombres  + " " + value.apaterno + " " + value.amaterno + "</option>")
		})
	});
	
	$.getJSON("cargarLibro",{}, function(data,q,txt){
		$.each(data, function(key,value){
			$("#id_todos").append("<option value='" + value.idLibro + "'>" + value.titulo  + "</option>")
		})
	});
	
	$("#id_autor").change(function (){
		var  var_sel =  $("#id_autor").val();
		console.log(var_sel);
		
		$("#id_seleccion").empty();
		
		$.getJSON("cargaLibroPorAutor",{"idAutor":var_sel}, function(data,q,txt){
			$.each(data, function(key,value){
				$("#id_seleccion").append("<option value='" + value.idLibro +  "'>" + value.titulo  + "</option>")
			})
		});
		
	});
	
	$("#id_seleccion_derecha").click(function(){
		var  var_sel_1 =  $("#id_autor").val();
		var  var_sel_2 =  $("#id_todos").val();

		if(var_sel_1 == -1){
			alert("Seleccione un autor");
			return;
		}
		
		if(var_sel_2 == null){
			alert("Seleccione un libro");
			return;
		}

		
		if(var_sel_2 != null){
			alert("Libro agregado");
			
		}

		console.log("--> idAutor : " + parseInt(var_sel_1));
		console.log("--> idLibro :" + parseInt(var_sel_2));
		
		var jsonParam = {"idLibro":parseInt(var_sel_2), "idAutor":parseInt(var_sel_1)};
		
		$.ajax({
			url:  'agregarUnLibroPorAutor',
			type: 'POST',
			dataType:'json',
			data: jsonParam,
			success:function(data){
				console.log(data);
				if(data != null){
					$("#id_seleccion").empty();
					$.each(data, function(key,value){
						$("#id_seleccion").append("<option value='" + value.idLibro + "'>" + value.titulo  + "</option>")
					})
				}else
					console("Error en traer los datos");
					return false;
				},
			error: function (jqXhr) { 
				console("Error en la conexión");
			}
	   });	
	});
	
	
	$("#id_seleccion_izquierda").click(function(){
		var  var_sel_1 =  $("#id_autor").val();
		var  var_sel_2 =  $("#id_seleccion").val();


		if(var_sel_1 == -1){
			alert("Seleccione un autor");
			return;
		}

		if(var_sel_2 == null){
			alert("Seleccione un libro");
			return;
		}
		
		
		if(var_sel_2 != null){
			alert("Libro Eliminado");
			
		}
		
		
		console.log("--> idAutor : " + parseInt(var_sel_1));
		console.log("--> idLibro :" + parseInt(var_sel_2));
		
		var jsonParam = {"idLibro":parseInt(var_sel_2), "idAutor":parseInt(var_sel_1)};
		
		$.ajax({
			url:  'eliminarUnLibroPorAutor',
			type: 'POST',
			dataType:'json',
			data: jsonParam,
			success:function(data){
				console.log(data);
				if(data != null){
					$("#id_seleccion").empty();
					$.each(data, function(key,value){
						$("#id_seleccion").append("<option value='" + value.idLibro +  "'>" + value.titulo  + "</option>")
					})
				}else
					console("Error en traer los datos");
					return false;
				},
			error: function (jqXhr) { 
				console("Error en la conexión");
			}
	   });	
	});
	
	
	$("#id_todos_derecha").click(function(){

		var  var_sel_1 =  $("#id_autor").val();
		var  var_sel =  $("#id_autor").val();


		if(var_sel_1 == -1){
			alert("Seleccione un autor");
			return;
		}
		

		if(var_sel != null){
			alert("Se agregaron todas los libros");
			
		}

		
		console.log(var_sel);

		
		var jsonParam = {"idAutor":var_sel};
		
		$.ajax({
			url:  'agregarTodosLibrosPorAutor',
			type: 'POST',
			dataType:'json',
			data: jsonParam,
			success:function(data){
				console.log(data);
				if(data != null){
					$("#id_seleccion").empty();
					$.each(data, function(key,value){
						$("#id_seleccion").append("<option value='" + value.idLibro +  "'>" + value.titulo  + "</option>")
					})
				}else
					console("Error en traer los datos");
					return false;
				},
			error: function (jqXhr) { 
				console("Error en la conexión");
			}
	   });	
	});
	
	$("#id_todos_izquierda").click(function(){
		var  var_sel_1 =  $("#id_autor").val();
		var  var_sel =  $("#id_autor").val();



		if(var_sel_1 == -1){
			alert("Seleccione un autor");
			return;
		}
		
		
		if(var_sel != null){
			alert("Se eliminaron todos los libros");
			
		}
		
		console.log(var_sel);
		$("#id_seleccion").empty();
		var jsonParam = {"idAutor":var_sel};
		
		$.ajax({
			url:  'eliminarTodosLibrosPorAutor',
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
				console("Error en la conexión");
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



