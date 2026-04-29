Perfis de Usuário – Coffeoteca
1. Cliente
É o usuário final, quem vai usar o site para consumir o que a Coffeoteca oferece. A ideia é que ele consiga navegar sem mistério.

O que faz: Cria uma conta, olha o cardápio e os livros disponíveis, faz pedidos online e reserva uma mesa se quiser ler por lá.

Acessos: Ele tem permissão para ver tudo o que é público, gerenciar o próprio perfil e acompanhar o histórico dos seus pedidos.

Bloqueios: Obviamente, não entra na parte administrativa e nem mexe nos dados de outros clientes.


2. Funcionário
É a galera que trabalha no café e precisa do sistema para agilizar o dia a dia.

O que faz: Recebe os pedidos que chegam, muda o status (tipo "preparando" ou "entregue") e dá uma olhada nas reservas de mesa para organizar o espaço.

Acessos: Consegue ver os detalhes dos pedidos e informações básicas dos clientes para poder atender bem.

Bloqueios: Ele não pode deletar nada importante (como o histórico de vendas) e não tem acesso às configurações de sistema ou cadastro de novos funcionários.


3. Administrador
É quem manda no sistema todo e tem a visão geral do negócio.

O que faz: Cuida de tudo. Ele que cadastra novos produtos no cardápio, coloca livros novos no acervo, mexe nos usuários e tira relatórios para ver como as vendas estão indo.

Acessos: Tem o famoso "acesso total" (CRUD). Pode criar, editar e excluir qualquer coisa, além de configurar as permissões dos outros níveis.

Responsabilidade: É o único que precisa tomar cuidado dobrado, já que as ações dele impactam o banco de dados inteiro.


4. O Sistema
Aqui não é uma pessoa, mas sim a parte do código que roda sozinha para o site funcionar.

O que ele resolve: Ele cuida da parte chata e repetitiva, como validar o login (autenticação), processar os pagamentos/pedidos, atualizar se a mesa ainda está livre e salvar os logs de erro para a gente saber se algo quebrou.
