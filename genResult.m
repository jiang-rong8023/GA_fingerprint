% 将记录的所有种群个体转换为snp,并根据能识别的个体数目进行排序
function result = genResult(all)
    global info
    global ID
    global sampleName
    snp = cell2mat(all(:, 1));
    num = cell2mat(all(:, 2));
    [NUM, index] = sort(num, 'descend');
    SNP = snp(index,:);
    
    h = waitbar(0, '结果生成中...');
    for k = 1:size(snp,1)
        opt1(k,:) = {info(snp(k,:))};
        opt2(k,:) = {ID(snp(k,:))};
        opt3(k,:) = {sampleName(all{k, 3})};
%         all{k, 3} = sampleName(all{k, 3});
        %进度条显示
        str = ['结果生成中...', sprintf('%.1f',k/size(snp,1)*100), '%'];
        waitbar(k/size(snp,1), h, str)
    end
    delete(h)
    all(:, 1) = opt1;
    all(:, end+1) = opt2;
    all(:, end+1) = opt3;
    result = all(index,:);  
end