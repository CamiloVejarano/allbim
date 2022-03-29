<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="visualizar-modelo.aspx.cs" Inherits="allbim.vistas.visualizar_modelo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>View Models - Autodesk Forge</title>
    <meta charset="utf-8" />
    <link rel="shortcut icon" href="./../img/cropped-Favicon-TDC-32x32.png" />
    <!-- Common packages: jQuery, Bootstrap, jsTree -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jstree/3.3.7/jstree.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.4.1/css/bootstrap.min.css" />
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/jstree/3.3.7/themes/default/style.min.css" />
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.css" />
    <script src="//cdnjs.cloudflare.com/ajax/libs/clipboard.js/1.7.1/clipboard.min.js"></script>
    <!-- Autodesk Forge Viewer files -->
    <link rel="stylesheet" href="https://developer.api.autodesk.com/modelderivative/v2/viewers/7.*/style.min.css"
        type="text/css" />
    <script src="https://developer.api.autodesk.com/modelderivative/v2/viewers/7.*/viewer3D.min.js"></script>
    <!-- this project files -->
    <link href="./../css/main.css" rel="stylesheet" />
    <script src="./../js/ForgeTree.js"></script>
    <script src="./../js/ForgeViewer.js"></script>
    <!-- dashboard files -->
    <script src="./../js/Dashboard/Dashboard.js"></script>
    <script src="./../js/Dashboard/DashboardPanel.js"></script>
    <script src="./../js/Dashboard/PanelBarChart.js"></script>
    <script src="./../js/Dashboard/PanelPieChart.js"></script>
    <!-- 2D Viewer extension (NestedViewer) -->
    <link rel="stylesheet" href="//cdn.jsdelivr.net/gh/autodesk-forge/forge-extensions/public/extensions/NestedViewerExtension/contents/main.css" />
    <script src="//cdn.jsdelivr.net/gh/autodesk-forge/forge-extensions/public/extensions/NestedViewerExtension/contents/main.js"></script>
</head>
<body>
    <!-- Fixed navbar by Bootstrap: https://getbootstrap.com/examples/navbar-fixed-top/ -->
    <nav class="navbar navbar-default navbar-fixed-top basura">
        <div class="container-fluid">
            <ul class="nav navbar-nav left flex">
                <li>
                    <a href="http://forge.autodesk.com" target="_blank">
                        <img alt="Autodesk Forge" src="./../img/logo-allbim-azul.jpg" height="50" width="100" />
                    </a>
                </li>
                <li class="r">
                    <label>Visualización</label>
                    <label>Hola Juan</label>
                </li>
            </ul>
        </div>
    </nav>
    <!-- End of navbar -->
    <div class="container-fluid fill">
        <div class="row fill">
            <div class="col-sm-4 fill">
                <div class="panel panel-default fill">
                    <div class="panel-heading" data-toggle="tooltip">
                        <%--Buckets &amp; Objects--%>
                        Depósito &amp; objetos
                        <span id="refreshBuckets" class="glyphicon glyphicon-refresh" style="cursor: pointer"></span>
                        <button class="btn btn-xs btn-info" style="float: right" id="showFormCreateBucket" data-toggle="modal" data-target="#createBucketModal">
                            <span class="glyphicon glyphicon-folder-close"></span>
                            <%--New bucket--%>
                            Nuevo depósito
                        </button>
                    </div>
                    <div id="appBuckets">
                        tree here
                    </div>
                </div>
            </div>
            <div class="col-sm-8 fill">
                <div id="forgeViewer"></div>
            </div>
        </div>
    </div>
    <form id="uploadFile" method='post' enctype="multipart/form-data">
        <input id="hiddenUploadField" type="file" name="theFile" style="visibility: hidden" />
    </form>
    <!-- Modal Create Bucket -->
    <div class="modal fade" id="createBucketModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Cancel">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel"><%--Create new bucket--%>Crear nuevo depósito</h4>
                </div>
                <div class="modal-body">
                    <input type="text" id="newBucketKey" class="form-control" />
                    <%--For demonstration purposes, objects (files)
                    are NOT automatically translated. After you upload, right click on
                    the object and select "Translate". Note: Technically your bucket name is required to be globally unique across
                    the entire platform - to keep things simple with this tutorial your client ID will be prepended by default to
                    your bucket name and in turn masked by the UI so you only have to make sure your bucket name is unique within
                    your current Forge app.--%>
                    Para fines de demostración, los objetos (archivos) NO se traducen automáticamente. Después de cargar, haga clic
                    con el botón derecho en el objeto y seleccione "Traducir". Nota: Técnicamente, se requiere que el nombre de su
                    depósito sea globalmente único en toda la plataforma; para simplificar las cosas con este tutorial, su ID de cliente se
                    antepondrá de forma predeterminada al nombre de su depósito y, a su vez, se enmascarará por la interfaz de usuario, por
                    lo que solo tiene que asegurarse el nombre de su depósito es único dentro de su aplicación Forge actual.
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">
                        <%--Cancel--%>
                        Cancelar</button>
                    <button type="button" class="btn btn-primary" id="createNewBucket">
                        <%--Go ahead, create the bucket--%>
                        Adelante, crea el depósito</button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
