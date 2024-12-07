function Draw_joint_2(handles, x1, y1, z1, x2, y2, z2, r, h,colr,opa,yaw_joint_1)

theta = atan2(y2 - y1,x2 - x1);
[X_1, Z_1, Y_1] = cylinder(r, 100);  % Tạo hình trụ với 100 điểm

% Dịch chuyển tọa độ
X_1 = X_1;  % Đặt chiều dài hình trụ theo trục x
Y_1 = Y_1*h - h/2;      % Dịch chuyển theo trục y
Z_1 = Z_1 ;      % Giữ nguyên chiều cao

% Ma trận quay quanh trục z với góc alpha
R_z = [cos(yaw_joint_1), -sin(yaw_joint_1); 
       sin(yaw_joint_1), cos(yaw_joint_1)];
% Áp dụng phép quay vào các điểm (X_1, Y_1)
    for i = 1:size(X_1, 1)
        for j = 1:size(X_1, 2)
        xy = R_z * [X_1(i,j); Y_1(i,j)];
        X_1(i,j) = xy(1);
        Y_1(i,j) = xy(2);
        end
    end
X_1 = X_1 + x1;
Y_1 = Y_1 + y1;
Z_1 = Z_1 + z1;
surf(handles.robot_plot,X_1, Y_1, Z_1, 'facecolor', colr, 'FaceAlpha', opa, 'LineStyle', 'none');
% Tô màu đáy và đỉnh của hình trụ
fill3(handles.robot_plot, X_1(1,:), Y_1(1,:), Z_1(1,:), colr, 'FaceAlpha', opa);  % Đáy
fill3(handles.robot_plot, X_1(2,:), Y_1(2,:), Z_1(2,:), colr, 'FaceAlpha', opa);  % Đỉnh
end