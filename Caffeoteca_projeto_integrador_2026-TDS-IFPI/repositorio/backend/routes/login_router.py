from flask import Flask
from controllers import login_controller

def adicionar_rotas_login(app: Flask):
    app.add_url_rule('/login', view_func=login_controller.login, methods=['GET', 'POST'])