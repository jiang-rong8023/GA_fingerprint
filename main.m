clc
clear
%% Global variable definition
global ge 
global snp
global ID
global info
global sampleName
%% Data import
load data.mat 
snp = data{2};
ID = data{3};
info = data{4};
ge = data{5};
sampleName = data{6};
%% Parameter initialization
init.popsize=50;         %Initial population size
init.chr=10000;            %The numb of chromosomes in each individual, i. e. that length of the correspond snp
init.Generationmax=100;  %Maximum number of iterations
init.pcrossover=0.80;    %Mating probability
init.pmutation=0.5;      %Mutation probability
init.numMu = 0.3;        %Ratio of mutated points
%% Genetic algorithm optimization
[result, fitmean, fitmax] = genetic(init);
%% Information of all SNPs in the optimal snp combination
maxValue = max(cell2mat((result(:,2)))); % Snp has the largest number of recognitions
maxInx = numel(find(cell2mat((result(:,2))) == maxValue));

reGene = {};
for kk = 1:maxInx
    bestSnp = cell2mat(result(kk,1));
    id = cell2mat(result(kk,3));
    gene = [];
    for k = 1:numel(bestSnp)
        gene(end+1, :) = data{:,1}(bestSnp(k), :);
    end
    reGene(end+1, :) = {char(gene(:, id)'), cell2mat(result(kk,1)), cell2mat(result(kk,2)), cell2mat(result(kk,3)), result(kk,4)};  % Optimal snp combination all SNPs
end
%% SNP combination and probability corresponding to each individual
index = [];
for k = 1:numel(result(:,3))
    index = [index, [result{k,3};ones(1, numel(result{k,3}))*k]];
end
eachSnp = {};
for k = 1:size(data{1,1}, 2)
    idSnp = find(index(1,:)==k);
    eachSnp{end+1} = result(index(2, idSnp), 2:2:4);  %SNP combination ID corresponding to each individual
end
%% Results show
snpDisplay(reGene, fitmean, fitmax)



