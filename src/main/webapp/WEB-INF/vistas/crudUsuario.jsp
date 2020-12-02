<jsp:include page="intranetValida.jsp" />
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
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
<div class="container" style="margin-top: 4%">
<h3>Mantenimiento Usuario</h3>
	
	 <div class="col-md-23" >  
			  <form id="idFormElimina" action="eliminaCrudUsuario">
			  		<input type="hidden" id="id_elimina" name="id">
			  </form>	
				
		       <form accept-charset="UTF-8"  action="consultaCrudUsuario" class="simple_form" id="defaultForm2"  method="post">

					<div class="row" style="height: 70px">
						<div class="col-md-2" >
								<input class="form-control" id="id_nonbre_filtro"  name="filtro" placeholder="Ingrese el nombre" type="text" maxlength="30"/>
						</div>
						<div class="col-md-2" >
							<button type="submit" class="btn btn-primary" style="width: 150px">FILTRA</button>
						</div>
						<div class="col-md-2">
							<button type="button" data-toggle='modal' onclick="registrar();"  class='btn btn-success' id="validateBtnw2" style="width: 150px">REGISTRA</button>
						</div>
						<div class="col-md-4">
							<c:if test="${sessionScope.MENSAJE != null }">
									<div class="alert alert-success" id="success-alert">
							 		   <button type="button" class="close" data-dismiss="alert">x</button>
										${sessionScope.MENSAJE}				
									</div>
							</c:if>
							<c:remove var="MENSAJE"/>
						</div>
					</div>
					
					<div class="row" > 
						<div class="col-md-12">
								<div class="content" >
						
									<table id="tablePaginacion" class="table table-striped table-bordered" >
										<thead>
											<tr>
												<th>ID</th>
												<th>Nombre</th>
												<th>APELLIDO PATERNO</th>
												<th>APELLIDO MATERNO</th>
												<th>FECHA NACIMIENTO</th>
												<th>FECHA REGISTRO</th>
												<th>EMAIL</th>
												<th>ESTADO</th>
												<th>CELULAR</th>
												<th>DIRECCION</th>
												<th>LOGIN</th>
												<th>PASSWORD</th>
												<th>DNI</th>
												<th>Tipo Usuario</th>
												<th>Ubigeo</th>
												<th>Actualiza</th>
												<th>Elimina</th>
											</tr>
										</thead>
										<tbody>
												   
												<c:forEach items="${sessionScope.usuarios}" var="x">
													<tr>
														<td>${x.idUsuario}</td>
														<td>${x.nombres}</td>
														<td>${x.apaterno}</td>
														<td>${x.amaterno}</td>
														<td>${x.fechaNacimiento}</td>
														<td>${x.fechaRegistro}</td>
														<td>${x.email}</td>
														<td>${x.estado}</td>
														<td>${x.celular}</td>
														<td>${x.direccion}</td>
														<td>${x.dni}</td>
														<td>${x.login}</td>
														<td>${x.password}</td>
														<td>${x.tipousuario.nombre}</td>
														<td>${x.ubigeo.departamento}</td>
														
														<td>
															<button type='button' data-toggle='modal' onclick="editar('${x.idUsuario}','${x.nombres}','${x.apaterno}','${x.amaterno}','${x.fechaNacimiento}','${x.fechaRegistro}','${x.email}','${x.estado}','${x.celular}','${x.direccion}','${x.dni}','${x.login}','${x.password}','${x.tipousuario.idTipoUsuario}','${x.ubigeo.idUbigeo}');" class='btn btn-success' style='background-color:hsla(233, 100%, 100%, 0);'>
																<img src='images/edit.gif' id='id_update' width='auto' height='auto' />
															</button>
														</td>
														<td>
															<button type='button' data-toggle='modal' onclick="eliminar('${x.idUsuario}');" class='btn btn-success' style='background-color:hsla(233, 100%, 100%, 0);'> 
																<img src='images/delete.gif' width='auto' height='auto' />
															</button>
														</td>
													</tr>
												</c:forEach>
										</tbody>
										</table>	
									
								</div>	
						</div>
					</div>
		 		</form>
		  </div>
  
  	 <div class="modal fade" id="idModalRegistra" >
			<div class="modal-dialog" style="width: 60%">
		
				<!-- Modal content-->
				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Registro de usuario</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_registra" accept-charset="UTF-8" action="registraActualizaCrudUsuario" class="form-horizontal"     method="post">
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos de Usuario</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_nombre">Nombres</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_nombre" name="nombres" placeholder="Ingrese el Nombre" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_paterno">Apellido Paterno</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_paterno" name="apaterno" placeholder="Ingrese el Apellido Paterno" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_materno">Apellido Materno</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_materno" name="amaterno" placeholder="Ingrese el Apellido Materno" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_nacimiento">Fecha Nacimiento</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_nacimiento" name="fechaNacimiento" placeholder="Ingrese la Fecha Nacimiento" type="date"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_registro">Fecha Registro</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_registro" name="fechaRegistro" placeholder="Ingrese la Fecha Registro" type="datetime-local"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_email">EMAIL</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_email" name="email" placeholder="Ingrese el email" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>		   
		                                                                                          <div class="form-group">
				<label class="col-lg-3 control-label" for="id_reg_estado">ESTADO</label>
				 <div class="col-lg-5">
				<select id="id_reg_estado" name="estado" class='form-control'>
					<option value=" ">[Seleccione]</option> 
					<option value="ACTIVO">ACTIVO</option>
					<option value="INACTIVO">INACTIVO</option>
				</select>
				        </div>
		    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_celular">CELULAR</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_celular" name="celular" placeholder="Ingrese el celular" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_direc">Direccion</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_direc" name="direccion" placeholder="Ingrese direccion" type="text" maxlength="20"/>
		                                        </div>
		                                    </div> 
		                                         <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_dni">DNI</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_dni" name="dni" placeholder="Ingrese DNI" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                        <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_login">Login</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_login" name="login" placeholder="Ingrese LOGIN" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                        <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_pass">Password</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_pass" name="password" placeholder="Ingrese Password" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>      
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_tipousuario">Tipo Usuario</label>
		                                        <div class="col-lg-5">
													<select id="id_reg_tipousuario" name="tipousuario.idTipoUsuario" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>    
							                         </select>
		                                        </div>
		                                    </div>
		                                    
		
		                                    <div class="form-group">
												<label class="col-lg-3 control-label" for="id_departamento">DEPARTAMENTO</label>
												<div class="col-lg-5">
													<select id="id_departamento" name="ubigeo.departamento" class='form-control'>
															<option value=" ">[Seleccione Departamento]</option>    
													</select>
		 										 </div> 
		 									</div>
		   	<div class="form-group">
				<label class="col-lg-3 control-label" for="id_provincia">PROVINCIA</label>
				<div class="col-lg-5">
												
				<select id="id_provincia" name="ubigeo.provincia" class='form-control'>
					<option value=" ">[Seleccione Provincia]</option>    
				</select>
		    </div>   
		      </div>
		   <div class="form-group">
				<label class="col-lg-3 control-label" for="id_distrito">DISTRITO</label>
				<div class="col-lg-5">
				<select id="id_distrito" name="ubigeo.idUbigeo" class='form-control'>
					<option value=" ">[Seleccione Distrito]</option>    
				</select>
		    </div>  
		      </div>
		                                    <div class="form-group">
		                                        <div class="col-lg-9 col-lg-offset-3">
		                                        	<button type="submit" class="btn btn-primary">REGISTRA</button>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                        
		                    </div>
		                </form>   
				
				</div>
			</div>
		</div>
			
		</div>
  
		 <div class="modal fade" id="idModalActualiza" >
			<div class="modal-dialog" style="width: 60%">
		
				<!-- Modal content-->
				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Actualiza Usuario</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_actualiza" accept-charset="UTF-8"  action="registraActualizaCrudUsuario" class="form-horizontal"     method="post">
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos de Usuario</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_ID">ID</label>
		                                        <div class="col-lg-5">
		                                           <input class="form-control" id="id_ID" readonly="readonly" name="idUsuario" type="text" maxlength="8"/>
		                                        </div>
		                                     </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_nombre">Nombres</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_nombre" name="nombres" placeholder="Ingrese el Nombre" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_paterno">Apellido Paterno</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_paterno" name="apaterno" placeholder="Ingrese el Apellido Paterno" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_materno">Apellido Materno</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_materno" name="amaterno" placeholder="Ingrese el Apellido Materno" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_nacimiento">Fecha Nacimiento</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_nacimiento" name="fechaNacimiento" placeholder="Ingrese la Fecha Nacimiento" type="date"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_registro">Fecha Registro</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_registro" name="fechaRegistro" placeholder="Ingrese la Fecha Registro" type="date"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_email">EMAIL</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_email" name="email" placeholder="Ingrese el email" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>		   
		                                                                                               <div class="form-group">
				<label class="col-lg-3 control-label" for="id_act_estado">ESTADO</label>
				 <div class="col-lg-5">
				<select id="id_act_estado" name="estado" class='form-control'>
					<option value=" ">[Seleccione]</option> 
					<option value="ACTIVO">ACTIVO</option>
					<option value="INACTIVO">INACTIVO</option>
				</select>
				        </div>
		    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_celular">CELULAR</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_celular" name="celular" placeholder="Ingrese el celular" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_direc">Direccion</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_direc" name="direccion" placeholder="Ingrese direccion" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>   
		                                      <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_dni">DNI</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_dni" name="dni" placeholder="Ingrese DNI" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                        <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_login">Login</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_login" name="login" placeholder="Ingrese LOGIN" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                        <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_pass">Password</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_pass" name="password" placeholder="Ingrese Password" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>         
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_tipousuario">Tipo Usuario</label>
		                                        <div class="col-lg-5">
													<select  id="id_act_tipousuario" name="tipousuario.idTipoUsuario" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>    
							                         </select>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
												<label class="col-lg-3 control-label" for="id_act_departamento">DEPARTAMENTO</label>
												<div class="col-lg-5">
													<select id="id_act_departamento" name="ubigeo.departamento" class='form-control'>
															<option value=" ">[Seleccione Departamento]</option>    
													</select>
		 										 </div> 
		 									</div>
		   	<div class="form-group">
				<label class="col-lg-3 control-label" for="id_act_provincia">PROVINCIA</label>
				<div class="col-lg-5">
												
				<select id="id_act_provincia" name="ubigeo.provincia" class='form-control'>
					<option value=" ">[Seleccione Provincia]</option>    
				</select>
		    </div>   
		      </div>
		   <div class="form-group">
				<label class="col-lg-3 control-label" for="id_act_distrito">DISTRITO</label>
				<div class="col-lg-5">
				<select id="id_act_distrito" name="ubigeo.idUbigeo" class='form-control'>
					<option value=" ">[Seleccione Distrito]</option>    
				</select>
		    </div>  
		      </div>
		                 
		                                    <div class="form-group">
		                                        <div class="col-lg-9 col-lg-offset-3">
		                                        	<button type="submit" class="btn btn-primary">ACTUALIZA</button>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                        </div>

		                </form>   
				
				</div>
			</div>
		</div>
			
		</div>
		
		<div class="modal fade" id="idModalElimina" >
					<div class="modal-dialog" style="width: 60%">
				 	
				 	<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header" style="padding: 35px 50px">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4><span class="glyphicon glyphicon-ok-sign"></span> Eliminar Usuario</h4>
						</div>
				
						  <div class="modal-footer">
						    <button type="button" id="idBtnElimina" name="modalDe" class="btn btn-primary">ELIMINAR</button>
						    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
						  </div>
					</div>
				</div>
				</div>
				
	
	
	
	
