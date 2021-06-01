function snpDisplay(reGene, ymean, ymax)
    for k = 1:size(reGene, 1)
        fprintf('最优的snp-%s为:\n', num2str(k))
        for kkk = 1:size(reGene{k,5}{1}, 1)
            fprintf('\t%s\n', reGene{k,5}{1}{kkk})
        end
        fprintf('\n');
    end
    fprintf('最优的snp识别个体数目为：%s\n', num2str(cell2mat(reGene(1,3))));
    fprintf('最优的snp的适应度为：%.4d\n', ymax(end));

    %绘制经过遗传运算后的适应度曲线。一般的，如果进化过程中的种群的平均适应度
    %与最大适应度在曲线上有相互趋同的形态，表示算法收敛进行的很顺利，没有出现震荡；
    %在这种前提下，最大适应度个体连续若干代都没有发生进化表示种群已经成熟
    figure(1);
    hand1=plot(ymax);
    set(hand1,'linestyle','-','linewidth',1.0,'marker','*','markersize',6);
    hold on;
    hand2=plot(ymean);
    set(hand2,'color','r','linestyle','-','linewidth',1.0,'marker','h','markersize',6);
    xlabel('进化代数');
    ylabel('最大/平均适应度');
    hold off;
    legend('最优snp适应度','种群平均适应度')
    title('遗传算法优化snp')
end