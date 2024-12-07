function SetValueTheta(handles, theta_1, theta_2, theta_3)
%% brief: this function will update silder and text box on GUI when robot is moving.
%% text_box
set(handles.ed_theta_1, 'string', num2str(theta_1));
set(handles.ed_theta_2, 'string', num2str(theta_2));
set(handles.ed_theta_3, 'string', num2str(theta_3));
%% slider
set(handles.slider_theta_1, 'value',theta_1);
set(handles.slider_theta_2, 'value',theta_2);
set(handles.slider_theta_3, 'value',theta_3);
end