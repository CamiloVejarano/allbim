var viewer;

function launchViewer(urn, viewableId) {
    var options = {
        env: 'AutodeskProduction',
        getAccessToken: getForgeToken,
        api: 'derivativeV2' + (atob(urn.replace('_', '/')).indexOf('emea') > -1 ? '_EU' : '') // handle BIM 360 US and EU regions
    };

    Autodesk.Viewing.Initializer(options, () => {
        //* Una sola extencion
        //viewer = new Autodesk.Viewing.GuiViewer3D(document.getElementById('forgeViewer'), { extensions: ['MyAwesomeExtension'] });

        //* se agregan extenciones con la coma ,
        /*viewer = new Autodesk.Viewing.GuiViewer3D(document.getElementById('forgeViewer'), { extensions: ['MyAwesomeExtension', 'HandleSelectionExtension', 'ModelSummaryExtension', 'otroboton'] });*/

        const config = {
            extensions: ['Autodesk.VisualClusters', 'Autodesk.DocumentBrowser']
        };

        viewer = new Autodesk.Viewing.GuiViewer3D(document.getElementById('forgeViewer'), config);
        viewer.start();
        var documentId = 'urn:' + urn;
        Autodesk.Viewing.Document.load(documentId, onDocumentLoadSuccess, onDocumentLoadFailure);

        // smooth navigation...
        viewer.autocam.shotParams.destinationPercent = 3;
        viewer.autocam.shotParams.duration = 3;
    });

    function onDocumentLoadSuccess(doc) {
        // if a viewableId was specified, load that view, otherwise the default view
        var viewables = (viewableId ? doc.getRoot().findByGuid(viewableId) : doc.getRoot().getDefaultGeometry());
        viewer.loadDocumentNode(doc, viewables).then(i => {
            // any additional action here?
            viewer.loadExtension("NestedViewerExtension", { filter: ["2d"], crossSelection: true })
        });

    }

    function onDocumentLoadFailure(viewerErrorCode) {
        console.error('onDocumentLoadFailure() - errorCode:' + viewerErrorCode);
    }
}

function getForgeToken(callback) {
    fetch('/api/forge/oauth/token').then(res => {
        res.json().then(data => {
            callback(data.access_token, data.expires_in);
        });
    });
}
