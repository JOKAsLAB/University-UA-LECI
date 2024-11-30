% Projeto MPEI 2024-2025
% Recomendação de Jogos VR com base em Tags de Jogos Convencionais

% Limpar variáveis e fechar gráficos
clear; clc; close all;

% 1. Carregar a Base de Dados
jogosNormais = readtable('jogos_normais.xlsx', 'VariableNamingRule', 'preserve');
jogosVR = readtable('jogos_vr.xlsx', 'VariableNamingRule', 'preserve');

% Mostrar uma prévia dos dados carregados
disp('Jogos Normais:');
disp(jogosNormais(1:5, :));
disp('Jogos VR:');
disp(jogosVR(1:5, :));

% 2. Preprocessamento de Dados
tagsNormais = jogosNormais{:, 1:end-1}; 
nomesNormais = jogosNormais{:, end};

tagsVR = jogosVR{:, 1:end-1}; 
nomesVR = jogosVR{:, end};

% 3. Gerar Assinaturas MinHash
disp('--- Gerando Assinaturas MinHash ---');
numHashes = 100;  % Número de funções hash
minHashNormais = generateMinHash(tagsNormais, numHashes);
minHashVR = generateMinHash(tagsVR, numHashes);

% 4. Inicializar o Bloom Filter para evitar duplicados
disp('--- Inicializando Bloom Filter ---');
n = 8000;  % Tamanho do Bloom Filter
k = 3;     % Número de funções de hash
bloomFilter = inicializarBloomFilter(n);

% Variável para armazenar jogos já recomendados
jogosRecomendados = {};

% Loop de interação com o usuário
while true
    % 5. Selecionar um jogo exemplo
    jogoExemplo = input('Digite o nome de um jogo convencional (ou "sair" para terminar): ', 's');
    if strcmpi(jogoExemplo, 'sair')
        disp('Encerrando o sistema de recomendação.');
        break;
    end

    % Verificar se o jogo exemplo existe na base de dados
    if ~any(strcmp(nomesNormais, jogoExemplo))
        disp('Jogo não encontrado na base de dados. Tente novamente.');
        continue;
    end

    % 6. Identificar índice do jogo exemplo
    idxExemplo = find(strcmp(nomesNormais, jogoExemplo));
    assinaturaExemplo = minHashNormais(idxExemplo, :);

    % 7. Calcular similaridade MinHash
    disp('--- Calculando Similaridade MinHash ---');
    similaridades = zeros(size(minHashVR, 1), 1);
    for i = 1:size(minHashVR, 1)
        similaridades(i) = mean(assinaturaExemplo == minHashVR(i, :));
    end

    % Ordenar os jogos VR por similaridade
    [~, ordem] = sort(similaridades, 'descend');
    recomendados = nomesVR(ordem);

    % 8. Filtrar resultados com o Bloom Filter
    disp('--- Filtrando com Bloom Filter ---');
    resultadoFiltrado = {};
    for i = 1:length(recomendados)
        jogoVR = recomendados{i};
        if ~testarBloomFilter(bloomFilter, jogoVR, k)
            % Jogo não é duplicado; adicioná-lo ao resultado filtrado
            resultadoFiltrado{end+1} = jogoVR; 
            % Adicionar ao Bloom Filter
            bloomFilter = adicionarBloomFilter(bloomFilter, jogoVR, k);
        end
        % Parar após recomendar 5 jogos únicos
        if length(resultadoFiltrado) >= 5
            break;
        end
    end

    % 9. Exibir os resultados finais
    if isempty(resultadoFiltrado)
        disp('Nenhum jogo VR disponível para recomendar (evitando duplicados).');
    else
        disp('Jogos VR Recomendados:');
        disp(resultadoFiltrado);
        jogosRecomendados = [jogosRecomendados, resultadoFiltrado];
    end
end

% 10. Exibir resumo das recomendações ao final
disp('--- Resumo de Jogos Recomendados ---');
disp(unique(jogosRecomendados));


%% EXTRA

function FB = inicializarBloomFilter(n)
    % Inicializa um Bloom Filter vazio de tamanho n
    FB = false(1, n);
end

function FB = adicionarBloomFilter(FB, chave, k)
    % Adiciona uma chave ao Bloom Filter usando k funções de hash
    for i = 1:k
        chave_complementada = [chave num2str(i)];  
        hash_val = mod(string2hash(chave_complementada), length(FB)) + 1;  
        FB(hash_val) = true;  
    end
end

function aux = testarBloomFilter(FB, chave, k)
    % Verifica se uma chave está presente no Bloom Filter
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
    % Gera um hash simples de uma string
    hash = sum(double(str)) * 31;
end

function signatures = generateMinHash(matrix, numHashes)
    % Gerar assinaturas MinHash para uma matriz binária.
    % 
    % matrix: Matriz binária (linhas: jogos, colunas: tags).
    % numHashes: Número de funções hash a usar.
    % 
    % Retorna:
    % signatures: Matriz de assinaturas MinHash.

    [numGames, numTags] = size(matrix);
    signatures = inf(numGames, numHashes);  % Inicializar com infinito.

    % Gerar permutações para as funções hash
    for i = 1:numHashes
        perm = randperm(numTags);  % Permutação aleatória (simula função hash)
        
        % Calcular a assinatura para cada jogo
        for gameIdx = 1:numGames
            for tagIdx = 1:numTags
                if matrix(gameIdx, perm(tagIdx)) == 1
                    signatures(gameIdx, i) = perm(tagIdx);
                    break;
                end
            end
        end
    end
end

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

    % Corrigir valores de probabilidades para evitar zeros
    probabilidades(probabilidades == 0) = 1e-10; % Evitar zeros nas probabilidades
    probabilidades(probabilidades == 1) = 1 - 1e-10; % Evitar 1 absoluto

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