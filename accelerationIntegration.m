load('C:\Users\82102\OneDrive\바탕 화면\kwix 매트랩 연습\imu 연습\sensorlog_20240204_150309 (1).mat')
x = Acceleration.X;
y = Acceleration.Y;
z = Acceleration.Z;
timestamp = Acceleration.Timestamp;
combinedAccel = sqrt(x.^2+y.^2+z.^2);
t = zeros(size(timestamp));
for n=1:length(timestamp)
    t(n) = seconds(timestamp(n)-timestamp(1));
end

figure
plot(t,x)
xlabel('Time(s)')
ylabel('X Acceleration(m/s^2)')
figure
plot(t,y)
xlabel('Time(s)')
ylabel('Y Acceleration(m/s^2)')

spdx = cumtrapz(t,x); %누적적분(가속도적분=>속도)
spdy = cumtrapz(t,y);

figure
plot(t,spdx)
xlabel('Time(s)')
ylabel('X speed(m/s)')
figure
plot(t,spdx)
xlabel('Time(s)')
ylabel('X Speed (m/s)')


