clc
clear
%% 全局变量定义
global ge 
global snp
global ID
global info
global sampleName
%% 数据导入
load data.mat 
snp = data{2};
ID = data{3};
info = data{4};
ge = data{5};
sampleName = data{6};
%% 参数初始化
init.popsize=50;         %初始种群大小
init.chr=10000;            %每个个体染色体个数,即对应snp的长度
init.Generationmax=100;  %最大迭代次数
init.pcrossover=0.80;    %交配概率
init.pmutation=0.5;      %变异概率
init.numMu = 0.3;        %变异的点的比率
%% 遗传算法优化
[result, fitmean, fitmax] = genetic(init);
%% 最优SNP组合中所有SNP的信息
maxValue = max(cell2mat((result(:,2)))); % snp识别个数最多
maxInx = numel(find(cell2mat((result(:,2))) == maxValue));

reGene = {};
for kk = 1:maxInx
    bestSnp = cell2mat(result(kk,1));
    id = cell2mat(result(kk,3));
    gene = [];
    for k = 1:numel(bestSnp)
        gene(end+1, :) = data{:,1}(bestSnp(k), :);
    end
    reGene(end+1, :) = {char(gene(:, id)'), cell2mat(result(kk,1)), cell2mat(result(kk,2)), cell2mat(result(kk,3)), result(kk,4)};  % 最优snp组合所有的snp 
end
%% 每个个体对应的SNP组合及概率
index = [];
for k = 1:numel(result(:,3))
    index = [index, [result{k,3};ones(1, numel(result{k,3}))*k]];
end
eachSnp = {};
for k = 1:size(data{1,1}, 2)
    idSnp = find(index(1,:)==k);
    eachSnp{end+1} = result(index(2, idSnp), 2:2:4);  %每个个体对应的SNP组合ID
end
%% 结果展示
snpDisplay(reGene, fitmean, fitmax)