</div>





<script type="text/javascript">
$("#success-alert").fadeTo(2000, 500).slideUp(500, function(){
    $("#success-alert").slideUp(500);
});
</script>

<script type="text/javascript">
$.getJSON("cargaTipoUsuario", {}, function(data, q,t){
	console.log(data);
	
	$.each(data, function(index,item){
		$("#id_reg_tipousuario").append("<option value="+item.idTipoUsuario +">"+ item.nombre +"</option>");
		$("#id_act_tipousuario").append("<option value="+item.idTipoUsuario +">"+ item.nombre +"</option>");
	});
	
});
</script>

<script type="text/javascript">
   
	$.getJSON("listaDepartamentos",{},function(data){
		console.log(data);
		$.each(data,function(i, obj){
			$("#id_departamento").append("<option value='" + obj+ "'>"+obj+"</option>");
		});
	});

	$('#id_departamento').change(function() {
		//limpio el combo provincia
		$("#id_provincia").empty();
		$("#id_distrito").empty();
		
		//Se agrega la primera opcion
		$("#id_provincia").append("<option value=' ' >[Seleccione Provincia]</option>");
		$("#id_distrito").append("<option value=' ' >[Seleccione Distrito]</option>");

		
		//agrego las provincias
		var dep = $('#id_departamento').val();
		
		$.getJSON("listaProvincias",{"departamento":dep},function(data){
			$.each(data,function(i, obj){
				$("#id_provincia").append("<option value='" + obj+ "'>"+obj+"</option>");
			
			});
		});
	});
	
	$('#id_provincia').change(function(){
		//limpio el combo provincia
		$("#id_distrito").empty();
		
		//Se agrega la primera opcion
		$("#id_distrito").append("<option value=' ' >[Seleccione Distrito]</option>");
		$("#id_act_distrito").append("<option value=' ' >[Seleccione Distrito]</option>");
		
		//agrego provincia y departamento
		var pro=$('#id_provincia').val();
		var dep = $('#id_departamento').val();
		
		$.getJSON("listaDistritos",{"provincia":pro,"departamento":dep},function(data){
			$.each(data,function(index,obj){
				$("#id_distrito").append("<option value='"+obj.idUbigeo+"'>"+obj.distrito+"</option>")
			});
		});
	});





	

			
