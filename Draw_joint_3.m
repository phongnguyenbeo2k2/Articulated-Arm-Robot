function Draw_joint_3(handles, x2, y2, z2, x3, y3, z3, r, h,colr,opa)

theta = atan2(y3 - y2,x3 - x2);
[Z_1, X_1, Y_1] = cylinder(r, 100);  % Tạo hình trụ với 100 điểm

X_1 = X_1 ;  
Y_1 = Y_1*h - h/2;      % Đặt chiều dài hình trụ theo trục y
Z_1 = Z_1 ;   

% Ma trận quay quanh trục z với góc alpha
R_z = [cos(theta), -sin(theta); 
       sin(theta), cos(theta)];
% Áp dụng phép quay vào các điểm (X_1, Y_1)
    for i = 1:size(X_1, 1)
        for j = 1:size(X_1, 2)
        xy = R_z * [X_1(i,j); Y_1(i,j)];
        X_1(i,j) = xy(1);
        Y_1(i,j) = xy(2);
        end
    end
% dịch chuyển tọa độ đến vị trí của joint 3
X_1 = X_1 + x2;
Y_1 = Y_1 + y2;
Z_1 = Z_1 + z2;
surf(handles.robot_plot,X_1, Y_1, Z_1, 'facecolor', colr, 'FaceAlpha', opa, 'LineStyle', 'none');
% Tô màu đáy và đỉnh của hình trụ
fill3(handles.robot_plot, X_1(1,:), Y_1(1,:), Z_1(1,:), colr, 'FaceAlpha', opa);  % Đáy
fill3(handles.robot_plot, X_1(2,:), Y_1(2,:), Z_1(2,:), colr, 'FaceAlpha', opa);  % Đỉnh
end