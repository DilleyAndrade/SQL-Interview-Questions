SELECT 
    c.id AS cliente_id,
    c.nome AS cliente_nome,
    p.id AS pedido_id,
    p.data_pedido,
    p.valor_total
FROM 
    clientes c
JOIN 
    pedidos p ON c.id = p.cliente_id
ORDER BY 
    c.id, p.data_pedido;