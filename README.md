# webappautorizacaoprocedimentos
Web app com servlet para consumir o msautorizacaoprocedimentos

Tecnologias

Java 11
Servlet
lombok
javax.ws.rs-api
jackson

Instruções para o build

Testado o build no maven 3.8.6

Geração do WAR
No prompt, na pasta raiz do projeto onde se encontra o pom, executar o comando:
mvn clean install.

Deploy
Foi testado no Tomcat v10.0 (https://tomcat.apache.org/download-10.cgi)

ATENÇÃO
Iniciar o servidor de aplicação em porta diferente da 8080, pois essa porta é utilizada na integração msautorizacaoprocedimentos

Integração

Este Web app utiliza o javax.ws.rs.client.ClientBuilder para fazer chamada rest no microserviço msautorizacaoprocedimentos.
Subir o microserviço na porta 8080 (obrigatório) e subir esse app em outra porta.