</script>

<script type="text/javascript">
   
	$.getJSON("listaDepartamentos",{},function(data){
		console.log(data);
		$.each(data,function(i, obj){
			$("#id_act_departamento").append("<option value='" + obj+ "'>"+obj+"</option>");
		});
	});

	$('#id_act_departamento').change(function() {
		//limpio el combo provincia
		$("#id_act_provincia").empty();
		$("#id_act_distrito").empty();
		
		//Se agrega la primera opcion
	
		$("#id_act_provincia").append("<option value=' ' >[Seleccione Provincia]</option>");
		$("#id_act_distrito").append("<option value=' ' >[Seleccione Distrito]</option>");
		
		
		//agrego las provincias
		var dep = $('#id_act_departamento').val();
		
		$.getJSON("listaProvincias",{"departamento":dep},function(data){
			$.each(data,function(i, obj){
				$("#id_act_provincia").append("<option value='" + obj+ "'>"+obj+"</option>");
			});
		});
	});
	
	$('#id_act_provincia').change(function(){
		//limpio el combo provincia
		$("#id_act_distrito").empty();
		
		//Se agrega la primera opcion
		$("#id_act_distrito").append("<option value=' ' >[Seleccione Distrito]</option>");
		
		//agrego provincia y departamento
		var pro=$('#id_act_provincia').val();
		var dep = $('#id_act_departamento').val();
		
		$.getJSON("listaDistritos",{"provincia":pro,"departamento":dep},function(data){
			$.each(data,function(index,obj){
				$("#id_act_distrito").append("<option value='"+obj.idUbigeo+"'>"+obj.distrito+"</option>")
			});
		});
	});





	

			
