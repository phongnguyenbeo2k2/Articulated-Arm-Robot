function [theta_1,theta_2,theta_3] = Get_Value_Forward(handles)
theta_1 = str2double(get(handles.ed_theta_1, 'String'));
theta_2 = str2double(get(handles.ed_theta_2, 'String'));
theta_3 = str2double(get(handles.ed_theta_3, 'String'));
end