<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*" %>  
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.List" %>
<%@ page import="com.andrei.proj.Produto"%>
<%@ page import="com.andrei.proj.ProdutoDAO"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Cadastro de produtos</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        h1 {
            text-align: center;
        }

        .form-container {
            max-width: 300px;
            margin: 0 auto;
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 20px;
        }

        .form-container label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .form-container input[type="text"],
        .form-container input[type="number"],
        .form-container input[type="submit"] {
            width: 100%;
            padding: 5px;
            margin-bottom: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .form-container input[type="submit"] {
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #4CAF50;
            color: #fff;
        }

        .actions {
            display: flex;
        }

        .actions a {
            display: inline-block;
            padding: 3px 8px;
            margin-right: 5px;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            text-decoration: none;
        }

        .actions a:hover {
            background-color: #45a049;
        }

        /* Estilo das linhas cadastradas */
        .linha-cadastrada:nth-child(odd) {
            background-color: #f2f2f2;
        }

        .linha-cadastrada:nth-child(even) {
            background-color: #e8e8e8;
        }
    </style>
</head>
<body>
    <h1>Cadastro de produtos</h1>

    <div class="form-container">
        <form id="produtoForm" action="addproduto.jsp" method="post">
            <label for="nome">Nome:</label>
            <input type="text" id="nome" name="nome">

            <label for="preco">Preço:</label>
            <input type="number" id="preco" name="preco">

            <input type="submit" value="Adicionar">
        </form>
    </div>
    
    <hr>
    
    <table id="produtoTable">
        <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>Preço</th>
            <th>Ações</th>
        </tr>
        <%
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cadastro", "root", "");
            ProdutoDAO produtoDAO = new ProdutoDAO(conn);
            List<Produto> produtos = produtoDAO.listarProdutos();

            for (int i = 0; i < produtos.size(); i++) {
        %>
        <tr class="linha-cadastrada">
            <td><%=produtos.get(i).getId()%> </td>
            <td><%=produtos.get(i).getNome()%> </td>
            <td><%=produtos.get(i).getPreco()%></td>
            <td class="actions">
                <a href="delete.jsp?id=<%= produtos.get(i).getId() %>">Remover</a>
                <a href="edit.jsp?id=<%= produtos.get(i).getId() %>&nome=<%= produtos.get(i).getNome() %>&preco=<%= produtos.get(i).getPreco() %>">Editar</a>
            </td>
        </tr>
        <%
            }
        } catch (Exception e) {
            out.println("<tr><td colspan='4'>Falha na conexão</td></tr>");
            out.println(e);
        }
        %>
    </table>
</body>
</html>


