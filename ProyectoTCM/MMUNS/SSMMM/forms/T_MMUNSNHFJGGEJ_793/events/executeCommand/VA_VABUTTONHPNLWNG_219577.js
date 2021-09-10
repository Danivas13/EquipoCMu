

//Entity: JNEntidad
//JNEntidad. (Button) View: EstudianteJNForm
//Evento ExecuteCommand: Permite personalizar la acción a ejecutar de un command o de un ActionControl.
task.executeCommand.VA_VABUTTONHPNLWNG_219577 = function(  entities, executeCommandEventArgs ) {

    executeCommandEventArgs.commons.execServer = true;
    console.log(entities.JNEntidad.nombre+" "+entities.JNEntidad.apellido);
     executeCommandEventArgs.commons.messageHandler.showMessagesInformation("El nombre completo es: "+entities.JNEntidad.nombre+" "+entities.JNEntidad.apellido);

};