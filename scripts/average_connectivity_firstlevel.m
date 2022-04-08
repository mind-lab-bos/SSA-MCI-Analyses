%Isolate the auditory-auditory section of the matrix
childhood_auditory = Z(,1:18,:);

%Isolate the top half of the corr matrix for each liking rating (aud-aud)
for sub = 1:18
    
    temp = childhood_auditory(:,:,sub);
    childhood_auditory_byparticipant(:,sub) = temp(find(~tril(ones(size(temp)))));
    childhood_auditory_participant_mean = mean(childhood_auditory_byparticipant);    
end
childhood_auditory_participant_mean = childhood_auditory_participant_mean'

%Isolate the reward-reward section of the matrix
childhood_reward = Z(19:36,19:36,:);

%Isolate the top half of the corr matrix for each liking rating (aud-aud)
for sub = 1:18
    
    temp = childhood_reward(:,:,sub);
    childhood_reward_byparticipant(:,sub) = temp(find(~tril(ones(size(temp)))));
    childhood_reward_participant_mean = mean(childhood_reward_byparticipant);    
end
childhood_reward_participant_mean = childhood_reward_participant_mean'

%Isolate the auditory-reward section of the matrix
childhood_reward_auditory = Z(1:18,19:36,:);

%Get the mean for each participant across the matrix (aud-rew)
for sub = 1:18
    
    childhood_auditory_reward_mean(:,sub) = mean(childhood_reward_auditory(:,:,sub), 'all');
end

childhood_auditory_reward_mean = childhood_auditory_reward_mean'


%mpfc - auditory + reward
childhood_mpfc_auditory_reward=Z(1:36,31,:);

%Get the mean for each participant across the matrix (mpfc-aud/rew)
for sub = 1:18
    
    childhood_mpfc_auditory_reward_mean(:,sub) = nanmean(childhood_mpfc_auditory_reward(:,:,sub), 'all');
end
childhood_mpfc_auditory_reward_mean = childhood_mpfc_auditory_reward_mean'

%mpfc - auditory
childhood_mpfc_auditory=Z(1:18,31,:);

%Get the mean for each participant across the matrix (mpfc-aud/rew)
for sub = 1:18
    
    childhood_mpfc_auditory_mean(:,sub) = nanmean(childhood_mpfc_auditory(:,:,sub), 'all');
end
childhood_mpfc_auditory_mean = childhood_mpfc_auditory_mean'

%mpfc - reward
childhood_mpfc_reward=Z(19:36,31,:);

%Get the mean for each participant across the matrix (mpfc-aud/rew)
for sub = 1:18
    
    childhood_mpfc_reward_mean(:,sub) = nanmean(childhood_mpfc_reward(:,:,sub), 'all');
end
childhood_mpfc_reward_mean = childhood_mpfc_reward_mean'

%mpfc - vstr
childhood_mpfc_nac=Z(29:30,31,:);

%Get the mean for each participant across the matrix (mpfc-aud/rew)
for sub = 1:18
    
    childhood_mpfc_nac_mean(:,sub) = nanmean(childhood_mpfc_nac(:,:,sub), 'all');
end
childhood_mpfc_nac_mean = childhood_mpfc_nac_mean'

%mpfc - str
childhood_mpfc_str=Z([19:20,29:30],31,:);

%Get the mean for each participant across the matrix (mpfc-aud/rew)
for sub = 1:18
    
    childhood_mpfc_str_mean(:,sub) = nanmean(childhood_mpfc_str(:,:,sub), 'all');
end
childhood_mpfc_str_mean = childhood_mpfc_str_mean'

%str
childhood_str=Z(19:20,29:30,:);

%Get the mean for each participant across the matrix
for sub = 1:18
    
    childhood_str_mean(:,sub) = nanmean(childhood_str(:,:,sub), 'all');
end
childhood_str_mean = childhood_str_mean'

%str - auditory
childhood_str_auditory=Z([19:20,29:30], 1:18,:);

%Get the mean for each participant across the matrix
for sub = 1:18
    
    childhood_str_auditory_mean(:,sub) = nanmean(childhood_str_auditory(:,:,sub), 'all');
end
childhood_str_auditory_mean = childhood_str_auditory_mean'

%nac - auditory
childhood_nac_auditory=Z(29:30, 1:18,:);

%Get the mean for each participant across the matrix
for sub = 1:18
    
    childhood_nac_auditory_mean(:,sub) = nanmean(childhood_nac_auditory(:,:,sub), 'all');
end
childhood_nac_auditory_mean = childhood_nac_auditory_mean'

writematrix(childhood_auditory_participant_mean, 'childhood_auditory_participant_mean.csv')
writematrix(childhood_reward_participant_mean, 'childhood_reward_participant_mean.csv')
writematrix(childhood_auditory_participant_mean, 'childhood_auditory_participant_mean.csv')
writematrix(childhood_auditory_reward_mean, 'childhood_reward_auditory_mean.csv')
writematrix(childhood_mpfc_auditory_reward_mean, 'childhood_mpfc_auditory_reward_mean.csv')
writematrix(childhood_mpfc_auditory_mean, 'childhood_mpfc_auditory_mean.csv')
writematrix(childhood_mpfc_reward_mean, 'childhood_mpfc_reward_mean.csv')
writematrix(childhood_mpfc_nac_mean, 'childhood_mpfc_nac.csv')
writematrix(childhood_mpfc_str_mean, 'childhood_mpfc_str.csv')
writematrix(childhood_str_auditory_mean, 'childhood_str_auditory_mean.csv')
writematrix(childhood_nac_auditory_mean, 'childhood_nac_auditory_mean.csv')
