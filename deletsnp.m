% É¾³ýÖØ¸´¼ÇÂ¼µÄsnp
function new = deletsnp(all)
    snp = cell2mat(all(:, 1));
    [unsnp,index] = unique(snp, 'rows');
    new = all(index, :);
end