</script>



<script type="text/javascript">

$("#idBtnElimina").click(function(){
	$("#idFormElimina").submit();
});


function eliminar(id){	
	$('#idModalElimina').modal('show');
	$('#id_elimina').val(id);	
}

function registrar(){	
	$('#idModalRegistra').modal("show");
}

function editar(id, nombres, apaterno, amaterno, fechaNacimiento, fechaRegistro, email, estado, celular, direccion, dni, login, password, idTipoUsuario, idUbigeo){	
	$('input[id=id_ID]').val(id);
	$('input[id=id_act_nombre]').val(nombres);
	$('input[id=id_act_paterno]').val(apaterno);
	$('input[id=id_act_materno]').val(amaterno);
	$('input[id=id_act_nacimiento]').val(fechaNacimiento);
	$('input[id=id_act_registro]').val(fechaRegistro);
	$('input[id=id_act_email]').val(email);
	$('select[id=id_act_estado]').val(estado);
	$('input[id=id_act_celular]').val(celular);
	$('input[id=id_act_direc]').val(direccion);
	$('input[id=id_act_dni]').val(dni);
	$('input[id=id_act_login]').val(login);
	$('input[id=id_act_pass]').val(password);
	$('select[id=id_act_tipousuario]').val(idTipoUsuario);
	$('select[id=id_act_departamento]').val(idUbigeo);
	$('select[id=id_act_provincia]').val(idUbigeo);
	$('select[id=id_act_distrito]').val(idUbigeo);
	$('#idModalActualiza').modal("show");
}

