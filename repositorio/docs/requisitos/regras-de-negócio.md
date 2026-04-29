Regras e Restrições do Sistema – Coffeoteca
1. Cadastro e Login
E-mail real: O usuário precisa de um e-mail válido e único. Nada de contas duplicadas.

Senha: No mínimo 6 caracteres pra não ficar muito inseguro.

Login obrigatório: Se o cara quiser pedir um café ou reservar um lugar, tem que estar logado. Não dá pra fazer nada como "visitante".


2. Fluxo de Pedidos
Só logado: Só faz pedido quem tem conta.

Carrinho vazio não rola: O pedido precisa ter pelo menos um item.

Caminho do pedido: Ele segue uma ordem lógica: Pendente → Em preparo → Finalizado → Entregue/Retirado.

Nada de deletar: Se deu problema ou o cliente desistiu, a gente cancela, mas não apaga o registro do banco de dados.


3. Cardápio e Livros
O que precisa ter: No cardápio, tudo tem que ter nome, preço e categoria. Nos livros, precisa de título, autor e gênero.

Disponibilidade: Se o café acabou ou o livro já está emprestado, o sistema bloqueia o pedido/reserva na hora.

Quem manda: Alterar preço ou cadastrar livro novo é tarefa só do Administrador.


4. Reservas de Mesa
Dados necessários: Dia, hora e quantas pessoas vão.

Sem fura-fila: Se o horário já tá ocupado, o sistema nem deixa marcar.

Cancelamento: O cliente pode desistir, mas tem um limite (tipo 1 hora antes) pra gente não ficar no prejuízo.


5. Segurança e Bastidores
LGPD e Privacidade: Os dados dos clientes são sagrados e ficam protegidos.

Soft Delete: Se um usuário quiser excluir a conta, a gente desativa o perfil dele, mas mantém o histórico de compras guardado por segurança.

Níveis de acesso: O sistema sabe quem é Cliente, Funcionário ou Admin, e cada um só acessa o que é do seu nível.

Logs e Erros: O sistema anota tudo o que acontece (logs). Se algo quebrar, ele precisa tratar o erro pro usuário não ver uma tela cheia de código. Além disso, tudo fica salvo em um banco de dados seguro e sempre online.