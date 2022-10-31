package br.com.fabao.app.autorizacao.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
public class AutorizacaoDTO {
		
	private String nomeBeneficiario;
	
	private String cpf;
	
	private String nomeProcedimento;
	
	private Date dataAutorizacao;
	


}
