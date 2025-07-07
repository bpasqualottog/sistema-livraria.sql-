SELECT A.nm_assinante, T.n_fone, TA.ds_tipo
FROM Assinante A
JOIN Telefone T ON A.cd_assinante = T.cd_assinante
JOIN Tipo_Assinante TA ON A.cd_tipo = TA.cd_tipo
JOIN Endereco E ON A.cd_endereco = E.cd_endereco
WHERE TA.ds_tipo = 'comercial'
AND (E.ds_endereco LIKE '%Natal%' OR E.ds_endereco LIKE '%Pelotas%');

SELECT A.nm_assinante
FROM Assinante A
JOIN Telefone T ON A.cd_assinante = T.cd_assinante
GROUP BY A.cd_assinante, A.nm_assinante
HAVING COUNT(T.cd_fone) > 1;


SELECT A.cd_assinante, A.nm_assinante, E.ds_endereco, T.dd, T.n_fone
FROM Assinante A
JOIN Endereco E ON A.cd_endereco = E.cd_endereco
JOIN Tipo_Assinante TA ON A.cd_tipo = TA.cd_tipo
LEFT JOIN Telefone T ON A.cd_assinante = T.cd_assinante
WHERE E.cd_municipio = 1 -- Pelotas
AND TA.ds_tipo = 'residencial';


SELECT 
    Assinante.nm_assinante AS Nome_Assinante,
    Ramo.ds_ramo AS Ramo
FROM Assinante
LEFT JOIN Ramo ON Assinante.cd_ramo = Ramo.cd_ramo
ORDER BY Ramo.ds_ramo, Assinante.nm_assinante;


SELECT 
    Assinante.nm_assinante AS Nome_Assinante,
    Endereco.ds_endereco AS Endereco,
    Endereco.complemento AS Complemento,
    Endereco.bairro AS Bairro,
    Endereco.cep AS CEP,
    Municipio.ds_municipio AS Municipio,
    Telefone.dd AS DDD,
    Telefone.n_fone AS Numero_Telefone
FROM Assinante
INNER JOIN Endereco ON Assinante.cd_endereco = Endereco.cd_endereco
INNER JOIN Municipio ON Endereco.cd_municipio = Municipio.cd_municipio
LEFT JOIN Telefone ON Assinante.cd_assinante = Telefone.cd_assinante;
