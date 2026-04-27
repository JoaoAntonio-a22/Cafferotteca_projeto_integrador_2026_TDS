import os
from flask import Flask
from routes import index_router, login_router, menu_router, perfil_router, teste_router, carrinho_router

BASE_DIR = os.path.abspath(os.path.dirname(__file__))
TEMPLATE_DIR = os.path.join(BASE_DIR, '..', 'frontend', 'templates')
STATIC_DIR = os.path.join(BASE_DIR, '..', 'frontend', 'static')

app = Flask(__name__, template_folder=TEMPLATE_DIR, static_folder=STATIC_DIR)
app.secret_key = 'coffeoteca-secret-key'

index_router.adicionar_rotas(app)
login_router.adicionar_rotas_login(app)
menu_router.adicionar_rotas_menu(app)
perfil_router.adicionar_rotas_perfil(app)
perfil_router.adicionar_rotas_adicionar_produto(app)
teste_router.adicionar_rotas_teste(app)
carrinho_router.adicionar_rotas_carrinho(app)

if __name__ == '__main__':
    app.run(debug=True)

