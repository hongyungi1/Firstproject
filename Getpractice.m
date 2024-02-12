function [spd] = Getpractice()

persistent firstRun 
load('C:\Users\82102\OneDrive\바탕 화면\kwix 매트랩 연습\imu 연습\sensorlog_20240204_150309 (1).mat')

if isempty(firstRun)
    
    spd = zeros(518,1); %속도
    firstRun = 1;
end
spd = Position(:,4);

end





