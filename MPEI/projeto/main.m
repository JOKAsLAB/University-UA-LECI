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

% 3. Recomendação com base em um jogo exemplo
jogoExemplo = 'Minecraft'; 
disp(['Recomendando jogos VR para: ', jogoExemplo]);

% 4. Executar os módulos necessários
bloomResultado = executarBloomFilter(jogoExemplo, nomesNormais, tagsNormais, tagsVR, nomesVR);
naiveResultado = executarNaiveBayes(jogoExemplo, tagsNormais, nomesNormais, tagsVR, nomesVR);
minhashResultado = executarMinHash(jogoExemplo, tagsNormais, tagsVR, nomesNormais, nomesVR);

% 5. Obter as recomendações
jogosRecomendados = recomendarJogosVR(bloomResultado, naiveResultado, minhashResultado, nomesVR);

% 6. Exibir os resultados
disp('Jogos VR Recomendados:');
disp(jogosRecomendados);
