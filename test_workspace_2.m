% Các thông số hình học
a2 = 4.45;
a3 = 4.4;

% Góc quay quanh trục z
phi = linspace(-pi/2, pi/2, 50); % Chia thành 50 phần

% Tạo một figure 3D
figure;
hold on;
axis equal;
xlabel('X');
ylabel('Y');
zlabel('Z');
grid on;
title('Vẽ từng phần 3D ngay lập tức');
view(3);

% Hàm quay và vẽ 3D từng phần
rotate_and_draw = @(x, z) ...
    draw_surface(x, z, phi);

% TH1: R1
r1 = a2 + a3;
theta = linspace(-11*pi/36, 31*pi/36, 100);
x = r1 * cos(theta);
z = r1 * sin(theta);
rotate_and_draw(x, z);

% TH2: R2
r2 = sqrt(a2^2 + a3^2 - 2*a2*a3*cos(pi/9));
theta2 = linspace(-pi/2, pi/2, 100);
x = r2 * cos(theta2);
z = r2 * sin(theta2);
rotate_and_draw(x, z);

% TH3: R3
r3 = sqrt(a2^2 + a3^2 - 2*a2*a3*cos(4*pi/9));
anpha2 = asin(sin(4*pi/9)*a3/r3);
theta3 = linspace(pi/2, 31*pi/36 + anpha2, 100);
x = r3 * cos(theta3);
z = r3 * sin(theta3);
rotate_and_draw(x, z);

% TH4: R4
denta_x1 = a2 * cos(31*pi/36);
denta_z1 = a2 * sin(31*pi/36);
r4 = a3;
theta4 = linspace(31*pi/36, 5*pi/9 + 31*pi/36, 100);
x = r4 * cos(theta4) + denta_x1;
z = r4 * sin(theta4) + denta_z1;
rotate_and_draw(x, z);

% TH5: R5
denta_x2 = a2 * cos(-11*pi/36);
denta_z2 = a2 * sin(-11*pi/36);
z_th5 = - sqrt(a3^2 - (a2*cos(-11*pi/36))^2) + a2*sin(-11*pi/36);
r5 = a3;
alpha3 = acos((z_th5^2 - a2^2 - a3^2)/(2*a2*a3));
theta5 = linspace(-11*pi/36, -alpha3 - 11*pi/36, 100);
x = r5 * cos(theta5) + denta_x2;
z5 = r5 * sin(theta5) + denta_z2;
rotate_and_draw(x, z5);

%line ben tren
% Tạo đường thẳng vuông góc với mặt phẳng Oxy
x = linspace(0, 0, 100); % Giá trị x cố định tại 0
y = linspace(0, 0, 100); % Giá trị y cố định tại 0
z = linspace(r2, r3, 100); % Giá trị z thay đổi từ r2 đến r3
% Vẽ đường thẳng bằng cách quay xung quanh trục z
plot3(x,y,z,'LineWidth',1,'Color','b');

%line duoi
% Tạo đường thẳng vuông góc với mặt phẳng Oxy
x = linspace(0, 0, 100); % Giá trị x cố định tại 0
y = linspace(0, 0, 100); % Giá trị y cố định tại 0
z = linspace(-r2, z_th5, 100); % Giá trị z thay đổi từ r2 đến r3
% Vẽ đường thẳng bằng cách quay xung quanh trục z
plot3(x,y,z,'LineWidth',1,'Color','b');
hold off;

% Hàm vẽ bề mặt 3D
function draw_surface(x, z, phi)
    % Tạo ma trận lưới các điểm quay quanh trục Z
    [X, PHI] = meshgrid(x, phi);
    [Z, ~] = meshgrid(z, phi);
    Y = X .* sin(PHI);
    X = X .* cos(PHI);
    
    % Vẽ bề mặt sử dụng surf
    surf(X, Y, Z, 'FaceAlpha', 0.3, 'EdgeColor', 'none');
end
