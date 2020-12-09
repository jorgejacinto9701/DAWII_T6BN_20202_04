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


<title>Sistemas - Ricardo Gonzales Alvarez</title>
</head>



<body>

<jsp:include page="intranetCabecera.jsp" />
<div class="container" style="margin-top: 4%">
<h4>PRESTAMO DE LIBRO</h4>


<form id="id_form" accept-charset="UTF-8" action="prestamo" class="form-horizontal" method="post">
			<div class="panel-group" id="steps">
				<div class="panel panel-default">
					<div class="panel-heading">Selección de Usuario</div>
						<div class="panel-body">
							<div class="form-group col-md-3">
								<div class="col-lg-3">								
									<button type="button" id="id_btnCliente" data-toggle='modal' class='btn btn-primary' style="width: 233px">BUSCA USUARIO</button>
									<input type="hidden" name="idCliente" id="id_cliente_id" class="form-control" value="-1"/>
								</div>
							</div> 
							<div class="form-group  col-md-3" >
								<label class="col-lg-3 control-label">Paterno</label>
								<div class="col-lg-8" >
									<input type="text"  id="id_cliente_apellido" class="form-control" readonly="readonly" style="width: 170px" />
								</div>
							</div>
							<div class="form-group col-md-3">
								<label class="col-lg-3 control-label">Materno</label>
								<div class="col-lg-8">
									<input type="text"id="id_cliente_materno"  class="form-control"	readonly="readonly" style="width: 170px" />
								</div>
							</div>							
							<div class="form-group col-md-3">
								<label class="col-lg-3 control-label">Nombre</label>
								<div class="col-lg-8">
									<input type="text"id="id_cliente_nombre"  class="form-control"	readonly="readonly" style="width: 170px"/>
								</div>
							</div>
							<div class="form-group col-md-3">
		                        <label class="col-lg-3 control-label" for="id_prestamo">Prestam</label>
		                        <div class="col-lg-8">
									<input type="date" name="fechaPrestamo" id="id_prestamo" class="form-control" style="width: 170px" />
		                        </div>
		                    </div>
		                    <div class="form-group col-md-3">
		                        <label class="col-lg-3 control-label" for="id_devolucion">Devoluc</label>
		                        <div class="col-lg-8">
									<input class="form-control" id="id_devolucion" name="fechaDevolucion" type="date" style="width: 170px"/>
		                        </div>
		                    </div>
		                    <div class="form-group col-md-3">
		                        <label class="col-lg-3 control-label" for="id_entrega">Entrega</label>
		                        <div class="col-lg-8">
									<input class="form-control" id="id_entrega" name="fechaEntrega" type="date" style="width: 170px"/>
		                        </div>
		                    </div>
		                    <div class="form-group col-md-3">
		                        <label class="col-lg-3 control-label" for="id_registro">Registro</label>
		                        <div class="col-lg-8">
									<input class="form-control" id="id_registro" name="fechaRegistro"  type="datetime-local" style="width: 170px"/>
		                        </div>
		                    </div>
		                   
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">Selección de Libro</div>
						<div class="panel-body">
							<div class="form-group  col-md-3" >
								<div class="col-lg-3">
									<button type="button" id="id_btnProducto" data-toggle='modal' class='btn btn-primary' style="width: 230px">BUSCA LIBRO</button>
									<input type="hidden" name="idProducto" id="id_producto_id" class="form-control" value="-1"/>									
								</div>
							</div>
							<div class="form-group  col-md-3">
								<label class="col-lg-3 control-label">Codigo</label>
								<div class="col-lg-8">
									<input type="text" name="nombreProducto" id="id_libro_codigo" class="form-control" readonly="readonly" style="width: 170px"/>
								</div>
							</div>
							<div class="form-group  col-md-3">
								<label class="col-lg-3 control-label">Titulo</label>
								<div class="col-lg-8">
									<input type="text" name="precio" id="id_libro_titulo" class="form-control" readonly="readonly" style="width: 170px"/>
								</div>
							</div>
							<div class="form-group  col-md-3">
								<label class="col-lg-3 control-label">Estado</label>
								<div class="col-lg-8">
									<input type="text" name="stock" id="id_libro_estado" class="form-control" readonly="readonly" style="width: 170px"/>
								</div>
							</div>							
							
							
						</div>
				</div>
			</div>
			
			
			<div class="panel panel-default">
					<div class="panel-heading">Detalle de Prestamo</div>
						<div class="panel-body">
							<div class="form-group">
								<div class="col-lg-9 col-lg-offset-3">
									<button type="button" id="id_btnAgregar" class="btn btn-primary" style="width: 170px">AGREGA LIBRO</button>
									<button type="button" id="id_btnRegistrar"  class="btn btn-primary" style="width: 170px">REGISTRA PRESTAMO</button>
								</div>
							</div>
							<div class="form-group">
								<div class="col-lg-12">
									<table id="id_table_boleta" class="table table-striped table-bordered">
										<thead>
											<tr>
												<th style="width: 5%">Código</th>
												<th style="width: 30%">Titulo</th>
												<th style="width: 15%">Prestamo</th>
												<th style="width: 15%">Devolucion</th>
												<th style="width: 15%">Entrega</th>
												<th style="width: 15%">Registro</th>												
												<th style="width: 5%"></th>
												
											</tr>
										</thead>
										<tbody id="id_table_boleta_body">
												
										</tbody>
										
									</table>
								</div>
							</div>
					</div>
				</div>


