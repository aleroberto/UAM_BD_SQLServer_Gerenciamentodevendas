



--RELATORIO SEMANAL DE VENDAS
--semana de 23 a 30 de Junho
select codigo as 'Nr Pedido', data as 'Data Pedido' from pedido
WHERE DATA BETWEEN '2020-06-23' and '2020-06-30';

--semana de 16 a 22 de Junho
select codigo as 'Nr Pedido', data as 'Data Pedido' from pedido
WHERE DATA BETWEEN '2020-06-16' and '2020-06-22';

--semana de 09 a 15 de Junho
select codigo as 'Nr Pedido', data as 'Data Pedido' from pedido
WHERE DATA BETWEEN '2020-06-09' and '2020-06-15';

--semana de 1 a 8 de Junho
select codigo as 'Nr Pedido', data as 'Data Pedido' from pedido
WHERE DATA BETWEEN '2020-06-01' and '2020-06-08';

--QUINZENAL
select codigo as 'Nr Pedido', data as 'Data Pedido' from pedido
WHERE data < (GETDATE() + 14 );

-- mensal
select codigo as 'Nr Pedido', data as 'Data Pedido' from pedido
WHERE DATA BETWEEN '2020-06-01' and '2020-06-30';

--De vendas por atendente
SELECT COUNT(fk_Atendente_matricula) AS 'Total de vendas' ,  atendente.Nomecompleto as 'Atendente'
from Atendente_Comissao JOIN Atendente
ON   Atendente_Comissao.fk_Atendente_matricula = atendente.MATRICULA
group by fk_Atendente_matricula, Nomecompleto;

--De cliente por entrega e por produto
SELECT COUNT (fk_entrega_codigo) AS 'Total' , entrega.descricao as 'Descricao'
FROM Entrega JOIN PEDIDO
ON entrega.codigo = fk_entrega_codigo
GROUP BY descricao, fk_entrega_codigo;

--de pagamentos por mes
SELECT COUNT (fk_pagamento_codigo) AS 'Total de pedidos' , pagamento.descricao as 'Descricao'
FROM pedido JOIN pagamento
ON pedido.fk_pagamento_codigo = pagamento.codigo
GROUP BY fk_pagamento_codigo, pagamento.descricao;



