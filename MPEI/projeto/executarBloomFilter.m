function resultado = executarBloomFilter(jogoExemplo, nomesNormais, tagsNormais, tagsVR, nomesVR)
    % Inicializar Bloom Filter
    n = 8000;  % Tamanho do Bloom Filter
    k = 3;     % Número de funções de hash
    FB = inicializarBloomFilter(n);

    % Adicionar jogos normais ao Bloom Filter
    for i = 1:length(nomesNormais)
        % Adicionar as tags ao Bloom Filter
        tagsJogo = find(tagsNormais(i, :) > 0); 
        for t = tagsJogo
            FB = adicionarBloomFilter(FB, num2str(t), k);
        end
    end

    % Obter as tags do jogo de exemplo
    idxExemplo = find(strcmp(nomesNormais, jogoExemplo));
    if isempty(idxExemplo)
        error('Jogo exemplo não encontrado na base de dados de jogos normais.');
    end
    tagsExemplo = find(tagsNormais(idxExemplo, :) > 0);

    % Verificar jogos VR que compartilham as mesmas tags
    scores = zeros(size(tagsVR, 1), 1);
    for i = 1:size(tagsVR, 1)
        tagsVRJogo = find(tagsVR(i, :) > 0);
        matchCount = 0;
        for t = tagsVRJogo
            if testarBloomFilter(FB, num2str(t), k)
                matchCount = matchCount + 1;
            end
        end
        scores(i) = matchCount;
    end

    % Normalizar os scores para que variem entre 0 e 1
    maxScore = max(scores);
    minScore = min(scores);
    if maxScore > minScore
        scores = (scores - minScore) / (maxScore - minScore);
    end

    % Ordenar os jogos VR por número de tags correspondentes
    [~, ordem] = sort(scores, 'descend');
    resultado = nomesVR(ordem(1:5));
end

% Funções Auxiliares
function FB = inicializarBloomFilter(n)
    FB = false(1, n);
end

function FB = adicionarBloomFilter(FB, chave, k)
    for i = 1:k
        chave_complementada = [chave num2str(i)];  
        hash_val = mod(string2hash(chave_complementada), length(FB)) + 1;  
        FB(hash_val) = true;  
    end
end

function aux = testarBloomFilter(FB, chave, k)
    aux = true;  
    for i = 1:k
        chave_complementada = [chave num2str(i)];  
        hash_val = mod(string2hash(chave_complementada), length(FB)) + 1;  
        if FB(hash_val) == false  
            aux = false;
            break;
        end
    end
end

function hash = string2hash(str)
    % Função para gerar hash simples de uma string
    hash = sum(double(str)) * 31;
end
