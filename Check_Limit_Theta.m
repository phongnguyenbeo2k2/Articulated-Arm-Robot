function result = Check_Limit_Theta(arm, theta_1, theta_2, theta_3)
    if theta_1 > arm.joint1_up_limit || theta_1 < arm.joint1_down_limit
        check = 1;
    else 
        check = 0;
    end
    if check == 0
        if theta_2 > arm.joint2_up_limit || theta_2 < arm.joint2_down_limit
            check = 1;
        end
    end
    if check == 0
        if theta_3 > arm.joint3_up_limit || theta_3 < arm.joint3_down_limit
            check = 1;
        end
    end
    result = check;
end