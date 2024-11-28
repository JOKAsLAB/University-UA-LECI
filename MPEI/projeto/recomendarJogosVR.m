
function jogosRecomendados = recomendarJogosVR(bloomResultado, naiveResultado, minhashResultado, nomesVR)
    if ~iscell(bloomResultado), bloomResultado = cellstr(bloomResultado); end
    if ~iscell(naiveResultado), naiveResultado = cellstr(naiveResultado); end
    if ~iscell(minhashResultado), minhashResultado = cellstr(minhashResultado); end
    
    scores = zeros(size(nomesVR));
    
    pesoBloom = 1;
    pesoNaive = 2;
    pesoMinhash = 3;
    
    scores(ismember(nomesVR, bloomResultado)) = scores(ismember(nomesVR, bloomResultado)) + pesoBloom;
    scores(ismember(nomesVR, naiveResultado)) = scores(ismember(nomesVR, naiveResultado)) + pesoNaive;
    scores(ismember(nomesVR, minhashResultado)) = scores(ismember(nomesVR, minhashResultado)) + pesoMinhash;
    
    [~, ordem] = sort(scores, 'descend');
    jogosRecomendados = nomesVR(ordem(1:5));
end
