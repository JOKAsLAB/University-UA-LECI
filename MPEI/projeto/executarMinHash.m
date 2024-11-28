function resultado = executarMinHash(jogoExemplo, tagsNormais, tagsVR, nomesNormais, nomesVR)
    numHashes = 100;
    [numJogosNormais, ~] = size(tagsNormais);
    [numJogosVR, ~] = size(tagsVR);
    
    hashFuncs = @(x, a, b, p) mod(a*x + b, p);
    a = randi(1000, 1, numHashes);
    b = randi(1000, 1, numHashes);
    p = 2003;
    
    assinaturaNormais = zeros(numJogosNormais, numHashes);
    assinaturaVR = zeros(numJogosVR, numHashes);
    
    for i = 1:numJogosNormais
        for j = 1:numHashes
            assinaturaNormais(i, j) = min(hashFuncs(find(tagsNormais(i, :) > 0), a(j), b(j), p));
        end
    end
    
    for i = 1:numJogosVR
        for j = 1:numHashes
            assinaturaVR(i, j) = min(hashFuncs(find(tagsVR(i, :) > 0), a(j), b(j), p));
        end
    end
    
    idxExemplo = find(strcmp(nomesNormais, jogoExemplo));
    if isempty(idxExemplo)
        error('Jogo exemplo não encontrado.');
    end
    assinaturaExemplo = assinaturaNormais(idxExemplo, :);
    
    similaridades = zeros(numJogosVR, 1);
    for i = 1:numJogosVR
        similaridades(i) = sum(assinaturaExemplo == assinaturaVR(i, :)) / numHashes;
    end
    
    [~, ordem] = sort(similaridades, 'descend');
    resultado = nomesVR(ordem(1:5));
end
