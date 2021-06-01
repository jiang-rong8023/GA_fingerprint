function [result, ymean, ymax] = genetic(init)
    global ge 
    global snp
    global info
    % ����
    popsize=init.popsize;         %��ʼ��Ⱥ��С
    chr = init.chr;            %ÿ������Ⱦɫ�����,����Ӧsnp�ĳ���
    Generationmax=init.Generationmax;   %����������
    pcrossover=init.pcrossover;    %�������
    pmutation=init.pmutation;      %�������
    numMu = ceil(init.chr*init.numMu); %����ĵ�λ����
    %������ʼ��Ⱥ
    pop = [];
    num = 0;
    while num<popsize
        pop(end+1, :)= randperm(size(snp, 1), chr);
        pop = deletRepeat(pop);  % �����ظ�����
        num = size(pop, 1);
    end
    %��¼������ʶ������SNP
    all = {};

    [Fitvalue,cumsump, temp] = fitness(pop);
    all = [all; temp];
    h = waitbar(0, '�Ż���...');
    for k =1:Generationmax
        for j=1:2:popsize
            %ѡ�����
            seln=selection(pop,cumsump);
            %�������
            scro=crossover(pop,seln,pcrossover);
            scnew(j,:)=scro(1,:);
            scnew(j+1,:)=scro(2,:);
            %�������
            smnew(j,:)=mutation(scnew(j,:),pmutation, numMu);
            smnew(j+1,:)=mutation(scnew(j+1,:),pmutation, numMu);
        end
        pop=[pop; smnew];  %�������µ���Ⱥ
        pop = deletRepeat(pop);  % �����ظ�����
        [Fitvalue, cumsump, temp]= fitness(pop);

        all = deletsnp([all; temp]); % ��¼����snp

        [f, index] = sort(Fitvalue, 'descend'); % ��Ӧ�ȴӴ�С����
        pop = pop(index(1:popsize), :);  % ������Ӧ�Ƚϴ�ĸ��壬��̭��Ӧ�Ƚϵ͵ĸ���
        %��������Ⱥ����Ӧ��
        [Fitvalue, cumsump]=fitness(pop);
        %��¼��ǰ ����õ���Ӧ�Ⱥ�ƽ����Ӧ��
        [fmax,nmax]=max(Fitvalue);
        fmean=mean(Fitvalue);
        ymax(k)=fmax;
        ymean(k)=fmean;
        %��¼�������Ⱦɫ�����
        x = pop(nmax,:);
        xmax(k,:)=x;

        %��������ʾ
        str = ['�Ż���...', sprintf('%.1f',k/Generationmax*100), '%'];
        waitbar(k/Generationmax, h, str)
    end
    delete(h)

    result = genResult(all);
end