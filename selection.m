%�ӳ���������ѡ��������������洢Ϊselsction.m
function seln=selection(population,cumsump)
%����Ⱥ��ѡ����������
for i=1:2
    r=rand;
    prand=cumsump-r;%����һ�������
    j=1;
    while prand(j)<0
       j=j+1; 
    end
    seln(i)=j;   %ѡ�и�������
end