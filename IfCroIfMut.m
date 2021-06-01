%子程序：判断遗传运算是否需要进行交叉或者变异，函数名储存为IfCroIfMut.m
function pcc=IfCroIfMut(mutORcro)
test(1:100)=0;
l=round(100*mutORcro);
test(1:l)=1;
n=round(rand*99)+1;
pcc=test(n);