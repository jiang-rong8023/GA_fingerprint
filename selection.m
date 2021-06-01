%子程序：新物种选择操作，函数名存储为selsction.m
function seln=selection(population,cumsump)
%从种群中选择两个个体
for i=1:2
    r=rand;
    prand=cumsump-r;%产生一个随机数
    j=1;
    while prand(j)<0
       j=j+1; 
    end
    seln(i)=j;   %选中个体的序号
end