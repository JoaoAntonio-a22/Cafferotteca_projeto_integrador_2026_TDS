from flask import Flask
from controllers import teste_controller

def adicionar_rotas_teste(app: Flask):
    app.add_url_rule('/teste', view_func=teste_controller.teste, methods=['GET'])
