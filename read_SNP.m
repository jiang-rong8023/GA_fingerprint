clc
clear
%% File path and read file
path = 'F:\sd\sd.vcf';
lossRate = 0; % Missing rate
abRate = 1;   % Ab ratio
%% Read the variable store for the file
data=fopen(path);
k = 0;
SNP = [];
snp = [];
ID = {};
info = [];
disp('Reading. vcf file...')
while 1
    tline = fgetl(data);
    if ~ischar(tline)
        break;
    end
    if tline(1:2) == '##'
        continue;
    elseif tline(1) == '#'
        sampleName = regexp(tline, '\t', 'split');
        sampleName = sampleName(10:end);
    else
      k = k+1;
        SS = regexp(tline, '\t', 'split');
        S = SS(10:end);
        S_NP = [];
        for t=1:length(S)
            switch S{t}(1:3)
                case '0/0'
                    ss = 97;
                case '1/1'
                    ss = 98;
                case '0/1'
                    ss = 104; 
                case './.'
                    ss = 45;
            end
            S_NP(end+1) = ss;
        end
        SNP(end+1,:)= S_NP;
           
 
        %------------------condition---------------%
%         if numel(find(S_NP==45))<lossRate*length(S_NP)
%             continue
%         end
        %------------------condition---------------%
        
%        a = numel(find(S_NP==97));
%        b = numel(find(S_NP==98));
%        h = numel(find(S_NP==104));
%        ab = a + b;
        
        %------------------condition---------------%
         if 97>=400 || 98>=400 || 104<=10 || 45<=10
             continue
         end
        %------------------condition---------------%
        
        snp(end+1, :) = S_NP;
        info(end+1) = k;
        ID(end+1, :) = SS(3);  % str2num(SS{3})
    end
end
fclose(data);
ge = [45 97 98 104];
disp('. vcf file read complete！')
data = {SNP, snp, ID, info, ge, sampleName};
save data.mat data
disp('The calculation ends and the data.mat file is saved in the current path！')
