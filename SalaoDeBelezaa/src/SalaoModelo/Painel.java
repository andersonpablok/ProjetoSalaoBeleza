package SalaoModelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import java.sql.Connection;

public class Painel {

	private int cod;
	private String nome;
	private String telefone;
	private String horarioMarcado;
	private String tipoServico;
	private String valor;
	private String situacao;

	public Painel() {
		setNome("");
		setTelefone("");
		setHorarioMarcado("");
		setTipoServico("");
		setValor("");
		setSituacao("");
}

	public int getCod() {
		return cod;
	}

	public void setCod(int cod) {
		this.cod = cod;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getHorarioMarcado() {
		return horarioMarcado;
	}
	public void setHorarioMarcado(String horarioMarcado) {
		this.horarioMarcado = horarioMarcado;
	}

	public String getTipoServico() {
		return tipoServico;
	}





	public void setTipoServico(String tipoServico) {
		this.tipoServico = tipoServico;
	}





	public String getValor() {
		return valor;
	}





	public void setValor(String valor) {
		this.valor = valor;
	}





	public String getSituacao() {
		return situacao;
	}





	public void setSituacao(String situacao) {
		this.situacao = situacao;
	}





	public boolean inserir() {

 Connection conexao = new ConectarJDBC().getConectar();
 if (conexao != null) {
  String sql = "insert into painel(" + "nome,  " 
		    + "telefone,         " 
		    + "horario_marcado,         "
		    + "tipo_servico,  " 
		    + "valor,   " 
		    + "situacao)" 
		    + "values(" 
		    + " ?," 
		    + " ?," 
		    + " ?," 
		    + " ?," 
		    + " ?," 
		    + " ?" 
		    + " )";

			try {
				PreparedStatement prepararSQL = conexao.prepareStatement(sql);
				conexao.prepareStatement(sql);
				prepararSQL.setString(1, nome);
				prepararSQL.setString(2, telefone);
				prepararSQL.setString(3, horarioMarcado);
				prepararSQL.setString(4, tipoServico);
				prepararSQL.setString(5, valor);
				prepararSQL.setString(6, situacao);
	

				prepararSQL.execute();
				prepararSQL.close();
				return true;

			} catch (SQLException e) {
				e.printStackTrace();
				return false;
			}
		}
		return false;
	}

	public boolean apagar() {

		Connection conexao = new ConectarJDBC().getConectar();
		if (conexao != null) {
			String sql = "delete from painel where cod  = ? ";

			try {
				PreparedStatement prepararSQL = conexao.prepareStatement(sql);
				conexao.prepareStatement(sql);
				prepararSQL.setInt(1, cod);

				prepararSQL.execute();
				prepararSQL.close();
				return true;

			} catch (SQLException e) {
				e.printStackTrace();
				return false;
			}
		}
		return false;
	}

 public boolean atualizar() {

 Connection conexao = new ConectarJDBC().getConectar();
 if (conexao != null) {
  String sql = "update painel set "
      + " nome = ?,  " 
      + " telefone = ?,          " 
      + " horario_marcado = ?,          "
      + " tipo_servico = ?,    " 
      + " valor = ?,      " 
      + " situacao = ?,    " 
      + " where cod  = ? ";

			try {
				PreparedStatement prepararSQL = conexao.prepareStatement(sql);
				conexao.prepareStatement(sql);
				prepararSQL.setString(1, nome);
				prepararSQL.setString(2, telefone);
				prepararSQL.setString(3, horarioMarcado);
				prepararSQL.setString(4, tipoServico);
				prepararSQL.setString(5, valor);
				prepararSQL.setString(6, situacao);
				prepararSQL.setInt(7, cod);

				prepararSQL.execute();
				prepararSQL.close();
				return true;

			} catch (SQLException e) {
				e.printStackTrace();
				return false;
			}
		}
		return false;
	}

	public Painel getPainel(int cod) {
		try {
			Connection conexao = new ConectarJDBC().getConectar();
			PreparedStatement ps = conexao.prepareStatement("select * from painel where cod = ? ");
			ps.setInt(1, cod);
			ResultSet rs = ps.executeQuery();

			Painel p = new Painel();

			while (rs.next()) {
				p.setCod(rs.getInt("cod"));
				p.setNome(rs.getString("nome"));
				p.setTelefone(rs.getString("telefone"));
				p.setHorarioMarcado(rs.getString("horario_marcado"));
				p.setTipoServico(rs.getString("tipo_servico"));
				p.setValor(rs.getString("valor"));
				p.setSituacao(rs.getString("situacao"));
	

			}
			ps.close();
			conexao.close();
			return p;

		} catch (Exception e) {

		}

		return null;
	}

	public List<Painel> getLista() {
		try {
			Connection conexao = new ConectarJDBC().getConectar();
			PreparedStatement ps = conexao.prepareStatement("select * from painel");
			ResultSet rs = ps.executeQuery();

			List<Painel> lsPainel = new ArrayList<Painel>();

			while (rs.next()) {
				Painel p = new Painel();
				p.setCod(rs.getInt("cod"));
				p.setNome(rs.getString("nome"));
				p.setTelefone(rs.getString("telefone"));
				p.setHorarioMarcado(rs.getString("horario_marcado"));
				p.setTipoServico(rs.getString("tipo_servico"));
				p.setValor(rs.getString("valor"));
				p.setSituacao(rs.getString("situacao"));
				lsPainel.add(p);

			}
			ps.close();
			conexao.close();
			return lsPainel;

		} catch (Exception e) {

		}

		return null;
	}

		public String getCorStatus() {
		if (nome.equals("Pré-Operatório")) {
			return "table-warning";
		}
		if (nome.equals("Em sala cirúrgica")) {
			return "table-danger";

		}
		if (nome.equals("Em recuperação")) {
			return "table-success";

		}

		if (nome.equals("Transferido")) {
			return "table-primary";

		}
		return ""; 

	}

}
