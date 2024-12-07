function Plot_Cylinder(handles,x0,y0,z0,r,h,colr,opa)
% x0 y0 z0: toa do tam
% r: ban kinh day
% h: chieu cao
[X,Y,Z] = cylinder(r,100);      %dung 100 diem de sap xep hinh tru
X = X + x0;
Y = Y + y0;
Z = Z*h + z0;
surf(handles.robot_plot,X,Y,Z,'facecolor',colr,'FaceAlpha', opa,'LineStyle','none');
fill3(handles.robot_plot,X(1,:),Y(1,:),Z(1,:),colr)
fill3(handles.robot_plot,X(2,:),Y(2,:),Z(2,:),colr)