% ������Ⱥ�е��ظ�����
function population = deletRepeat(pop)
    pop = sort(pop, 2);
    population = unique(pop, 'rows');
end
