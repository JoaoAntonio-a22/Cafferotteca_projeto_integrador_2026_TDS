from flask import render_template
from models.produto_model import listaProdutos

def teste():
    return render_template('teste.html', listaProdutos=listaProdutos)