$(document).ready(function() {
    $('#tablePaginacion').DataTable();
} );
</script>

<script type="text/javascript">
	$('#id_form_registra').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	"nombres": {
        		selector : '#id_reg_nombre',
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
            "apaterno": {
        		selector : '#id_reg_paterno',
                validators: {
                    notEmpty: {
                        message: 'El apellido paterno es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'El apellido paterno es de 3 a 40 caracteres',
                    	min : 3,
                    	max : 40
                    }
                }
            },

            "amaterno": {
        		selector : '#id_reg_materno',
                validators: {
                    notEmpty: {
                        message: 'El apellido materno es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'El apellido materno es de 3 a 40 caracteres',
                    	min : 3,
                    	max : 40
                    }
                }
            },
           
            "fechaNacimiento": {
        		selector : '#id_reg_nacimiento',
                validators: {
                	notEmpty: {
                        message: 'la fecha de nacimiento es un campo obligatorio'
                    }
                }
            },


            "fechaRegistro": {
        		selector : '#id_reg_registro',
                validators: {
                	notEmpty: {
                        message: 'la fecha de registro es un campo obligatorio'
                    }
                }
            },
            "email": {
            	selector : '#id_reg_email',
   			 validators: {

   				 notEmpty: {

   					 message: 'El correo es requerido y no puede ser vacio'

   				 },

   				 emailAddress: {

   					 message: 'El correo electronico no es valido'

   				 }

   			 }

   		 },

   		"estado": {
        	selector : '#id_reg_estado',
			 validators: {

				 notEmpty: {

					 message: 'El correo es requerido y no puede ser vacio'

				 }
		 }
				 },

				 
  


   		 "celular": {
   			selector : '#id_reg_celular',
   			 message: 'El celular no es valido',

   			 validators: {

   				 notEmpty: {

   					 message: 'El celular es requerido y no puede ser vacio'

   				 },

   				 regexp: {

   					 regexp: /^[0-9]+$/,

   					 message: 'El celular solo puede contener números'

   				 }

   			 }

   		 },

   		 "direccion": {
     		selector : '#id_reg_direc',
             validators: {
                 notEmpty: {
                     message: 'La direccion es un campo obligatorio'
                 },
                 stringLength :{
                 	message:'La direccion es de 3 a 40 caracteres',
                 	min : 3,
                 	max : 40
                 }
             }
         },
        
         "dni": {
    			selector : '#id_reg_dni',
    			 message: 'El dni no es valido',

    			 validators: {

    				 notEmpty: {

    					 message: 'El dni es requerido y no puede ser vacio'

    				 },


    			 }

    		 },

    		 "login": {
         		selector : '#id_reg_login',
                 validators: {
                     notEmpty: {
                         message: 'El login es un campo obligatorio'
                     },
                     stringLength :{
                     	message:'El login es de 3 a 40 caracteres',
                     	min : 3,
                     	max : 40
                     }
                 }
             },
             "password": {
         		selector : '#id_reg_pass',
                 validators: {
                     notEmpty: {
                         message: 'El password es un campo obligatorio'
                     },
                     stringLength :{
                     	message:'El password es de 3 a 40 caracteres',
                     	min : 3,
                     	max : 40
                     }
                 }
             },

             "tipousuario.idTipoUsuario": {
         		selector : '#id_reg_tipousuario',
                 validators: {
                 	notEmpty: {
                         message: 'El tipo de usuario un campo obligatorio'
                     }
                 }
             },

            "ubigeo.idUbigeo": {
        		selector : '#id_departamento',
                validators: {
                	notEmpty: {
                        message: 'El departamento es un campo obligatorio'
                    }
                }
            },

            "ubigeo.idUbigeo": {
        		selector : '#id_provincia',
                validators: {
                	notEmpty: {
                        message: 'La provincia es  un campo obligatorio'
                    }
                }
            },


            "ubigeo.idUbigeo": {
        		selector : '#id_distrito',
                validators: {
                	notEmpty: {
                        message: 'El distrito es  un campo obligatorio'
                    },
                }
            },
           
        	
        }   
    });
