package br.com.fabao.app.autorizacao.controller;

import java.io.IOException;

import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.apache.commons.lang3.StringUtils;
import org.apache.http.HttpStatus;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.json.JsonMapper;

import br.com.fabao.app.autorizacao.dto.SolicitacaoDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name="AutorizacaoController", urlPatterns= {"/autorizacao"})
public class AutorizacaoAjaxController extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String cpf = request.getParameter("cpf");
        String nomeProcedimento = request.getParameter("nomeProcedimento");

        String host;       

        host =  String.format("http://localhost:8080/solicitacoes?cpf=%s&nomeProcedimento=%s", StringUtils.isNotEmpty(cpf) ? cpf : "", StringUtils.isNotEmpty(nomeProcedimento) ? nomeProcedimento : "");
        try {
            String res = ClientBuilder.newClient().target(host).request(MediaType.APPLICATION_JSON).get(String.class);
            if (res != null) {
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(res);
            }


        } catch (Exception e) {
            e.getMessage();
        }


    }
	
	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String cpf = request.getParameter("cpf");
        String nomeProcedimento = request.getParameter("nomeProcedimento");
        
        SolicitacaoDTO dto = new SolicitacaoDTO();
        dto.setCpf(cpf);
        dto.setNomeProcedimento(nomeProcedimento);
        
        ObjectMapper objectMapper = new ObjectMapper();

        String host;       

        host =  String.format("http://localhost:8080/solicitacoes");
        try {
            Response res = ClientBuilder.newClient().target(host).request(MediaType.APPLICATION_JSON).post(Entity.entity(objectMapper.writeValueAsString(dto) , MediaType.APPLICATION_JSON));
            if (res.getStatus() != HttpStatus.SC_OK) {
            	//Nesse momento era pra capturar o erro do handler da API, porém ainda não funciona, então é exibido erro genérico.
            	response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
            	response.getWriter().write("Solicitação não autorizada");
            }

        } catch (Exception e) {
            e.getMessage();
        }


    }

}