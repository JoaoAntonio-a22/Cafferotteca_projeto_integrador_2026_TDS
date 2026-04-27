from flask import Flask, render_template, request
from models.produto_model import *

def menu():
    username = request.args.get('username', 'Guest')
    return render_template('menu.html', username=username, listaProdutos=listaProdutos)

