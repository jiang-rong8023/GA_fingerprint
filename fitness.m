%������Ӧ�ȣ�������Ӧ��Fitvalue���ۼƸ���cumsump���Լ���ʶ��ĸ����snp
function [Fitvalue, cumsump, temp] = fitness(pop)
    %pe��Ⱥ��Ӧ��snp; ps��snp��Ӧ�ĸ���
    pe = pop2snp(pop);
    popsize = size(pop, 1);

    Fitvalue = [];
    temp = {};
    for k = 1:size(pe, 1)
        copy_num = tabulate(pe(k,:)); % snp�ظ��ĸ���
        id_tabul = find(cell2mat(copy_num(:,2))==1);  % ��һ�޶�snp��id  ?????????  
        id = [];
        for kk = 1:numel(id_tabul)   % ��Ѱ������id
            [~, inx]=ismember(copy_num{id_tabul(kk),1}, pe(k,:));
            id(end+1) = inx;
        end
        num = numel(id_tabul);  % ��ʶ��������Ŀ 
        if num>0
            Fitvalue(end+1) = num;  % ��Ӧ�ȼ���   
            temp(end+1,:) = {pop(k,:), num, id};
        else
            Fitvalue(end+1) = 0;  % ��Ӧ�ȼ���
        end
    end
    %����ѡ�����
    fsum=sum(Fitvalue);
    Pperpopulation=Fitvalue/fsum;
    %�����ۼƸ���
    cumsump(1)=Pperpopulation(1);
    for i=2:popsize
        cumsump(i)=cumsump(i-1)+Pperpopulation(i);
    end
    cumsump=cumsump';
end