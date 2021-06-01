clc
clear
%% ȫ�ֱ�������
global ge 
global snp
global ID
global info
global sampleName
%% ���ݵ���
load data.mat 
snp = data{2};
ID = data{3};
info = data{4};
ge = data{5};
sampleName = data{6};
%% ������ʼ��
init.popsize=50;         %��ʼ��Ⱥ��С
init.chr=10000;            %ÿ������Ⱦɫ�����,����Ӧsnp�ĳ���
init.Generationmax=100;  %����������
init.pcrossover=0.80;    %�������
init.pmutation=0.5;      %�������
init.numMu = 0.3;        %����ĵ�ı���
%% �Ŵ��㷨�Ż�
[result, fitmean, fitmax] = genetic(init);
%% ����SNP���������SNP����Ϣ
maxValue = max(cell2mat((result(:,2)))); % snpʶ��������
maxInx = numel(find(cell2mat((result(:,2))) == maxValue));

reGene = {};
for kk = 1:maxInx
    bestSnp = cell2mat(result(kk,1));
    id = cell2mat(result(kk,3));
    gene = [];
    for k = 1:numel(bestSnp)
        gene(end+1, :) = data{:,1}(bestSnp(k), :);
    end
    reGene(end+1, :) = {char(gene(:, id)'), cell2mat(result(kk,1)), cell2mat(result(kk,2)), cell2mat(result(kk,3)), result(kk,4)};  % ����snp������е�snp 
end
%% ÿ�������Ӧ��SNP��ϼ�����
index = [];
for k = 1:numel(result(:,3))
    index = [index, [result{k,3};ones(1, numel(result{k,3}))*k]];
end
eachSnp = {};
for k = 1:size(data{1,1}, 2)
    idSnp = find(index(1,:)==k);
    eachSnp{end+1} = result(index(2, idSnp), 2:2:4);  %ÿ�������Ӧ��SNP���ID
end
%% ���չʾ
snpDisplay(reGene, fitmean, fitmax)



