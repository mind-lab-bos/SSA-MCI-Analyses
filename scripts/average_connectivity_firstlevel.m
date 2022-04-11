%Isolate the auditory-auditory section of the matrix
adulthood_auditory = Z(1:18,1:18,:);

%Isolate the top half of the corr matrix for each liking rating (aud-aud)
for sub = 1:21
    
    temp = adulthood_auditory(:,:,sub);
    adulthood_auditory_byparticipant(:,sub) = temp(find(~tril(ones(size(temp)))));
    adulthood_auditory_participant_mean = mean(adulthood_auditory_byparticipant);    
end
adulthood_auditory_participant_mean = adulthood_auditory_participant_mean'

%Isolate the reward-reward section of the matrix
adulthood_reward = Z(19:36,19:36,:);

%Isolate the top half of the corr matrix for each liking rating (aud-aud)
for sub = 1:21
    
    temp = adulthood_reward(:,:,sub);
    adulthood_reward_byparticipant(:,sub) = temp(find(~tril(ones(size(temp)))));
    adulthood_reward_participant_mean = mean(adulthood_reward_byparticipant);    
end
adulthood_reward_participant_mean = adulthood_reward_participant_mean'

%Isolate the auditory-reward section of the matrix
adulthood_reward_auditory = Z(1:18,19:36,:);

%Get the mean for each participant across the matrix (aud-rew)
for sub = 1:21
    
    adulthood_auditory_reward_mean(:,sub) = mean(adulthood_reward_auditory(:,:,sub), 'all');
end

adulthood_auditory_reward_mean = adulthood_auditory_reward_mean'


%mpfc - auditory + reward
adulthood_mpfc_auditory_reward=Z(1:36,31,:);

%Get the mean for each participant across the matrix (mpfc-aud/rew)
for sub = 1:21
    
    adulthood_mpfc_auditory_reward_mean(:,sub) = nanmean(adulthood_mpfc_auditory_reward(:,:,sub), 'all');
end
adulthood_mpfc_auditory_reward_mean = adulthood_mpfc_auditory_reward_mean'

%mpfc - auditory
adulthood_mpfc_auditory=Z(1:18,31,:);

%Get the mean for each participant across the matrix (mpfc-aud/rew)
for sub = 1:21
    
    adulthood_mpfc_auditory_mean(:,sub) = nanmean(adulthood_mpfc_auditory(:,:,sub), 'all');
end
adulthood_mpfc_auditory_mean = adulthood_mpfc_auditory_mean'

%mpfc - reward
adulthood_mpfc_reward=Z(19:36,31,:);

%Get the mean for each participant across the matrix (mpfc-aud/rew)
for sub = 1:21
    
    adulthood_mpfc_reward_mean(:,sub) = nanmean(adulthood_mpfc_reward(:,:,sub), 'all');
end
adulthood_mpfc_reward_mean = adulthood_mpfc_reward_mean'

%mpfc - vstr
adulthood_mpfc_nac=Z(29:30,31,:);

%Get the mean for each participant across the matrix (mpfc-aud/rew)
for sub = 1:21
    
    adulthood_mpfc_nac_mean(:,sub) = nanmean(adulthood_mpfc_nac(:,:,sub), 'all');
end
adulthood_mpfc_nac_mean = adulthood_mpfc_nac_mean'

%mpfc - str
adulthood_mpfc_str=Z([19:20,29:30],31,:);

%Get the mean for each participant across the matrix (mpfc-aud/rew)
for sub = 1:21
    
    adulthood_mpfc_str_mean(:,sub) = nanmean(adulthood_mpfc_str(:,:,sub), 'all');
end
adulthood_mpfc_str_mean = adulthood_mpfc_str_mean'

%str
adulthood_str=Z(19:20,29:30,:);

%Get the mean for each participant across the matrix
for sub = 1:21
    
    adulthood_str_mean(:,sub) = nanmean(adulthood_str(:,:,sub), 'all');
end
adulthood_str_mean = adulthood_str_mean'

%str - auditory
adulthood_str_auditory=Z([19:20,29:30], 1:18,:);

%Get the mean for each participant across the matrix
for sub = 1:21
    
    adulthood_str_auditory_mean(:,sub) = nanmean(adulthood_str_auditory(:,:,sub), 'all');
end
adulthood_str_auditory_mean = adulthood_str_auditory_mean'

%nac - auditory
adulthood_nac_auditory=Z(29:30, 1:18,:);

%Get the mean for each participant across the matrix
for sub = 1:21
    
    adulthood_nac_auditory_mean(:,sub) = nanmean(adulthood_nac_auditory(:,:,sub), 'all');
end
adulthood_nac_auditory_mean = adulthood_nac_auditory_mean'

writematrix(adulthood_auditory_participant_mean, 'adulthood_auditory_participant_mean.csv')
writematrix(adulthood_reward_participant_mean, 'adulthood_reward_participant_mean.csv')
writematrix(adulthood_auditory_participant_mean, 'adulthood_auditory_participant_mean.csv')
writematrix(adulthood_auditory_reward_mean, 'adulthood_reward_auditory_mean.csv')
writematrix(adulthood_mpfc_auditory_reward_mean, 'adulthood_mpfc_auditory_reward_mean.csv')
writematrix(adulthood_mpfc_auditory_mean, 'adulthood_mpfc_auditory_mean.csv')
writematrix(adulthood_mpfc_reward_mean, 'adulthood_mpfc_reward_mean.csv')
writematrix(adulthood_mpfc_nac_mean, 'adulthood_mpfc_nac.csv')
writematrix(adulthood_mpfc_str_mean, 'adulthood_mpfc_str.csv')
writematrix(adulthood_str_auditory_mean, 'adulthood_str_auditory_mean.csv')
writematrix(adulthood_nac_auditory_mean, 'adulthood_nac_auditory_mean.csv')
