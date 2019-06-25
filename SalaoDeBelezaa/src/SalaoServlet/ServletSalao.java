package SalaoServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.rmi.ServerException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import SalaoModelo.Painel;

@WebServlet(name = "servletPainel", urlPatterns = "/servletPainel")

public class ServletSalao extends HttpServlet {

	public void service(HttpServletRequest request, HttpServletResponse response) throws ServerException, IOException {
		String nome = request.getParameter("nome");
		String telefone = request.getParameter("telefone");
		String horarioMarcado = request.getParameter("horarioMarcado");
		String tipoServico = request.getParameter("tipoServico");
		String valor = request.getParameter("valor");
		String situacao = request.getParameter("situacao");
		String data = request.getParameter("data");
		System.out.println("Nome digitado " + nome + " Telefone " + telefone + " Horario Marcado " + horarioMarcado
				+ " Tipo de Serviço " + tipoServico + " Valor " + valor + " Situação Pagamento " + situacao + " Data " + data);

		Painel obj = new Painel();
		obj.setNome(request.getParameter("nome"));
		obj.setTelefone(request.getParameter("telefone"));
		obj.setHorarioMarcado(request.getParameter("horarioMarcado"));
		obj.setTipoServico(request.getParameter("tipoServico"));
		obj.setValor(request.getParameter("valor"));
		obj.setSituacao(request.getParameter("situacao"));
		obj.setData(request.getParameter("data"));

		PrintWriter saida = response.getWriter();

		int cod = Integer.parseInt(request.getParameter("cod"));

		boolean sucesso = false;

		if (cod > 0) {
			obj.setCod(cod);
			if (request.getParameter("apagar") == null) {
				sucesso = obj.atualizar();
			} else {
				sucesso = obj.apagar();
			}
			sucesso = obj.atualizar();
		} else {
			sucesso = obj.inserir();
		}

		if (sucesso) {
			saida.print("Gravado com sucesso.");
		} else {
			saida.print("Erro ao gravar");
		}
	}
}
