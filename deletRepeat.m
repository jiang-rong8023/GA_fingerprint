% 丢弃种群中的重复个体
function population = deletRepeat(pop)
    pop = sort(pop, 2);
    population = unique(pop, 'rows');
end
