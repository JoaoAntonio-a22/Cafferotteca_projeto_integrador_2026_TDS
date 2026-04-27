from flask import Flask
from controllers import perfil_controller

def adicionar_rotas_perfil(app: Flask):
    app.add_url_rule('/perfil', view_func=perfil_controller.perfil, methods=['GET'])


def adicionar_rotas_adicionar_produto(app: Flask):
    app.add_url_rule('/adicionar_produto', view_func=perfil_controller.adicionar_produto, methods=['GET', 'POST'])