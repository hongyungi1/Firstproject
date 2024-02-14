% 위도,경도를 좌표로 바꾸기(TM변환)
load('C:\Users\82102\OneDrive\바탕 화면\kwix 매트랩 연습\imu 연습\sensorlog_20240204_150309 (1).mat')
lat = Position.latitude; %위도
lon = Position.longitude; %경도
xnorth = zeros(518,1); %X(N)
yeast = zeros(518,1); %y(E)

for i=1:518
    a = 6378137; %장반경
    b = 6356752.31425; %단반경
    lon0 = 127; %투명원점 경도
    lat0 = 37; %투명원점 위도
    dy = 200000; %y축 가산값
    dx = 600000; %x축 가산값
    k0 = 1; %원점축적 계수
    T = (tan(lat(i)))^2;
    e1 = (a^2 - b^2)/(a^2); %제1이심률
    e2 = (a^2 - b^2)/(b^2); %제2이심률
    c = ((e1^2)/(1-(e1^2)))*cos(lat(i));
    radlat = lat(i)*(pi/180); %위도의 라디안
    radlat0 = lat0*(pi/180); % 투명원점 위도의 라디안
    radlon = lon(i)*(pi/180); % 경도의 라디안
    radlon0 = lon0*(pi/180); %투명원점 경도의 라디안
    A = (radlon - radlon0)*cos(lat(i));
    N = a/(sqrt(1-e1*((sin(lat(i)))^2)));
    m = (1-e1/4-(3*(e1^2))/64-(5*(e1^3))/256)*radlat - ((3*e1)/8+(3*(e1^2))/32+(45*(e1^3))/1024)*sin(2*lat(i));
    M = a*(m +((15*(e1^2))/256 + (45*(e1^3))/1024)*sin(4*lat(i)) - (((35*(e1^3))/3072)*sin(6*lat(i)))); %자오선장
    m0 = (1-e1/4-(3*(e1^2))/64-(5*(e1^3))/256)*radlat0 - ((3*e1)/8+(3*(e1^2))/32+(45*(e1^3))/1024)*sin(2*lat0);
    M0 = a*(m +((15*(e1^2))/256 + (45*(e1^3))/1024)*sin(4*lat0) - (((35*(e1^3))/3072)*sin(6*lat0))); %원점의 M
    xnorth1 = (((A^2)/2) + ((A^4)/24)*(5-T+(9*c)+4*(c^2))) + ((A^6)/720)*(61-58*T+(T^2)+600*c-330*e2);
    xnorth(i) = dx + k0*(M - M0 + N*tan(lat(i))*xnorth1); %X(N)
    yeast(i) = dy + k0*N*(A + ((A^3)/6)*(1-T+c) + ((A^5)/120)*(5-18*T+(T^2)+72*c-58*e2));

end



