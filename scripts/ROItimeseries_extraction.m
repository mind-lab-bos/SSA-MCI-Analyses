
%load onsets
load('onsets.txt');
load('roiactivation2.mat')
sublistYA = struct('path', {'/scratch/kathios.n/SSA_analysis/SSA_only/SSA_analysis/univariate_SSAonly/first_level/190904GHER1','/scratch/kathios.n/SSA_analysis/SSA_only/SSA_analysis/univariate_SSAonly/first_level/220914GHER1', '/scratch/kathios.n/SSA_analysis/SSA_only/SSA_analysis/univariate_SSAonly/first_level/AEHR', '/scratch/kathios.n/SSA_analysis/SSA_only/SSA_analysis/univariate_SSAonly/first_level/ASHA', '/scratch/kathios.n/SSA_analysis/SSA_only/SSA_analysis/univariate_SSAonly/first_level/BFOR', '/scratch/kathios.n/SSA_analysis/SSA_only/SSA_analysis/univariate_SSAonly/first_level/CWEI', '/scratch/kathios.n/SSA_analysis/SSA_only/SSA_analysis/univariate_SSAonly/first_level/DFAI', '/scratch/kathios.n/SSA_analysis/SSA_only/SSA_analysis/univariate_SSAonly/first_level/DMET', '/scratch/kathios.n/SSA_analysis/SSA_only/SSA_analysis/univariate_SSAonly/first_level/DMUN', '/scratch/kathios.n/SSA_analysis/SSA_only/SSA_analysis/univariate_SSAonly/first_level/EHER', '/scratch/kathios.n/SSA_analysis/SSA_only/SSA_analysis/univariate_SSAonly/first_level/EKAS', '/scratch/kathios.n/SSA_analysis/SSA_only/SSA_analysis/univariate_SSAonly/first_level/ELAR', '/scratch/kathios.n/SSA_analysis/SSA_only/SSA_analysis/univariate_SSAonly/first_level/EROS', '/scratch/kathios.n/SSA_analysis/SSA_only/SSA_analysis/univariate_SSAonly/first_level/FKEE', '/scratch/kathios.n/SSA_analysis/SSA_only/SSA_analysis/univariate_SSAonly/first_level/GCAS', '/scratch/kathios.n/SSA_analysis/SSA_only/SSA_analysis/univariate_SSAonly/first_level/GSHA', '/scratch/kathios.n/SSA_analysis/SSA_only/SSA_analysis/univariate_SSAonly/first_level/JDEN', '/scratch/kathios.n/SSA_analysis/SSA_only/SSA_analysis/univariate_SSAonly/first_level/JKAY', '/scratch/kathios.n/SSA_analysis/SSA_only/SSA_analysis/univariate_SSAonly/first_level/JPRE', '/scratch/kathios.n/SSA_analysis/SSA_only/SSA_analysis/univariate_SSAonly/first_level/JSCH', '/scratch/kathios.n/SSA_analysis/SSA_only/SSA_analysis/univariate_SSAonly/first_level/LDIR', '/scratch/kathios.n/SSA_analysis/SSA_only/SSA_analysis/univariate_SSAonly/first_level/LGEN', '/scratch/kathios.n/SSA_analysis/SSA_only/SSA_analysis/univariate_SSAonly/first_level/LJAC', '/scratch/kathios.n/SSA_analysis/SSA_only/SSA_analysis/univariate_SSAonly/first_level/LOLE', '/scratch/kathios.n/SSA_analysis/SSA_only/SSA_analysis/univariate_SSAonly/first_level/MBLO', '/scratch/kathios.n/SSA_analysis/SSA_only/SSA_analysis/univariate_SSAonly/first_level/NLEN', '/scratch/kathios.n/SSA_analysis/SSA_only/SSA_analysis/univariate_SSAonly/first_level/OADE', '/scratch/kathios.n/SSA_analysis/SSA_only/SSA_analysis/univariate_SSAonly/first_level/SCAE', '/scratch/kathios.n/SSA_analysis/SSA_only/SSA_analysis/univariate_SSAonly/first_level/TCIE', '/scratch/kathios.n/SSA_analysis/SSA_only/SSA_analysis/univariate_SSAonly/first_level/TSTA', '/scratch/kathios.n/SSA_analysis/SSA_only/SSA_analysis/univariate_SSAonly/first_level/MCHA', '/scratch/kathios.n/SSA_analysis/SSA_only/SSA_analysis/univariate_SSAonly/first_level/JBAR', '/scratch/kathios.n/SSA_analysis/SSA_only/SSA_analysis/univariate_SSAonly/first_level/RLIE', '/scratch/kathios.n/SSA_analysis/SSA_only/SSA_analysis/univariate_SSAonly/first_level/ETAL', '/scratch/kathios.n/SSA_analysis/SSA_only/SSA_analysis/univariate_SSAonly/first_level/MCOR'});
%define empty array


%isolate the 42 trs for each trial that correspond with the music listening
updatedDataYA = cell(1, numel(sublistYA));

for i = 1:size(vocalnonvocalROIs,10)
    
   for j =  1:length(onsets)

       updatedDataYA{i}((42*(j-1)+1):42*j, :) = vocalnonvocalROIs{i}(onsets(j):onsets(j) + 41, :);
       
   end
end

meanDataAllYA = cell(1,numel(sublistYA));
for i = 1:size(updatedDataYA, 10)
    
    for j= 1:length(onsets)
        
        meanDataAllYA{i}(j, :) = mean(updatedDataYA{i}((42*(j-1)+1):42*j, :));
        
    end
end

for sub = 1:35
    for roi = 1:2
        substart = ((sub-1)*1440)+1;
        subend = sub*1440;
        roidata(substart:subend,roi) = vocalnonvocalROIs{sub}(:,roi);
    end
end

