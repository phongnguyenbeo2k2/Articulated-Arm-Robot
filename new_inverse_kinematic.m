function [theta_1, theta_2, theta_3] = new_inverse_kinematic(arm,x, y, z)
    check = sqrt(x*x + y*y + z*z);
%     if (check < abs(arm.length_link_2 - arm.length_link_3) || check > (arm.length_link_2 + arm.length_link_3))
%         h=questdlg('Can not calculate kinematic with x, y, z provided','Warning','OK','OK');
%         return
%     end
    a2 = arm.length_link_2;
    a3 = arm.length_link_3;
    z = z - arm.length_link_1;
    %% calculate theta_3
    c3 = (x^2 + y^2 + z^2 -a2^2 -a3^2) / (2*a2*a3);
    s3 = sqrt(1 - c3^2);
%     if (x > arm.pos(4,1))        
%     theta_3 = -atan2(s3,c3) * 180/pi;
%     else 
%     theta_3 = +atan2(s3,c3) * 180/pi;
%     end
    theta_3 = +atan2(s3,c3) * 180/pi;
    %% calculate theta_2
    ts_c2 = (sqrt(x*x + y*y))*(a2 + a3*c3) - z*a3*s3;
    ms_c2 = a2*a2 + a3*a3 + 2*a2*a3*c3;
    c2 = ts_c2/ms_c2;
    ts_s2 = (-sqrt(x*x + y*y))*a3*s3 + z*(a2 + a3*c3);
    ms_s2 = a2*a2 + a3*a3 + 2*a2*a3*c3;
    s2 = ts_s2/ms_s2;
    theta_2 = atan2(s2,c2) * 180/pi;

    %% calculate theta_1
    theta_1 = atan2(y,x) * 180/pi;
end