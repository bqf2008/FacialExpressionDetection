%% Import data
[FileName,PathName,FilterIndex] = uigetfile('/Users/Qifang/Documents/Project-FacialExpression/EmotionOutput/*.txt');
if FilterIndex == 0
    return;
end
data = csvread([PathName,filesep,FileName]);

time = data(:,1);
anger = data(:,2);
contempt = data(:,3);
disgust = data(:,4);
fear = data(:,5);
joy = data(:,6);
sadness = data(:,7);
surprise = data(:,8);
engagement = data(:,9);
valence = data(:,10);
attention = data(:,11);

%% Plot
plot(time,anger);
plot(time, joy);