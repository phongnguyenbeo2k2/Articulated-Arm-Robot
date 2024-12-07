function Update_Pose_End_Effector(handles, arm)
    set(handles.text_x,'String',num2str(arm.pos(4,1)));
    set(handles.text_y,'String',num2str(arm.pos(4,2)));
    set(handles.text_z,'String',num2str(arm.pos(4,3)));
    set(handles.text_roll,'String',num2str(round(arm.orien(3,1)*180/pi),4));
    set(handles.text_pitch,'String',num2str(round(arm.orien(3,2)*180/pi),4));
    set(handles.text_yaw,'String',num2str(round(arm.orien(3,3)*180/pi),4));    
end