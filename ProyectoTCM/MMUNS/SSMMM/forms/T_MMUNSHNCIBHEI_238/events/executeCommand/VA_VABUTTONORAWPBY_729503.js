

//Entity: JPMCEntidad
//JPMCEntidad. (Button) View: EstudianteJPMCForm
//Evento ExecuteCommand: Permite personalizar la acción a ejecutar de un command o de un ActionControl.
task.executeCommand.VA_VABUTTONORAWPBY_729503 = function(  entities, executeCommandEventArgs ) {

    executeCommandEventArgs.commons.execServer = true;
    //executeCommandEventArgs.commons.serverParameters.JPMCEntidad = true;
    console.log(entities.JPMCEntidad.nombre+" "+entities.JPMCEntidad.apellido);

};