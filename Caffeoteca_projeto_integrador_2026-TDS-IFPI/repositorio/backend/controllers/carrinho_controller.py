from flask import render_template, request, session, redirect, url_for
from models.produto_model import listaProdutos


def carrinho():
    produto_id = request.args.get('id', type=int)
    carrinho_itens = session.get('carrinho_itens', {})

    if produto_id:
        if str(produto_id) in carrinho_itens:
            carrinho_itens[str(produto_id)] += 1
        else:
            carrinho_itens[str(produto_id)] = 1
        session['carrinho_itens'] = carrinho_itens

    carrinho_display = []
    subtotal = 0
    for item_id, quantity in carrinho_itens.items():
        produto_encontrado = None
        for produto in listaProdutos:
            if produto.id == int(item_id):
                produto_encontrado = produto
                break

        if produto_encontrado:
            item_total = produto_encontrado.preco * quantity
            subtotal += item_total
            carrinho_display.append({
                'id': produto_encontrado.id,
                'nome': produto_encontrado.nome,
                'descricao': produto_encontrado.descricao,
                'preco': produto_encontrado.preco,
                'quantidade': quantity,
                'total': item_total
            })

    return render_template('carrinho.html', carrinho=carrinho_display, subtotal=subtotal)


def remover_item(item_id):
    carrinho_itens = session.get('carrinho_itens', {})
    if str(item_id) in carrinho_itens:
        del carrinho_itens[str(item_id)]
        session['carrinho_itens'] = carrinho_itens
    return redirect(url_for('carrinho'))


def aumentar_quantidade(item_id):
    carrinho_itens = session.get('carrinho_itens', {})
    if str(item_id) in carrinho_itens:
        carrinho_itens[str(item_id)] += 1
        session['carrinho_itens'] = carrinho_itens
    return redirect(url_for('carrinho'))


def diminuir_quantidade(item_id):
    carrinho_itens = session.get('carrinho_itens', {})
    if str(item_id) in carrinho_itens and carrinho_itens[str(item_id)] > 1:
        carrinho_itens[str(item_id)] -= 1
        session['carrinho_itens'] = carrinho_itens
    return redirect(url_for('carrinho'))