%�ӳ�������Ⱥ�������������������Ϊmutation.m  ������������
function snnew=mutation(snew,pmutation, numMu)
global snp
BitLength=size(snew,2);
snnew=snew;
temp = snew;
pmm=IfCroIfMut(pmutation);%���ݱ�����ʾ����Ƿ���б��������1���ǣ�0���
if pmm==1
    chb=randperm(size(snnew, 2), numMu);%��[1,BitLength]��Χ���������numMu������λ
    temp(chb)= [];
    chromosome = setdiff(1:size(snp, 1), temp);
    gene_index = randperm(numel(chromosome), numMu);
    snnew(chb)=chromosome(gene_index);
end

