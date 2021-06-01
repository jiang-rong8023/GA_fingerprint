% ����¼��������Ⱥ����ת��Ϊsnp,��������ʶ��ĸ�����Ŀ��������
function result = genResult(all)
    global info
    global ID
    global sampleName
    snp = cell2mat(all(:, 1));
    num = cell2mat(all(:, 2));
    [NUM, index] = sort(num, 'descend');
    SNP = snp(index,:);
    
    h = waitbar(0, '���������...');
    for k = 1:size(snp,1)
        opt1(k,:) = {info(snp(k,:))};
        opt2(k,:) = {ID(snp(k,:))};
        opt3(k,:) = {sampleName(all{k, 3})};
%         all{k, 3} = sampleName(all{k, 3});
        %��������ʾ
        str = ['���������...', sprintf('%.1f',k/size(snp,1)*100), '%'];
        waitbar(k/size(snp,1), h, str)
    end
    delete(h)
    all(:, 1) = opt1;
    all(:, end+1) = opt2;
    all(:, end+1) = opt3;
    result = all(index,:);  
end