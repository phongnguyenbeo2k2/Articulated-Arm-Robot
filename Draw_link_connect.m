function Draw_link_connect(handles, p0, p1, r, colr)
% Position of two joint:  (x0, y0, z0) và (x1, y1, z1)
% 
%   x0, y0, z0: Joint 1 position
%   x1, y1, z1: Joint 2 position
%   r: radius of cylinder link
%   colr: color of cylinder
x0 = p0(1);
y0 = p0(2);
z0 = p0(3);
x1 = p1(1);
y1 = p1(2);
z1 = p1(3);

% Step 1: Tạo hình trụ tiêu chuẩn dọc theo trục z
n = 100;  % Số lượng điểm để làm mịn hình trụ
[X, Y, Z] = cylinder(r, n);

% Step 2: Tính vector đơn vị từ đáy 1 đến đáy 2
v = [x1 - x0, y1 - y0, z1 - z0];
height = norm(v);  % Chiều cao của hình trụ
v = v / height;    % Chuẩn hóa vector v thành đơn vị

% Step 3: Xác định trục z tiêu chuẩn [0 0 1] và góc xoay để chuyển z thành vector v
zAxis = [0, 0, 1];
if all(v == zAxis)
    % Nếu v trùng với trục z, không cần xoay
    R = eye(3);  % Ma trận xoay là đơn vị
else
    % Tính trục xoay và góc xoay từ zAxis đến vector v
    axisRotation = vrrotvec(zAxis, v);  % Tính toán trục và góc xoay
    disp(axisRotation);
    R = vrrotvec2mat(axisRotation);     % Ma trận xoay tương ứng
end

% Step 4: Mul with Rotation matrix
for i = 1:2
    for j = 1:length(X)
        point = R * [X(i,j); Y(i,j); Z(i,j) * height];  % Xoay và nhân với chiều cao
        X(i,j) = point(1) + x0;  % Tịnh tiến đến vị trí đáy 1
        Y(i,j) = point(2) + y0;
        Z(i,j) = point(3) + z0;
    end
end

% Step 5: Draw cylinder
surf(handles.robot_plot, X, Y, Z, 'FaceColor', colr, 'LineStyle', 'none','FaceAlpha',0.5);
hold on;

% Step 6: fill color 2 đáy
fill3(handles.robot_plot, X(1,:), Y(1,:), Z(1,:), colr);  % Đáy 1
fill3(handles.robot_plot, X(2,:), Y(2,:), Z(2,:), colr);  % Đáy 2

end