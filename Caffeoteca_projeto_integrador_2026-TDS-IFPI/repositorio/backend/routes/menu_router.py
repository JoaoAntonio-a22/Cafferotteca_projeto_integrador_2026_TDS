from flask import Flask
from controllers import menu_controller

def adicionar_rotas_menu(app: Flask):
    
    app.add_url_rule('/menu', view_func=menu_controller.menu, methods=['GET', 'POST'])