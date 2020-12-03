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
<h3>Consulta Disponibilidad por Ciclo</h3>

	<form action=actionRegistraDisponibilidad id="id_form"> 
		<div class="row">
			<div class="col-md-3">		
				<div class="form-group">
					<select id="id_ciclo" name="disponibilidad.ciclo.idCiclo" class='form-control'>
						<option value="0">[Seleccione Ciclo]</option>    
						<option value="-1">[Todos]</option>    
					</select>
			    </div>
		 	</div>
		 </div>   
		 <div class="row">
		 	<div class="col-md-12">
				<div class="content" >
						<table id="id_table" class="table table-striped table-bordered" >
										<thead>
											<tr>
												<th>ID</th>
												<th>Hora Inicio</th>
												<th>Hora Fin</th>
												<th>Día</th>
												<th>Ciclo</th>
												<th>Usuario</th>
											</tr>
										</thead>
										<tbody>
												   

										</tbody>
							</table>	
					</div>	
				</div>
		 </div>
		    
	</form>
	
</div>

<script type="text/javascript">
	$("#id_ciclo").change(function(){
		
		 	$("#id_table tbody").empty(); 
		   
		 	var var_ciclo = $("#id_ciclo").val();
		 
		 	$.getJSON("consultaDisponibilidad", {"parametro":var_ciclo}, function(data){
				$.each(data, function(index,item){
					$("#id_table").append("<tr><td>"+ item.idDisponibilidad +"</td><td>"+ item.horaInicio +"</td><td>"+ item.horaFin +"</td><td>"+ item.dia +"</td><td>"+ item.ciclo.nombre +"</td><td>"+ item.usuario.nombreCompleto +"</td></tr>");
				});
			});
		 	
		
	});

	$.getJSON("listaTotalCiclo",{}, function(data){
		$.each(data, function(i,obj){
			$("#id_ciclo").append("<option value='" + obj.idCiclo +  "'>" + obj.nombre +"</option>")
		})
	});
</script>

</body>
</html>



