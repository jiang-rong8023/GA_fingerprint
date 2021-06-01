%子程序：新种群交叉操作，函数名存储为 crossover.m    ？？？？？
function scro=crossover(population,seln,pc)
BitLength=size(population,2);
pcc=IfCroIfMut(pc);%更具交叉概率决定是否进行交叉操作，1是，0则否
if pcc==1
    chb=round(rand*(BitLength-2))+1;%在[1,BitLength-1]范围内随机产生一个交叉位
    scro(1,:)=[population(seln(1),1:chb) population(seln(2),chb+1:BitLength)];
    scro(2,:)=[population(seln(2),1:chb) population(seln(1),chb+1:BitLength)];
    scro(1,:) = lookup(scro(1,:));
    scro(2,:) = lookup(scro(2,:));
else
    scro(1,:)=population(seln(1),:);
    scro(2,:)=population(seln(2),:);
end
end

function x = lookup(x)
    global snp
    look = tabulate(x);
    repeat = look(look(:,2)>1, 1);
    chromosome = setdiff(1:size(snp, 1), x);
    gene_index = randperm(numel(chromosome), numel(repeat));
    gene = chromosome(gene_index);
    for k=1:numel(repeat)
        index = find(x==repeat(k));
        x(index(1)) = gene(k);
    end
end