</script>

<script type="text/javascript">
	$('#id_form_actualiza').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	"nombres": {
        		selector : '#id_act_nombre',
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
            "apaterno": {
        		selector : '#id_act_paterno',
                validators: {
                    notEmpty: {
                        message: 'El apellido paterno es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'El apellido paterno es de 3 a 40 caracteres',
                    	min : 3,
                    	max : 40
                    }
                }
            },

            "amaterno": {
        		selector : '#id_act_materno',
                validators: {
                    notEmpty: {
                        message: 'El apellido materno es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'El apellido materno es de 3 a 40 caracteres',
                    	min : 3,
                    	max : 40
                    }
                }
            },
           
            "fechaNacimiento": {
        		selector : '#id_act_nacimiento',
                validators: {
                	notEmpty: {
                        message: 'la fecha de nacimiento es un campo obligatorio'
                    }
                }
            },


            "fechaRegistro": {
        		selector : '#id_act_registro',
                validators: {
                	notEmpty: {
                        message: 'la fecha de registro es un campo obligatorio'
                    }
                }
            },
            "email": {
            	selector : '#id_act_email',
   			 validators: {

   				 notEmpty: {

   					 message: 'El correo es requerido y no puede ser vacio'

   				 },

   				 emailAddress: {

   					 message: 'El correo electronico no es valido'

   				 }

   			 }

   		 },

   		"estado": {
        	selector : '#id_act_estado',
			 validators: {

				 notEmpty: {

					 message: 'El correo es requerido y no puede ser vacio'

				 }
		 }
				 },

				 
  


   		 "celular": {
   			selector : '#id_act_celular',
   			 message: 'El celular no es valido',

   			 validators: {

   				 notEmpty: {

   					 message: 'El celular es requerido y no puede ser vacio'

   				 },

   				 regexp: {

   					 regexp: /^[0-9]+$/,

   					 message: 'El celular solo puede contener números'

   				 }

   			 }

   		 },

   		 "direccion": {
     		selector : '#id_act_direc',
             validators: {
                 notEmpty: {
                     message: 'La direccion es un campo obligatorio'
                 },
                 stringLength :{
                 	message:'La direccion es de 3 a 40 caracteres',
                 	min : 3,
                 	max : 40
                 }
             }
         },
        
         "dni": {
    			selector : '#id_act_dni',
    			 message: 'El dni no es valido',

    			 validators: {

    				 notEmpty: {

    					 message: 'El dni es requerido y no puede ser vacio'

    				 },


    			 }

    		 },

    		 "login": {
         		selector : '#id_act_login',
                 validators: {
                     notEmpty: {
                         message: 'El login es un campo obligatorio'
                     },
                     stringLength :{
                     	message:'El login es de 3 a 40 caracteres',
                     	min : 3,
                     	max : 40
                     }
                 }
             },
             "password": {
         		selector : '#id_act_pass',
                 validators: {
                     notEmpty: {
                         message: 'El password es un campo obligatorio'
                     },
                     stringLength :{
                     	message:'El password es de 3 a 40 caracteres',
                     	min : 3,
                     	max : 40
                     }
                 }
             },

             "tipousuario.idTipoUsuario": {
         		selector : '#id_act_tipousuario',
                 validators: {
                 	notEmpty: {
                         message: 'El tipo de usuario un campo obligatorio'
                     }
                 }
             },

            "ubigeo.idUbigeo": {
        		selector : '#id_act_departamento',
                validators: {
                	notEmpty: {
                        message: 'El departamento es un campo obligatorio'
                    }
                }
            },

            "ubigeo.idUbigeo": {
        		selector : '#id_act_provincia',
                validators: {
                	notEmpty: {
                        message: 'La provincia es  un campo obligatorio'
                    }
                }
            },


            "ubigeo.idUbigeo": {
        		selector : '#id_act_distrito',
                validators: {
                	notEmpty: {
                        message: 'El distrito es  un campo obligatorio'
                    },
                }
            },
          
        }   
    });
</script>
    
</body>
</html>




