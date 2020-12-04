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
<h4>Consulta Curso</h4>
	<form action=actionRegistraCurso id="id_form"> 
		<div class="row">
			<div class="col-md-3">		
				<div class="form-group">
					<select id="id_sistemaEvaluacion" name="curso.sistemaEvaluacion.idSistemaEvaluacion" class='form-control'>
						<option value="0">[Seleccione Sistema Evaluacion]</option>    
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
												<th>Codigo</th>
												<th>Nombre</th>
												<th>Estado</th>
												<th>SistemaEvaluacion</th>
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
	$("#id_sistemaEvaluacion").change(function(){
		
		 	$("#id_table tbody").empty(); 
		   
		 	var var_sistemaEvaluacion = $("#id_sistemaEvaluacion").val();
		 
		 	$.getJSON("consultaCursoxEvaluacion", {"parametro":var_sistemaEvaluacion}, function(data){
				$.each(data, function(index,item){
					$("#id_table").append("<tr><td>"+ item.idCurso+"</td><td>"+ item.codigo+"</td><td>"+ item.nombre+"</td><td>"+ item.estado+"</td><td>"+ item.sistemaevaluacion.nombre +"</td></tr>");
				});
			});
		 	
		
	});

	$.getJSON("ListaSistemaEvaluacion",{}, function(data){
		$.each(data, function(i,obj){
			$("#id_sistemaEvaluacion").append("<option value='" + obj.idSistemaEvaluacion +  "'>" + obj.nombre +"</option>")
		})
	});
</script>
		
</body>
</html>



