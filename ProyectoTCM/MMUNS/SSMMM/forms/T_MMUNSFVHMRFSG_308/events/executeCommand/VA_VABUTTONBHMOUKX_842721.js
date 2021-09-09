

//Entity: BDDLEntidad
//BDDLEntidad. (Button) View: EstudianteBDDLForm
//Evento ExecuteCommand: Permite personalizar la acción a ejecutar de un command o de un ActionControl.
task.executeCommand.VA_VABUTTONBHMOUKX_842721 = function(  entities, executeCommandEventArgs ) {

    executeCommandEventArgs.commons.execServer = true;
    //executeCommandEventArgs.commons.serverParameters.BDDLEntidad = true;
    executeCommandEventArgs.commons.messageHandler.showMessagesInformation("Nombre completo desde el cliente: "+entities.BDDLEntidad.nombre+" "+entities.BDDLEntidad.apellido);
};