<!-- El formulario de busqueda de Cliente (Modal) -->

  	 <div class="modal fade" id="idBuscaCliente" >
			<div class="modal-dialog" style="width: 60%">

				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Busqueda de Usuario</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						    <div class="panel-group" id="steps">
		                        <div class="panel panel-default">
											<div class="form-group">
													<label class="col-lg-3 control-label">
														Usuario 
													</label>   
													<div class="col-lg-5">
														<input id="id_txtCliente" class="form-control" name="cliente" type="text" />
													</div>
											</div>
											<div class="form-group">
												<div class="col-lg-12">
												<table id="id_table_cliente" class="table table-striped table-bordered">
														<thead>
															<tr>
																<th style="width: 5%">Id</th>
																<th style="width: 45%">Nombre</th>
																<th style="width: 35%">Paterno</th>
																<th style="width: 35%">Materno</th>
																<th style="width: 10%"></th>
															</tr>
														</thead>
														<tbody>

														</tbody>				
												</table>
												</div>
											</div>
			                        </div>
		                    </div>
					</div>
			</div>
			</div>
		</div>

<!-- El formulario de busqueda de Producto (Modal) -->

  	 <div class="modal fade" id="idBuscaProducto" >
			<div class="modal-dialog" style="width: 60%">

				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Busqueda de Libro</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						    <div class="panel-group" id="steps">
		                        <div class="panel panel-default">
											<div class="form-group">
													<label class="col-lg-3 control-label">
														Libro 
													</label>   
													<div class="col-lg-5">
														<input id="id_txtProducto" class="form-control" name="producto" type="text" />
													</div>
											</div>
											<div class="form-group">
												<div class="col-lg-12">
												<table id="id_table_producto" class="table table-striped table-bordered" >
														<thead>
															<tr>
																<th style="width: 5%">Id</th>
																<th style="width: 15%">Codigo</th>
																<th style="width: 30%">Titulo</th>
																<th style="width: 15%">Estado</th>
																<th style="width: 15%">Tipo</th>																
																<th style="width: 10%"></th>
															</tr>
														</thead>
														<tbody>

														</tbody>				
												</table>
												</div>
											</div>
		                        </div>
		                    </div>
				</div>
			</div>
			</div>
		</div>
		
		
	<!-- Modal Mensaje -->	
		  <div class="modal fade" id="idMensaje" >
			<div class="modal-dialog" style="width: 60%">

				<div class="modal-content">
				<div class="modal-header" style="padding: 30px 30px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Mensaje</h4>
				</div>
				<div  id="idMensajeTexto" class="modal-body" style="padding: 30px 30px;align-content: center;">
					
			    </div>
			</div>
			</div>
		</div>
		
</form>
</div>
<script type="text/javascript">

$(document).ready(function() {

	//Se añade los clientes a la tabla
	$.getJSON("listaSeleccion",{}, function (data){
		$.each(data, function(index, item){
			$('#id_table_boleta_body').append("<tr><td>" +item.idLibro +"</td><td>" +item.titulo + "</td><td>" + item.fechaPrestamo+ "</td><td>" +item.fechaDevolucion +"</td><td>"+item.fechaEntrega +"</td><td>"+item.fechaRegistro +"</td><td></td><td><button type='button' onclick='f_elimina_seleccion(" + item.idLibro +");' class='btn btn-default' aria-label='Left Align' ><span class='glyphicon glyphicon-remove' aria-hidden='true'></span></button></td></tr>");                     
		});
	});
	
});

//Al pulsar el botón cliente
$("#id_btnCliente").click(function (){
	muestraCliente();
	$("#idBuscaCliente").modal("show");
});

