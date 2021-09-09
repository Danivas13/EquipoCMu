/*
 * Archivo: VA_VABUTTONGIKEXBR_121382.java
 *
 * Esta aplicacion es parte de los paquetes bancarios propiedad de COBISCORP.
 * Su uso no autorizado queda expresamente prohibido asi como cualquier
 * alteracion o agregado hecho por alguno de sus usuarios sin el debido
 * consentimiento por escrito de COBISCORP.
 * Este programa esta protegido por la ley de derechos de autor y por las
 * convenciones internacionales de propiedad intelectual. Su uso no
 * autorizado dara derecho a COBISCORP para obtener ordenes de secuestro
 * o retencion y para perseguir penalmente a los autores de cualquier infraccion.
 */

package com.cobiscorp.cobis.mmuns.customevents.impl.view.executecommand;

import org.apache.felix.scr.annotations.Component;
import org.apache.felix.scr.annotations.Properties;
import org.apache.felix.scr.annotations.Property;
import org.apache.felix.scr.annotations.Service;
import com.cobiscorp.cobis.commons.domains.log.ILogger;
import com.cobiscorp.cobis.commons.log.LogFactory;
import com.cobiscorp.cobis.mmuns.model.EBSMEntidad;
import com.cobiscorp.designer.api.DataEntity;
import com.cobiscorp.designer.api.DynamicRequest;
import com.cobiscorp.designer.api.customization.IExecuteCommand;
import com.cobiscorp.designer.api.customization.arguments.IExecuteCommandEventArgs;
import com.cobiscorp.designer.api.managers.DesignerManagerException;

@Component
@Service({ IExecuteCommand.class })
@Properties(value={
		@Property(name = "view.id", value = "VW_ESTUDIANMM_382"),
		@Property(name = "view.version", value = "1.0.0"),
		@Property(name = "view.controlId", value = "VA_VABUTTONGIKEXBR_121382")})

public class VA_VABUTTONGIKEXBR_121382 implements IExecuteCommand {
	/**
	 * Instancia de Logger
	 */
	private static final ILogger logger = LogFactory.getLogger(VA_VABUTTONGIKEXBR_121382.class);

	@Override
	public void executeCommand(DynamicRequest esbmEntities, IExecuteCommandEventArgs arg1) {
		// TODO Auto-generated method stub
		try {
			if (logger.isDebugEnabled()) {
				logger.logDebug("Start executeCommand in VA_VABUTTONGIKEXBR_121382");
				logger.logDebug("Informacion EstudianteESBM");
			}
			
			DataEntity dataEntityESBM = esbmEntities.getEntity(EBSMEntidad.ENTITY_NAME);
			String nombre = dataEntityESBM.get(EBSMEntidad.NOMBRE);
			String apellido = dataEntityESBM.get(EBSMEntidad.APELLIDO);
			String edad = dataEntityESBM.get(EBSMEntidad.EDAD);
			String sexo = dataEntityESBM.get(EBSMEntidad.SEXO);
			
			String nombreCompleto = nombre + ' ' + apellido;
			logger.logDebug("nombre: " +nombre);
			logger.logDebug("apellido: "+apellido);
			logger.logDebug("NombreCompleto: "+ nombreCompleto);
			logger.logDebug("Edad: "+ edad);
			logger.logDebug("Sexo: "+ sexo);
			
			
		} catch (Exception ex) {
			DesignerManagerException.handleException(arg1.getMessageManager(), ex, logger);
		}
	}

}

