%种群和snp之间的转换
function pe = pop2snp(pop)
    global ge 
    global snp
    pe = {}; %每个个体对应的snp
    [m n] = size(pop);
    for i = 1:m  %依次读取每个个体的染色
        for j = 1:size(snp, 2) % 一次取每个样本的snp
            pe{i, j} = char(snp(pop(i, :), j)'); %每个个体对应的snp   
        end
    end
end