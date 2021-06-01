%子程序：新种群变异操作，函数名储存为mutation.m  ？？？？？？
function snnew=mutation(snew,pmutation, numMu)
global snp
BitLength=size(snew,2);
snnew=snew;
temp = snew;
pmm=IfCroIfMut(pmutation);%根据变异概率决定是否进行变异操作，1则是，0则否
if pmm==1
    chb=randperm(size(snnew, 2), numMu);%在[1,BitLength]范围内随机产生numMu个变异位
    temp(chb)= [];
    chromosome = setdiff(1:size(snp, 1), temp);
    gene_index = randperm(numel(chromosome), numMu);
    snnew(chb)=chromosome(gene_index);
end

