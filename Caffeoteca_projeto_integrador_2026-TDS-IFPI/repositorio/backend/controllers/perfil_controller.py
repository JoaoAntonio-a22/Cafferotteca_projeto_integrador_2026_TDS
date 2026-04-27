from flask import Flask, request, render_template, redirect, url_for
from models.produto_model import *

def perfil():
    return render_template('admin.html')

def adicionar_produto():
    if request.method == 'POST':
        id = int(request.form['id'])
        nome = request.form['nome']
        descricao = request.form['descricao']
        preco = request.form['preco']

        produto = Produto(id, nome, descricao, preco)
        listaProdutos.append(produto)

        return redirect(url_for('menu'))


    return render_template('coffee_menu.html')