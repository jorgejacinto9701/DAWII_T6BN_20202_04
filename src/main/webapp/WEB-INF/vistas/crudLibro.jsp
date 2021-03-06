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
<h3>Mantenimiento Libro</h3>

	<div class="col-md-23" >  
			  <form id="idFormElimina" action="eliminaCrudLibro">
			  		<input type="hidden" id="id_elimina" name="id">
			  </form>	
				
		       <form accept-charset="UTF-8"  action="consultaCrudLibro" class="simple_form" id="defaultForm2"  method="post">

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
												<th>Codigo</th>
												<th>Titulo</th>
												<th>Estado</th>
												<th>Tipo</th>									
												<th>TipoLibro</th>
												<th>Actualiza</th>
												<th>Elimina</th>
											</tr>
										</thead>
										<tbody>
												   
												<c:forEach items="${sessionScope.libros}" var="x">
													<tr>
														<td>${x.idLibro}</td>
														<td>${x.codigo}</td>
														<td>${x.titulo}</td>
														<td>${x.estado}</td>
														<td>${x.tipo}</td>														
														<td>${x.tipoLibro.nombre}</td>
														<td>
															<button type='button' data-toggle='modal' onclick="editar('${x.idLibro}','${x.codigo}','${x.titulo}','${x.estado}','${x.tipo}','${x.tipoLibro.idTipoLibro}');" class='btn btn-success' style='background-color:hsla(233, 100%, 100%, 0);'>
																<img src='images/edit.gif' id='id_update' width='auto' height='auto' />
															</button>
														</td>
														<td>
															<button type='button' data-toggle='modal' onclick="eliminar('${x.idLibro}');" class='btn btn-success' style='background-color:hsla(233, 100%, 100%, 0);'> 
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
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Registro de Libro</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_registra" accept-charset="UTF-8" action="registraActualizaCrudLibro" class="form-horizontal"     method="post">
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos de Libro</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_codigo">Codigo</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_codigo" name="codigo" placeholder="Ingrese el Codigo" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_titulo">Titulo</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_titulo" name="titulo" placeholder="Ingrese el titulo" type="text" maxlength="50"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_estado">Estado</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_estado" name="estado" placeholder="Ingrese el estado" type="text" maxlength="9"/>
		                                        </div>
		                                    </div>		   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_tipo">Tipo</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_tipo" name="tipo" placeholder="Ingrese el tipo" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>  		                                       
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_tipoLibro">TipoLibro</label>
		                                        <div class="col-lg-5">
													<select id="id_reg_tipoLibro" name="tipoLibro.idTipoLibro" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>    
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
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Actualiza Editorial</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_actualiza" accept-charset="UTF-8"  action="registraActualizaCrudLibro" class="form-horizontal"     method="post">
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos de Libro</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_ID">ID</label>
		                                        <div class="col-lg-5">
		                                           <input class="form-control" id="id_ID" readonly="readonly" name="idLibro" type="text" maxlength="8"/>
		                                        </div>
		                                     </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_codigo">Codigo</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_codigo" name="codigo" placeholder="Ingrese el codigo" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_titulo">Titulo</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_titulo" name="titulo" placeholder="Ingrese el Titulo" type="text" maxlength="50"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_estado">Estado</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_estado" name="estado" placeholder="Ingrese el estado" type="text" maxlength="9"/>
		                                        </div>
		                                    </div>		   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_tipo">Tipo</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_tipo" name="tipo" placeholder="Ingrese el Tipo" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>   		                                     
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_tipoLibro">TipoLibro</label>
		                                        <div class="col-lg-5">
													<select id="id_act_tipoLibro" name="tipoLibro.idTipoLibro" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>    
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
							<h4><span class="glyphicon glyphicon-ok-sign"></span> Eliminar Libro</h4>
						</div>
				
						  <div class="modal-footer">
						    <button type="button" id="idBtnElimina" name="modalDe" class="btn btn-primary">ELIMINAR</button>
						    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
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
$.getJSON("cargaTipoLibro", {}, function(data, q,t){
	console.log(data);
	
	$.each(data, function(index,item){
		$("#id_reg_tipoLibro").append("<option value="+item.idTipoLibro +">"+ item.nombre +"</option>");
		$("#id_act_tipoLibro").append("<option value="+item.idTipoLibro +">"+ item.nombre +"</option>");
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

function editar(id,codigo,titulo,estado,tipo, idTipoLibro){	
	$('input[id=id_ID]').val(id);
	$('input[id=id_act_codigo]').val(codigo);
	$('input[id=id_act_titulo]').val(titulo);
	$('input[id=id_act_estado]').val(estado);
	$('input[id=id_act_tipo]').val(tipo);	
	$('select[id=id_act_tipoLibro]').val(idTipoLibro);
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
        	"titulo": {
        		selector : '#id_reg_titulo',
                validators: {
                    notEmpty: {
                        message: 'El titulo es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'El titulo es de 5 a 100 caracteres',
                    	min : 5,
                    	max : 100
                    }
                }
            },
            "estado": {
         		selector : '#id_reg_estado',
                 validators: {
                     notEmpty: {
                         message: 'El estado es un campo obligatorio'
                     },
                     stringLength :{
                     	message:'El estado es ACTIVO o INACTIVO',
                     	min : 3,
                     	max : 40
                     }
                 }
             },
            "codigo": {
       			selector : '#id_reg_codigo',
       			 message: 'El codigo no es valido',

       			 validators: {

       				 notEmpty: {

       					 message: 'El Telefono es requerido y no puede ser vacio'

       				 },

       				 regexp: {

       					 regexp: /^[0-9]+$/,

       					 message: 'El codigo solo puede contener n�meros'

       				 }

       			 }

       		 },
       	  "tipo": {
          	selector : '#id_reg_tipo',
 			 validators: {

 				 notEmpty: {

 					 message: 'El tipo es requerido y no puede ser vacio'

 				 },

 			 }

 		 },
           
            "tipoLibro.idTipoLibro": {
        		selector : '#id_reg_tipoLibro',
                validators: {
                	notEmpty: {
                        message: 'El tipoLibro es un campo obligatorio'
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
        	"titulo": {
        		selector : '#id_reg_titulo',
                validators: {
                    notEmpty: {
                        message: 'El titulo es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'El titulo es de 5 a 100 caracteres',
                    	min : 5,
                    	max : 100
                    }
                }
            },
            "estado": {
         		selector : '#id_reg_estado',
                 validators: {
                     notEmpty: {
                         message: 'El estado es un campo obligatorio'
                     },
                     stringLength :{
                     	message:'El estado es ACTIVO o INACTIVO',
                     	min : 3,
                     	max : 40
                     }
                 }
             },
            "codigo": {
       			selector : '#id_reg_codigo',
       			 message: 'El codigo no es valido',

       			 validators: {

       				 notEmpty: {

       					 message: 'El Telefono es requerido y no puede ser vacio'

       				 },

       				 regexp: {

       					 regexp: /^[0-9]+$/,

       					 message: 'El codigo solo puede contener n�meros'

       				 }

       			 }

       		 },
       	  "tipo": {
          	selector : '#id_reg_tipo',
 			 validators: {

 				 notEmpty: {

 					 message: 'El tipo es requerido y no puede ser vacio'

 				 },

 			 }

 		 },
           
            "tipoLibro.idTipoLibro": {
        		selector : '#id_reg_tipoLibro',
                validators: {
                	notEmpty: {
                        message: 'El tipoLibro es un campo obligatorio'
                    },
                }
            },
        	
        }  
    });
</script>
	
	
</div>
</body>
</html>




