function snpDisplay(reGene, ymean, ymax)
    for k = 1:size(reGene, 1)
        fprintf('���ŵ�snp-%sΪ:\n', num2str(k))
        for kkk = 1:size(reGene{k,5}{1}, 1)
            fprintf('\t%s\n', reGene{k,5}{1}{kkk})
        end
        fprintf('\n');
    end
    fprintf('���ŵ�snpʶ�������ĿΪ��%s\n', num2str(cell2mat(reGene(1,3))));
    fprintf('���ŵ�snp����Ӧ��Ϊ��%.4d\n', ymax(end));

    %���ƾ����Ŵ���������Ӧ�����ߡ�һ��ģ�������������е���Ⱥ��ƽ����Ӧ��
    %�������Ӧ�������������໥��ͬ����̬����ʾ�㷨�������еĺ�˳����û�г����𵴣�
    %������ǰ���£������Ӧ�ȸ����������ɴ���û�з���������ʾ��Ⱥ�Ѿ�����
    figure(1);
    hand1=plot(ymax);
    set(hand1,'linestyle','-','linewidth',1.0,'marker','*','markersize',6);
    hold on;
    hand2=plot(ymean);
    set(hand2,'color','r','linestyle','-','linewidth',1.0,'marker','h','markersize',6);
    xlabel('��������');
    ylabel('���/ƽ����Ӧ��');
    hold off;
    legend('����snp��Ӧ��','��Ⱥƽ����Ӧ��')
    title('�Ŵ��㷨�Ż�snp')
end