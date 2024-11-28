function resultado = executarNaiveBayes(jogoExemplo, tagsNormais, nomesNormais, tagsVR, nomesVR)
    % Verificar se o jogo exemplo existe na base de jogos normais
    idxExemplo = find(strcmp(nomesNormais, jogoExemplo));
    if isempty(idxExemplo)
        error('Jogo exemplo não encontrado na base de dados de jogos normais.');
    end

    % Tags do jogo exemplo
    tagsExemplo = tagsNormais(idxExemplo, :);

    % Calcular probabilidades baseadas nos jogos normais
    totalJogos = size(tagsNormais, 1);
    probabilidades = sum(tagsNormais) / totalJogos;

    % Pontuar os jogos VR com base nas probabilidades calculadas
    scores = zeros(size(tagsVR, 1), 1);
    for i = 1:size(tagsVR, 1)
        probPresente = tagsVR(i, :) .* probabilidades;
        probAusente = (1 - tagsVR(i, :)) .* (1 - probabilidades);
        scores(i) = prod(probPresente + probAusente);
    end

    % Ordenar os jogos VR por pontuação
    [~, ordem] = sort(scores, 'descend');
    resultado = nomesVR(ordem(1:5));
end
