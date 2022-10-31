package br.com.fabao.app.autorizacao.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class SolicitacaoDTO {
	
	private String cpf;
	private String nomeProcedimento;
}