//Al pulsar el botón producto
$("#id_btnProducto").click(function (){
	muestraProducto();
	$("#idBuscaProducto").modal("show");
});

//Al escribir en la caja de texto del Usuario
$("#id_txtCliente").keyup( function (e){
	muestraCliente();
});

//Al escribir en la caja de texto del Libro
$("#id_txtProducto").keyup( function (e){
	muestraProducto();
});

//Se anula el enter
$(document).on("keypress", "form", function(event) { 
    return event.keyCode != 13;
});
////////////////////////////////////////////////////////////////////////////////////
//Al pulsar el botón agregar
	$("#id_btnAgregar").click(function (){
		var var_pro = $("#id_producto_id").val();
		var var_pre = document.getElementById('id_prestamo').value;	
		var var_dev= document.getElementById('id_devolucion').value;
		var var_ent= document.getElementById('id_entrega').value;
		var var_reg= document.getElementById('id_registro').value
		//var var_est = $("#id_estado").val();
		//var var_est= document.getElementById('id_estado').value
		
		//Validar duplicados
		var yaExiste = false;
		$("#id_table_boleta_body tr").each(function() {
			if($(this).find('td:eq(0)').html() == var_pro){
				yaExiste = true;
			}
		});
		
		if ( var_pro == '-1' ){
			$("#idMensajeTexto").text("Seleccione un Libro");
			$("#idMensaje").modal("show");
		}else if ( var_pre == '' ){
			$("#idMensajeTexto").text("Agrege una Fecha de Prestamo");
			$("#idMensaje").modal("show");
		}else if ( var_dev == '' ){
			$("#idMensajeTexto").text("Agrege una Fecha de Devolucion");
			$("#idMensaje").modal("show");
		}else if ( var_dev == '' ){
			$("#idMensajeTexto").text("Agrege una Fecha de Entrega");
			$("#idMensaje").modal("show");	
		}else if ( var_reg == '' ){
			$("#idMensajeTexto").text("Agrege una Fecha de Registro y hora");
			$("#idMensaje").modal("show");
		}else if (yaExiste){			
			$("#idMensajeTexto").text("Existe el Libro elegido");
			$("#idMensaje").modal("show");
		}else{			
			
			var var_tit = $("#id_libro_titulo").val();						
			
					
			//limpiar la tabla
			$("#id_table_boleta_body").empty();
				
			var jsonParam = {"idLibro":var_pro,"titulo":var_tit,"fechaPrestamo":var_pre,"fechaDevolucion":var_dev,"fechaEntrega":var_ent,"fechaRegistro":var_reg};
			
			$.ajax({
				url:  'agregarSeleccion',
				type: 'POST',
				dataType:'json',
				data: jsonParam,
				success:function(data){
					console.log(data);
					if(data != null){
						$.each(data, function(index, item){
							$('#id_table_boleta_body').append("<tr><td>" +item.idLibro + "</td><td>" +item.titulo + "</td><td>" + item.fechaPrestamo + "</td><td>" + item.fechaDevolucion + "</td><td>" + item.fechaEntrega + "</td><td>"+ item.fechaRegistro+ "</td><td></td><td><button type='button' onclick='f_elimina_seleccion(" + item.idLibro +");' class='btn btn-default' aria-label='Left Align' ><span class='glyphicon glyphicon-remove' aria-hidden='true'></span></button></td></tr>");
						});
						
					}else
						swal("Error al agregar la selección del Libros","","error");
						return false;
					},
				error: function (jqXhr) { 
					swal("Error en la conexión","","error");
				}
		   });				   
				
			//limpia las cajas de texto
			$("#id_producto_id").val("-1");
			$("#id_libro_codigo").val("");
			$("#id_libro_titulo").val("");
			$("#id_libro_estado").val("");			
		
		}
	});

	//Al pulsar el botón Rgistar
	$("#id_btnRegistrar").click(function (){
		var var_cli = $("#id_cliente_id").val();
		var var_ape = $("#id_cliente_apellido").val();
		var var_mat = $("#id_cliente_materno").val();
		var var_nom = $("#id_cliente_nombre").val();
		var var_nom_com =  var_nom + ' ' + var_ape + ' ' + var_mat;
		
		var var_count = 0;
		$("#id_table_boleta_body tr").each(function() {
			var_count = var_count + 1;
		});
		
		if (var_cli == "-1"){
			$("#idMensajeTexto").text("Seleccione un Usuario");
			$("#idMensaje").modal("show");
		}else if (var_count < 1){
			$("#idMensajeTexto").text("Seleccione un Libro");
			$("#idMensaje").modal("show");
		}else{

			var jsonParam = {"idUsuario":var_cli,"nombre":var_nom_com};

			$.ajax({
				url:  'registraPrestamo',
				type: 'POST',
				dataType:'json',
				data: jsonParam,
				success:function(data){
					if(data.texto != "-1"){
						console.log(data.texto);
						$("#idMensajeTexto").html(data.texto);
						$("#idMensaje").modal("show");
						$("#id_table_boleta_body").empty();
						$("#id_cliente_id").val("-1");
						$("#id_cliente_nombre").val("");
						$("#id_cliente_apellido").val("");
						$("#id_cliente_materno").val("");
						$("#id_prestamo").val("");
						$("#id_devolucion").val("");
						$("#id_entrega").val("");
						$("#id_registro").val("");
						//$("#id_estado").val("");
					}else
						swal("Error al agregar el Prestamo","","error");
						return false;
					},
				error: function (jqXhr) { 
					swal("Error en la conexión","","error");
				}
		   });	
			   
		}
	});

	function muestraCliente(){
		var var_cliente = $("#id_txtCliente").val();

		//limpiar la tabla
		$("#id_table_cliente tbody").empty();
		
		//Se añade los clientes a la tabla
		$.getJSON("cargaUsuarios",{"filtro":var_cliente}, function (data){
			$.each(data, function(index, item){
				$('#id_table_cliente').append("<tr><td>" +item.idUsuario + "</td><td>" +item.nombres + "</td><td>" +item.apaterno + "</td><td>" +item.amaterno +"</td><td><button type='button' class='btn btn-default' aria-label='Left Align' onclick=\"f_seleccione_cliente('"+ item.idUsuario+"','"+ item.nombres+"','"+ item.apaterno+"','"+ item.amaterno+"');\" ><span class='glyphicon glyphicon-ok' aria-hidden='true'></span></button></td></tr>");
			});
		});
	}

	function muestraProducto(){
		var var_producto = $("#id_txtProducto").val();

		//limpiar la tabla
		$("#id_table_producto tbody").empty();
		
		//Se añade los libros a la tabla
		$.getJSON("cargaLibros",{"filtro":var_producto}, function (data){
			$.each(data, function(index, item){
				$('#id_table_producto').append("<tr><td>" +item.idLibro + "</td><td>" +item.codigo + "</td><td>" +item.titulo + "</td><td>" +item.estado + "</td><td>" +item.tipo + "</td><td><button type='button' class='btn btn-default' aria-label='Left Align' onclick=\"f_seleccione_producto('"+ item.idLibro+"','"+ item.codigo+"','"+ item.titulo+"','"+ item.estado+"','"+ item.tipo+"');\" ><span class='glyphicon glyphicon-ok' aria-hidden='true'></span></button></td></tr>");
			});
		});
	}

	//Al pulsar selecciona cliente
	function f_seleccione_cliente(id,nombre,apellido,materno){
		$("#id_cliente_id").val(id);
		$("#id_cliente_nombre").val(nombre);
		$("#id_cliente_apellido").val(apellido);
		$("#id_cliente_materno").val(materno);
		$("#idBuscaCliente").modal("hide");
	}
	
	//Al pulsar selecciona producto
	function f_seleccione_producto(id,codigo,titulo,estado){
		$("#id_producto_id").val(id);
		$("#id_libro_codigo").val(codigo);
		$("#id_libro_titulo").val(titulo);	
		$("#id_libro_estado").val(estado);
		$("#idBuscaProducto").modal("hide");
	}

	//Al pulsar el botón eliminar
	function f_elimina_seleccion(id){	
		//limpiar la tabla
		$("#id_table_boleta_body").empty();			
		//Se añade los clientes a la tabla
		$.getJSON("eliminaSeleccion",{"idLibro":id}, function (data){
			$.each(data, function(index, item){
				$('#id_table_boleta_body').append("<tr><td>" +item.idLibro + "</td><td>" +item.titulo + "</td><td>" + item.fechaPrestamo + "</td><td>" +item.fechaDevolucion + "</td><td>" +item.fechaEntrega + "</td><td>" +item.fechaRegistro +"</td><td><button type='button' onclick='f_elimina_seleccion(" + item.idLibro +");' class='btn btn-default' aria-label='Left Align' ><span class='glyphicon glyphicon-remove' aria-hidden='true'></span></button></td><tr>");
			});
		});
	}
	

///////////////////////////////////////////////////////////////////////////////////






</script>
</body>
</html>



