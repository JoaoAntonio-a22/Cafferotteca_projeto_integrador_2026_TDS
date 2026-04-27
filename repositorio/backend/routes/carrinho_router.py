from flask import Flask
from controllers import carrinho_controller

def adicionar_rotas_carrinho(app: Flask):
    app.add_url_rule('/carrinho', view_func=carrinho_controller.carrinho, methods=['GET', 'POST'])
    app.add_url_rule('/carrinho/remover/<int:item_id>', view_func=carrinho_controller.remover_item, methods=['POST'])
    app.add_url_rule('/carrinho/aumentar/<int:item_id>', view_func=carrinho_controller.aumentar_quantidade, methods=['POST'])
    app.add_url_rule('/carrinho/diminuir/<int:item_id>', view_func=carrinho_controller.diminuir_quantidade, methods=['POST'])