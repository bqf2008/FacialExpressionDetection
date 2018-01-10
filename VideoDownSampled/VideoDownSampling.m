%Downsampling videos
[FileName,PathName,FilterIndex] = uigetfile('/Users/Qifang/Documents/AffdexSDK/TestAffdex2/*.mov');
if FilterIndex == 0
    return;
end
tic;
TimeInterval= 0.2;
v = VideoReader([PathName,filesep,FileName]);
SampledTime = 0:TimeInterval:v.Duration;
v2 = VideoWriter([FileName(1:end-4),'_downsampled.mp4'],'MPEG-4');
v2.FrameRate = 5;
open(v2)
try
h = waitbar(0,'Downsampling...');
for k = 1:length(SampledTime)
    v.CurrentTime = SampledTime(k);
    newFrame = readFrame(v);
    writeVideo(v2,newFrame);
    waitbar(k/length(SampledTime),h)
end

close(v2)
close(h)
toc;
catch
    close(v2)
    toc;
end