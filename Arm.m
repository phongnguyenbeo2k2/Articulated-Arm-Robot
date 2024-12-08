classdef Arm
    properties
        a;
        d;
        alpha; %deg
        theta; %deg
        pos;
        orien; %radian
        length_link_1;
        length_link_2;
        length_link_3;
        joint_1_r;
        joint_2_r;
        joint_3_r;
        length_joint_2;
        length_joint_3;
        %% matrix T of each joint
        T0_0;
        T0_1;
        T0_2;
        T0_3;
        is_coordinate;
        joint1_up_limit;
        joint1_down_limit;
        joint2_up_limit;
        joint2_down_limit;
        joint3_up_limit;
        joint3_down_limit;
    end
    methods
        %Constructor
        function obj = Arm(theta1, theta2, theta3)
            obj.joint1_up_limit = 170;
            obj.joint1_down_limit = -170;
            obj.joint2_up_limit = 155;
            obj.joint2_down_limit = -55;
            obj.joint3_up_limit = 100;
            obj.joint3_down_limit = -160;
            obj.is_coordinate = 0;
            obj.T0_0 = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];
            obj.length_link_1 = 3.3;
            obj.length_link_2 = 4.45;
            obj.length_link_3 = 4.4;
            obj.joint_1_r = 0.5;
            obj.joint_2_r = 0.5;
            obj.joint_3_r = 0.5;
            obj.length_joint_2 = 1.0;
            obj.length_joint_3 = 1.0;
            obj.a = [0; obj.length_link_2; obj.length_link_3];
            obj.d = [obj.length_link_1; 0; 0];
            obj.alpha = [90; 0; 0];
            obj.theta(1) = theta1;
            obj.theta(2) = theta2;
            obj.theta(3) = theta3;
            [obj.pos, obj.orien] = obj.ForwardKinematic();
        end
        %Kinematic function
        %brief
        %Input: paramter of DH table
        %Output:  position joint p1 p2 p3 (form: x y z) and orientation
        %         joint o1 o2 o3 (roll pitch yaw)

        function [p_robot, o_robot] = ForwardKinematic(self)
            a = self.a;
            alpha = deg2rad(self.alpha);
            d = self.d;
            theta = deg2rad(self.theta);
            %Denavit_Hatenberg
            A0_1 = self.T_matrix(a(1), alpha(1), d(1), theta(1));
            A1_2 = self.T_matrix(a(2), alpha(2), d(2), theta(2));
            A2_3 = self.T_matrix(a(3), alpha(3), d(3), theta(3));

            A0_2 = A0_1 * A1_2;
            A0_3 = A0_1 * A1_2 * A2_3;
            self.T0_1 = A0_1;
            self.T0_2 = A0_2;
            self.T0_3 = A0_3;
            p0 = [0;0;0];
            [p1, o1] = self.calculate_pose(A0_1, p0);
            [p2, o2] = self.calculate_pose(A0_2, p0);
            [p3, o3] = self.calculate_pose(A0_3, p0);

            p_robot = [p0 p1 p2 p3]';
            o_robot = [o1; o2; o3];
        end
        %Calculate T mamtrix
        function A = T_matrix(self, a, alpha, d, theta)
            %% Ma tran Denavit_Hartenberg
            %(i-1)A(i) = (i-1)A(i')*(i')A(i)
                A= [cos(theta) ,-cos(alpha)*sin(theta) , sin(alpha)*sin(theta) , a*cos(theta)    ;
                    sin(theta) , cos(alpha)*cos(theta) ,-sin(alpha)*cos(theta) , a*sin(theta)    ;
                        0      , sin(alpha)            , cos(alpha)            , d               ;
                        0      , 0                     , 0                     , 1              ];
        end
        %Calculate position and orientation 
        function [P, O] = calculate_pose(self, A, p0)
        %% Position - vi tri
            p_extended  = [p0;1];   % [0; 0; 0; 1]
            P_temp =  A*p_extended; % P_temp = [a*cos(theta); a*sin(theta); d; 1]; x y z cua joint1 hoac joint2 hoac joint3
            P = P_temp(1:3);        % P      = [a*cos(theta); a*sin(theta); d];
            P = round(P, 3);        % Lay 3 chu so thap phan
        %% Orientation -  huong
        %Slide 3.5(More on representation of orientation)         %roll la theta
            O(2)  = atan2(-A(3,1),sqrt(A(3,2)^2+A(3,3)^2));       %pitch = 90deg?????
            O(1)  = atan2(A(3,2)/cos(O(2)),A(3,3)/cos(O(2)));     %roll  = atan2(r32/cos(theta),r33/cos(theta))
            O(3)  = atan2(A(2,1)/cos(O(2)),A(1,1)/cos(O(2)));     %yaw   = atan2(r21/cos(theta),r11/cos(theta)
        end
        %plot skeleton frame of robot
        function plot_skeleton(self, handles)
            cla(handles.robot_plot)
            hold (handles.robot_plot, 'on');
            grid(handles.robot_plot, 'on');
             rotate3d(handles.robot_plot, 'on');
            xlabel(handles.robot_plot, 'x');
            ylabel(handles.robot_plot, 'y');
            zlabel(handles.robot_plot, 'z');
            xlim(handles.robot_plot, [-10 ,10]); % dat gioi han truc x y z cua axes robot
            ylim(handles.robot_plot, [-10 ,10]);
            zlim(handles.robot_plot, [-5, 15]);
            %% vẽ cột sống của robot
            plot3(handles.robot_plot, self.pos(:,1), self.pos(:,2), self.pos(:,3), '-diamond', 'LineWidth', 7, 'Color', "#4DBEEE");
            %draw link_1
            Plot_Cylinder(handles,0,0,0,self.joint_1_r, self.length_link_1 - 0.45, [0.4270 0.9290 0.1250], 0.75);
            %----draw_link_2----
            Draw_joint_2(handles,self.pos(2,1),self.pos(2,2) ,self.pos(2,3),self.pos(3,1), self.pos(3,2), self.pos(3,3), self.joint_2_r, self.length_joint_2,'r', 0.75,self.orien(1,3));
            Draw_joint_3(handles, self.pos(3,1), self.pos(3,2), self.pos(3,3), self.pos(4,1),self.pos(4,2), self.pos(4,3),self.joint_3_r, self.length_joint_3, 'r', 0.75);
            %Draw link connect 1 r_link = 8/5 * r_joint
            Draw_link_connect(handles,self.pos(2,:),self.pos(3,:),self.joint_2_r,'b');
            %Draw link connect 2
            Draw_link_connect(handles,self.pos(3,:), self.pos(4,:), self.joint_3_r,'b');

            %% draw coordinate
            
            %% ---------------
            view(handles.robot_plot, 25, 40);
            drawnow;
        end
        function plot_robot(self, handles)

        end
        %Calculate inverse kinematic
        function [theta_1, theta_2, theta_3] = InverseKinematic(self,x, y, z)
        %% input: desired x y z
        %% ouput: theta_1 theta_2 theta_3 of DH table
        %calculate theta_3
        a1 = self.length_link_1;
        a2 = self.length_link_2;
        a3 = self.length_link_3;
        check = sqrt(x*x + y*y + z*z);
%             if ((check < abs(self.length_link_2 - self.length_link_3)) || (check > (self.length_link_2 + self.length_link_3)))
%                 h=questdlg('Can not calculate kinematic with x, y, z provided','Warning','OK','OK');
%                 return
%             else
            %calculate base hinh hoc
            %% theta_1
            theta_1 = atan2(y,x) * 180 / pi;
            %% theta_2
            r1 = sqrt(x^2 + y^2);
            r2 = z - a1;
            phi_2 = atan2(r2,r1);
            r3 = sqrt(r1^2 + r2^2);
            cos_phi_1 = (a3^2 - a2^2 - r3^2)/(-2*a2*r3);
            phi_1 = acos(cos_phi_1);
            theta_2 = (phi_2 - phi_1)*180/pi;
            %% theta_3
            cos_phi_3 = (r3^2 - a2^2 -a3^2)/(-2*a2*a3);
            phi_3 = acos(cos_phi_3);
            theta_3 = (pi - phi_3) * 180/pi;
%             end
        end
    end
end