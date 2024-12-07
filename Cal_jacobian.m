function J = Cal_jacobian(arm_robot)
%% brief: this function calculate jacobian matrix
% input: object of robot
% ouput: jacobian matrix
    a = arm_robot.a;
    alpha = deg2rad(arm_robot.alpha);
    d = arm_robot.d;
    theta = deg2rad(arm_robot.theta);
    %% tính ma trận thuần nhất của A0_1, A0_2, A0_3
    A0_1 = arm_robot.T_matrix(a(1), alpha(1), d(1), theta(1));
    A1_2 = arm_robot.T_matrix(a(2), alpha(2), d(2), theta(2));
    A2_3 = arm_robot.T_matrix(a(3), alpha(3), d(3), theta(3));
    
    A0_2 = A0_1 * A1_2;
    A0_3 = A0_1 * A1_2 * A2_3;

    z0 = [0 0 1]'; z1 = A0_1(1:3,3); z2 = A0_2(1:3,3); z3 = A0_3(1:3,3); 
    p0 = [0 0 0]'; p1 = A0_1(1:3,4); p2 = A0_2(1:3,4); p3 = A0_3(1:3,4);
    J1 = Multi_vector(z0, (p3 - p0));
    J2 = Multi_vector(z1, (p3 - p1));
    J3 = Multi_vector(z2, (p3 - p2));
    J = [ J1 J2 J3;
          z0 z1 z2
        ];
end