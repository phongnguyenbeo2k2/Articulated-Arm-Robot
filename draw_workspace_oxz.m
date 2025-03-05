a2 = 4.45;
a3 = 4.4;

%TH1
r1 = a2 + a3;
%theta3 = 0
theta = linspace(-11*pi/36, 31*pi/36, 100); 
% Chuyển đổi tọa độ cực sang Descartes
x = r1 * cos(theta);
y = r1 * sin(theta);
% Vẽ hình tròn
figure;
plot(x, y, 'b', 'LineWidth', 2); % Đường viền màu xanh, độ dày 2
axis equal; % Giữ tỉ lệ x và y bằng nhau
grid on; % Bật lưới
title('workspace tren mat cat oxz');
hold on;

%TH2: 
%theta3 = -160
% theta2: từ -55 đến 155
r2 = sqrt(a2^2 + a3^2 - 2*a2*a3*cos(pi/9));
theta = linspace(-pi/2, pi/2, 100);
x = r2 * cos(theta);
y = r2 * sin(theta);
plot(x, y, 'r', 'LineWidth', 2); % Đường viền màu xanh, độ dày 2
axis equal; % Giữ tỉ lệ x và y bằng nhau
grid on; % Bật lưới
hold on;

%TH3:
%theta3 = 100
% theta2: từ -55 đến 155
r3 = sqrt(a2^2 + a3^2 - 2*a2*a3*cos(4*pi/9));
alpha2 = asin(sin(4*pi/9)*a3/r3);
theta = linspace(pi/2, 31*pi/36 + alpha2, 100);
x = r3 * cos(theta);
y = r3 * sin(theta);
plot(x, y, 'g', 'LineWidth', 2);
axis equal;
grid on;
hold on;

%TH4:
%dich tam
denta_x1 = a2 * cos(31*pi/36);
denta_y1 = a2 * sin(31*pi/36);
r4 = a3;
theta = linspace(31*pi/36, 5*pi/9 + 31*pi/36, 100);
x = r4 * cos(theta) + denta_x1;
y = r4 * sin(theta) + denta_y1;
plot(x, y, 'm', 'LineWidth', 2);
axis equal;
grid on;

%TH5:
%dich tam
denta_x2 = a2 * cos(-11*pi/36);
denta_y2 = a2 * sin(-11*pi/36);
y3 = - sqrt(a3^2 - (a2*cos(-11*pi/36))^2) + a2*sin(-11*pi/36);

alpha3 = acos((y3^2 - a2^2 - a3^2)/(2*a2*a3));
theta = linspace(-11*pi/36, -alpha3 - 11*pi/36, 100);
x = a3 * cos(theta) + denta_x2;
y = a3 * sin(theta) + denta_y2;
plot(x, y, 'black', 'LineWidth', 2);
axis equal;
grid on;

plot(0,0,'m.','MarkerSize',10);
%Doan thang
plot([0,0],[r2,r3],'b','LineWidth', 2);
plot([0,0],[-r2, y3],'y','LineWidth', 2);