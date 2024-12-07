function SetTitleTrajectoryPlot(handles)

% graph joint1 theta
axes(handles.joint1_q)
cla
hold on
grid on
title('${\theta_1}$ (deg)', 'Interpreter','latex')

%graph joint 2 theta 
axes(handles.joint2_q)
cla
hold on
grid on
title('${\theta_2}$ (deg)', 'Interpreter','latex')

%graph joint 3 theta
axes(handles.joint3_q)
cla
hold on
grid on
title('${\theta_3}$ (deg)', 'Interpreter','latex')

%graph joint 1 velocity
axes(handles.joint1_v)
cla
hold on
grid on
title('$\dot{\theta_1}$ (deg/s)', 'Interpreter','latex')

%graph joint 2 velocity
axes(handles.joint2_v)
cla
hold on
grid on
title('$\dot{\theta_2}$ (deg/s)', 'Interpreter','latex')

%graph joint 3 velocity
axes(handles.joint3_v)
cla
hold on
grid on
title('$\dot{\theta_3}$ (deg/s)', 'Interpreter','latex')

%graph joint 1 acceleration
axes(handles.joint1_a)
cla
hold on
grid on
title('$\stackrel{..}{\theta_1}$ (deg/s$^2$)', 'Interpreter','latex')
%graph joint 2 acceleration
axes(handles.joint2_a)
cla
hold on
grid on
title('$\stackrel{..}{\theta_2}$ (deg/s$^2$)', 'Interpreter','latex')
%graph joint 3 acceleration
axes(handles.joint3_a)
cla
hold on
grid on
title('$\stackrel{..}{\theta_3}$ (deg/s$^2$)', 'Interpreter','latex')
%% dau $v_x$ để sài font chữ của latex
%graph vx
axes(handles.vx_plot)
cla
hold on
grid on
title('$v_x$ (m/s)', 'Interpreter','latex')
%graph vy
axes(handles.vy_plot)
cla
hold on
grid on
title('$v_y$ (m/s)', 'Interpreter','latex')
%graph vz
axes(handles.vz_plot)
cla
hold on
grid on
title('$v_z$ (m/s)', 'Interpreter','latex')
%graph wx
axes(handles.wx_plot)
cla
hold on
grid on
title('$w_x$ (deg/s)', 'Interpreter','latex')
%graph wy
axes(handles.wy_plot)
cla
hold on
grid on
title('$w_y$ (deg/s)', 'Interpreter','latex')
%graph wz
axes(handles.wz_plot)
cla
hold on
grid on
title('$w_z$ (deg/s)', 'Interpreter','latex')
end