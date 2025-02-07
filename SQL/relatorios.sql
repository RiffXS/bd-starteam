-- Quantidade de jogo por cliente
select usuario.nome, count(cj.fk_cliente_fk_usuario_id) as qtd_jogos
from cliente_jogo as cj
inner join cliente as c on c.fk_usuario_id = cj.fk_cliente_fk_usuario_id
inner join usuario on usuario.id = c.fk_usuario_id
group by usuario.nome
order by qtd_jogos desc;


--Top jogos mais comprados
select jogo.id, jogo.nome, count(cj.fk_jogo_id) as qtd from jogo
inner join cliente_jogo as cj on jogo.id = cj.fk_jogo_id
group by jogo.id
order by qtd desc
limit 10;


--Top clientes que mais compram jogos
SELECT usuario.id, usuario.nome, count(cj.fk_cliente_fk_usuario_id) as qtd from usuario
inner join cliente as c on c.fk_usuario_id = usuario.id
inner join cliente_jogo as cj on c.fk_usuario_id = cj.fk_cliente_fk_usuario_id
group by usuario.id
order by qtd desc
limit 5;


--Mês que cada jogo mais foi vendido
select
  jogo.nome as nome_jogo,
  extract(month from cj.data) as mes,
  count(*) as qtd_vendas
from cliente_jogo cj
inner join jogo on cj.FK_JOGO_id = jogo.id
inner join (select jogo.id as jogo_id, jogo.nome, count(cj.fk_jogo_id) as qtd from jogo
inner join cliente_jogo as cj on jogo.id = cj.fk_jogo_id
group by jogo.id
order by qtd desc
limit 5) t5 on cj.FK_JOGO_id = t5.jogo_id
group by mes, nome_jogo
order by mes;


--Quantidade de jogos que cada titular lançou
select jogo_titular.fk_titular_id, titular.nome, count(jogo_titular.fk_jogo_id) as qtd_jogos
from jogo_titular
inner join titular on titular.id = jogo_titular.fk_titular_id
group by titular.nome, jogo_titular.fk_titular_id
order by qtd_jogos desc;
