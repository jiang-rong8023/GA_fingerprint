%计算适应度，返回适应度Fitvalue和累计概率cumsump，以及能识别的个体的snp
function [Fitvalue, cumsump, temp] = fitness(pop)
    %pe种群对应的snp; ps是snp对应的概率
    pe = pop2snp(pop);
    popsize = size(pop, 1);

    Fitvalue = [];
    temp = {};
    for k = 1:size(pe, 1)
        copy_num = tabulate(pe(k,:)); % snp重复的概率
        id_tabul = find(cell2mat(copy_num(:,2))==1);  % 独一无二snp的id  ?????????  
        id = [];
        for kk = 1:numel(id_tabul)   % 找寻真正的id
            [~, inx]=ismember(copy_num{id_tabul(kk),1}, pe(k,:));
            id(end+1) = inx;
        end
        num = numel(id_tabul);  % 能识别个体的数目 
        if num>0
            Fitvalue(end+1) = num;  % 适应度计算   
            temp(end+1,:) = {pop(k,:), num, id};
        else
            Fitvalue(end+1) = 0;  % 适应度计算
        end
    end
    %计算选择概率
    fsum=sum(Fitvalue);
    Pperpopulation=Fitvalue/fsum;
    %计算累计概率
    cumsump(1)=Pperpopulation(1);
    for i=2:popsize
        cumsump(i)=cumsump(i-1)+Pperpopulation(i);
    end
    cumsump=cumsump';
end