%��Ⱥ��snp֮���ת��
function pe = pop2snp(pop)
    global ge 
    global snp
    pe = {}; %ÿ�������Ӧ��snp
    [m n] = size(pop);
    for i = 1:m  %���ζ�ȡÿ�������Ⱦɫ
        for j = 1:size(snp, 2) % һ��ȡÿ��������snp
            pe{i, j} = char(snp(pop(i, :), j)'); %ÿ�������Ӧ��snp   
        end
    end
end