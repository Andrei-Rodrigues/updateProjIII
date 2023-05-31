<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.andrei.proj.Produto"%>
<%@ page import="com.andrei.proj.ProdutoDAO"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Editar produto</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }

        h1 {
            color: #333;
            text-align: center;
        }

        form {
            max-width: 400px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: #fff;
            border: none;
            padding: 10px 20px;
            margin-top: 10px;
            border-radius: 4px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <%  
        String idString = request.getParameter("id");
        String nome = request.getParameter("nome");
        String precoString = request.getParameter("preco").replace(",", ".");

        int id = Integer.valueOf(idString);

        double preco = 0.0;
        try {
            preco = Double.parseDouble(precoString);
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }

        Produto produto = new Produto();
        produto.setId(id);
        produto.setNome(nome);
        produto.setPreco(preco);
    %>

    <h1>Editar Produto</h1>

    <form action="editproduto.jsp" method="post">
        <input type="hidden" name="id" value="<%= produto.getId() %>">
        
        <label for="nome">Nome:</label>
        <input type="text" id="nome" name="nome" value="<%= produto.getNome() %>">
        <br>

        <label for="preco">Preço:</label>
        <input type="number" id="preco" name="preco" value="<%= produto.getPreco() %>">
        <br>

        <input type="submit" value="Atualizar">
    </form>
</body>
</html>
