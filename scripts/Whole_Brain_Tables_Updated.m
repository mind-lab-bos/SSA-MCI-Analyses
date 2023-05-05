%Older Adults pre

%defining and loading rois
cd '/scratch/kathios.n/SSA_analysis/univariate/ROIs'
roi_list = dir('*.mat');

%define subjects
cd '/Volumes/Promise_Pegasus/mci_spm_musbid/pre';
sublistYA = struct('path', {'/scratch/kathios.n/SSA_analysis/univariate/first_level/190904GHER1','/scratch/kathios.n/SSA_analysis/univariate/first_level/220914GHER1', '/scratch/kathios.n/SSA_analysis/univariate/first_level/AEHR', '/scratch/kathios.n/SSA_analysis/univariate/first_level/ASHA', '/scratch/kathios.n/SSA_analysis/univariate/first_level/BFOR', '/scratch/kathios.n/SSA_analysis/univariate/first_level/CWEI', '/scratch/kathios.n/SSA_analysis/univariate/first_level/DFAI', '/scratch/kathios.n/SSA_analysis/univariate/first_level/DMET', '/scratch/kathios.n/SSA_analysis/univariate/first_level/DMUN', '/scratch/kathios.n/SSA_analysis/univariate/first_level/EHER', '/scratch/kathios.n/SSA_analysis/univariate/first_level/EKAS', '/scratch/kathios.n/SSA_analysis/univariate/first_level/ELAR', '/scratch/kathios.n/SSA_analysis/univariate/first_level/EROS', '/scratch/kathios.n/SSA_analysis/univariate/first_level/FKEE', '/scratch/kathios.n/SSA_analysis/univariate/first_level/GCAS', '/scratch/kathios.n/SSA_analysis/univariate/first_level/GSHA', '/scratch/kathios.n/SSA_analysis/univariate/first_level/JDEN', '/scratch/kathios.n/SSA_analysis/univariate/first_level/JKAY', '/scratch/kathios.n/SSA_analysis/univariate/first_level/JPRE', '/scratch/kathios.n/SSA_analysis/univariate/first_level/JSCH', '/scratch/kathios.n/SSA_analysis/univariate/first_level/LDIR', '/scratch/kathios.n/SSA_analysis/univariate/first_level/LGEN', '/scratch/kathios.n/SSA_analysis/univariate/first_level/LJAC', '/scratch/kathios.n/SSA_analysis/univariate/first_level/LOLE', '/scratch/kathios.n/SSA_analysis/univariate/first_level/MBLO', '/scratch/kathios.n/SSA_analysis/univariate/first_level/NLEN', '/scratch/kathios.n/SSA_analysis/univariate/first_level/OADE', '/scratch/kathios.n/SSA_analysis/univariate/first_level/SCAE', '/scratch/kathios.n/SSA_analysis/univariate/first_level/TCIE', '/scratch/kathios.n/SSA_analysis/univariate/first_level/TSTA'});

%define empty array
vocalnonvocalROIs = cell(1, numel(sublistYA));

marsbar('on')
%loop through all participants and ROIs
for subs = 1:numel(sublistYA)
% Make marsbar design object
D = mardo(strcat(sublistYA(subs).path, '/', 'SPM.mat'));
% Set fmristat AR modelling
D = autocorr(D, 'fmristat', 2);

    for rois = 1:numel(roi_list)
        % Make marsbar ROI object
        R(rois, subs) = maroi(strcat(roi_list(rois).folder,'/',roi_list(rois).name));
        % Fetch data into marsbar data object
        Y  = get_marsy(R(rois), D, 'mean');
        %Summarize data
        vocalnonvocalROIs{subs}(:, rois) = summary_data(marsy(Y));
    end
end
