function [result, ymean, ymax] = genetic(init)
    global ge 
    global snp
    global info
    % 参数
    popsize=init.popsize;         %初始种群大小
    chr = init.chr;            %每个个体染色体个数,即对应snp的长度
    Generationmax=init.Generationmax;   %最大迭代次数
    pcrossover=init.pcrossover;    %交配概率
    pmutation=init.pmutation;      %变异概率
    numMu = ceil(init.chr*init.numMu); %变异的点位个数
    %产生初始种群
    pop = [];
    num = 0;
    while num<popsize
        pop(end+1, :)= randperm(size(snp, 1), chr);
        pop = deletRepeat(pop);  % 丢弃重复个体
        num = size(pop, 1);
    end
    %记录所有能识别个体的SNP
    all = {};

    [Fitvalue,cumsump, temp] = fitness(pop);
    all = [all; temp];
    h = waitbar(0, '优化中...');
    for k =1:Generationmax
        for j=1:2:popsize
            %选择操作
            seln=selection(pop,cumsump);
            %交叉操作
            scro=crossover(pop,seln,pcrossover);
            scnew(j,:)=scro(1,:);
            scnew(j+1,:)=scro(2,:);
            %变异操作
            smnew(j,:)=mutation(scnew(j,:),pmutation, numMu);
            smnew(j+1,:)=mutation(scnew(j+1,:),pmutation, numMu);
        end
        pop=[pop; smnew];  %产生了新的种群
        pop = deletRepeat(pop);  % 丢弃重复个体
        [Fitvalue, cumsump, temp]= fitness(pop);

        all = deletsnp([all; temp]); % 记录所有snp

        [f, index] = sort(Fitvalue, 'descend'); % 适应度从大到小排序
        pop = pop(index(1:popsize), :);  % 保留适应度较大的个体，淘汰适应度较低的个体
        %计算新种群的适应度
        [Fitvalue, cumsump]=fitness(pop);
        %记录当前 代最好的适应度和平均适应度
        [fmax,nmax]=max(Fitvalue);
        fmean=mean(Fitvalue);
        ymax(k)=fmax;
        ymean(k)=fmean;
        %记录当代最佳染色体个体
        x = pop(nmax,:);
        xmax(k,:)=x;

        %进度条显示
        str = ['优化中...', sprintf('%.1f',k/Generationmax*100), '%'];
        waitbar(k/Generationmax, h, str)
    end
    delete(h)

    result = genResult(all);
end