

//Entity: DJVGEntidad
//DJVGEntidad. (Button) View: EstudianteDJVGForm
//Evento ExecuteCommand: Permite personalizar la acción a ejecutar de un command o de un ActionControl.
task.executeCommand.VA_VABUTTONQAPMYMB_846243 = function(  entities, executeCommandEventArgs ) {

    executeCommandEventArgs.commons.execServer = true;
    //executeCommandEventArgs.commons.serverParameters.DJVGEntidad = true;
    //Imprimir nombre y apellido
    console.log("Nombre completo: "+entities.DJVGEntidad.nombre+" "+entities.DJVGEntidad.apellido);
     executeCommandEventArgs.commons.messageHandler.showMessagesInformation("El nombre completo es: "+entities.DJVGEntidad.nombre+" "+entities.DJVGEntidad.apellido);
};