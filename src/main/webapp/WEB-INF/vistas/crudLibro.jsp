<jsp:include page="intranetValida.jsp" />
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>
<link rel="stylesheet" href="css/prueba.css"/>
<title>Ejemplos de CIBERTEC - Jorge Jacinto </title>
</head>
<body>

<jsp:include page="intranetCabecera.jsp" />
<div class="container" style="margin-top: 4%">
<h3>Mantenimiento Libro</h3>
	
	
</div>
<div id="hellobar-bar" class="regular closable">
    <div class="hb-content-wrapper">
        <div class="hb-text-wrapper">
            <div class="hb-headline-text">
                <p><span>Regístrate ya en programacion.net y accederas a multitud de tutoriales gratuitos</span></p>
            </div>
        </div>
        <a href="http://www.programacion.net" target="_blank" class="hb-cta hb-cta-button">
            <div class="hb-text-holder">
                <p>Regístrate</p>
            </div>
        </a>
    </div>
    <div class="hb-close-wrapper">
        <a href="javascript:void(0);" class="icon-close">✖</a>
    </div>
    <a href="javascript:void(0);" class="icon-close" onclick="$('#hellobar-bar').fadeOut()">✖</a>
</div>
</body>
</html>




