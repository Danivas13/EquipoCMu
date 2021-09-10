/*
 * Archivo: VA_VABUTTONBHMOUKX_842721.java
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
import com.cobiscorp.cobis.mmuns.model.BDDLEntidad;
import com.cobiscorp.cobis.mmuns.model.DJVGEntidad;
import com.cobiscorp.designer.api.DataEntity;
import com.cobiscorp.designer.api.DynamicRequest;
import com.cobiscorp.designer.api.customization.IExecuteCommand;
import com.cobiscorp.designer.api.customization.arguments.IExecuteCommandEventArgs;
import com.cobiscorp.designer.api.managers.DesignerManagerException;

@Component
@Service({ IExecuteCommand.class })
@Properties(value={
		@Property(name = "view.id", value = "VW_ESTUDIANLL_721"),
		@Property(name = "view.version", value = "1.0.0"),
		@Property(name = "view.controlId", value = "VA_VABUTTONBHMOUKX_842721")})

public class VA_VABUTTONBHMOUKX_842721 implements IExecuteCommand {
	/**
	 * Instancia de Logger
	 */
	private static final ILogger logger = LogFactory.getLogger(VA_VABUTTONBHMOUKX_842721.class);

	@Override
	public void executeCommand(DynamicRequest arg0, IExecuteCommandEventArgs arg1) {
		// TODO Auto-generated method stub
		if (logger.isDebugEnabled()) {
			logger.logDebug("Start executeCommand in VA_VABUTTONBHMOUKX_842721");
		}
		try {
			DataEntity recuperado = arg0.getEntity(BDDLEntidad.ENTITY_NAME);
			String concatenado = recuperado.get(BDDLEntidad.NOMBRE)+" "+recuperado.get(BDDLEntidad.APELLIDO)
			+" "+String.valueOf(recuperado.get(BDDLEntidad.EDAD))+" años "+recuperado.get(BDDLEntidad.SEXO).toString();
			
			if (logger.isDebugEnabled()) {
				logger.logDebug("Nombre completo: "+concatenado);
				logger.logDebug("END Command in VA_VABUTTONBHMOUKX_842721");
			}
		} catch (Exception ex) {
			DesignerManagerException.handleException(arg1.getMessageManager(), ex, logger);
		}
		
	}

}

