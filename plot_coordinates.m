function plot_coordinates(handles, x, y, z, u, order)
%%brief: this function will plot reference frame of joint 
%input: x, y, z is orgigin of reference frame
% u: ma tran thuan nhat
% order: thu tu cua joint muon ve
    hold on
    u=u*1.5;
% Hàm quiver3 là hàm vẽ vector mũi tên từ tâm origin tại (x,y,z) và hướng của các vector được xác định bằng vector u.
    %% lấy đối tượng 3 vector đơn vị x, y,z được vẽ vẽ lưu vào lần lượt quiversensorx, quiversensory, quiversensorz
    quiversensorx = quiver3(x,y,z,u(1,1),u(2,1),u(3,1));
    quiversensory = quiver3(x,y,z,u(1,2),u(2,2),u(3,2));
    quiversensorz = quiver3(x,y,z,u(1,3),u(2,3),u(3,3));
    %% draw origin of reference frame
    plot3(handles,x,y,z,'m.','MarkerSize',10);
    %% trục x: màu xanh nước biển; trục y: màu đen; trục z: màu đỏ
    set(quiversensorx, 'Color', 'blue');
    set(quiversensory, 'Color', 'black');
    set(quiversensorz, 'Color', 'red');
    %% setting độ dày của đường vẽ
    set(quiversensorx, 'LineWidth', 1);
    set(quiversensory, 'LineWidth', 1);
    set(quiversensorz, 'LineWidth', 1);
    %% gán nhãn trên các trục x, y, z
    textx = text(x+u(1,1),y+u(2,1),z+u(3,1),strcat('x',order));
    set(textx,'color','blue');
    texty = text(x+u(1,2),y+u(2,2),z+u(3,2),strcat('y',order));
    set(texty,'color','black');
    textz = text(x+u(1,3),y+u(2,3),z+u(3,3),strcat('z',order));
    set(textz,'color','red');
end