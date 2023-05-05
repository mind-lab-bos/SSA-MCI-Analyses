%Isolate the auditory-auditory section of the matrix
adulthood_auditory = Z(1:18,1:18,:);

%Isolate the top half of the corr matrix for each liking rating (aud-aud)
for sub = 1:30
    
    temp = adulthood_auditory(:,:,sub);
    adulthood_auditory_byparticipant(:,sub) = temp(find(~tril(ones(size(temp)))));
    adulthood_auditory_participant_mean = mean(adulthood_auditory_byparticipant);    
end
adulthood_auditory_participant_mean = adulthood_auditory_participant_mean'

%Isolate the reward-reward section of the matrix
adulthood_reward = Z(19:36,19:36,:);

%Isolate the top half of the corr matrix for each liking rating (reward-reward)
for sub = 1:30
    
    temp = adulthood_reward(:,:,sub);
    adulthood_reward_byparticipant(:,sub) = temp(find(~tril(ones(size(temp)))));
    adulthood_reward_participant_mean = mean(adulthood_reward_byparticipant);    
end
adulthood_reward_participant_mean = adulthood_reward_participant_mean'

%Isolate the auditory-reward section of the matrix
adulthood_reward_auditory = Z(1:18,19:36,:);

%Get the mean for each participant across the matrix (aud-rew)
for sub = 1:30
    
    adulthood_auditory_reward_mean(:,sub) = mean(adulthood_reward_auditory(:,:,sub), 'all');
end

adulthood_auditory_reward_mean = adulthood_auditory_reward_mean'

%mpfc - auditory
adulthood_mpfc_auditory=Z(1:18,31,:);

%Get the mean for each participant across the matrix (mpfc-aud)
for sub = 1:30
    
    adulthood_mpfc_auditory_mean(:,sub) = nanmean(adulthood_mpfc_auditory(:,:,sub), 'all');
end
adulthood_mpfc_auditory_mean = adulthood_mpfc_auditory_mean'

%mpfc - reward
adulthood_mpfc_reward=Z(19:36,31,:);

%Get the mean for each participant across the matrix (mpfc-rew)
for sub = 1:30
    
    adulthood_mpfc_reward_mean(:,sub) = nanmean(adulthood_mpfc_reward(:,:,sub), 'all');
end
adulthood_mpfc_reward_mean = adulthood_mpfc_reward_mean'

writematrix(adulthood_auditory_participant_mean, 'adulthood_auditory_participant_mean.csv')
writematrix(adulthood_reward_participant_mean, 'adulthood_reward_participant_mean.csv')
writematrix(adulthood_auditory_reward_mean, 'adulthood_reward_auditory_mean.csv')
writematrix(adulthood_mpfc_auditory_mean, 'adulthood_mpfc_auditory_mean.csv')
writematrix(adulthood_mpfc_reward_mean, 'adulthood_mpfc_reward_mean.csv')