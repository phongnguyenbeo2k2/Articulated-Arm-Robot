function varargout = BTL(varargin)
% BTL MATLAB code for BTL.fig
%      BTL, by itself, creates a new BTL or raises the existing
%      singleton*.
%
%      H = BTL returns the handle to a new BTL or the handle to
%      the existing singleton*.
%
%      BTL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BTL.M with the given input arguments.
%
%      BTL('Property','Value',...) creates a new BTL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before BTL_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to BTL_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help BTL

% Last Modified by GUIDE v2.5 07-Dec-2024 14:21:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @BTL_OpeningFcn, ...
                   'gui_OutputFcn',  @BTL_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before BTL is made visible.
function BTL_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to BTL (see VARARGIN)

% Choose default command line output for BTL
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes BTL wait for user response (see UIRESUME)
% uiwait(handles.figure1);

%% update_slide_bar
theta_1 = str2double(get(handles.ed_theta_1, 'String'));
set(handles.slider_theta_1, 'value',theta_1);

theta_2 = str2double(get(handles.ed_theta_2, 'String'));
set(handles.slider_theta_2, 'value',theta_2);

theta_3 = str2double(get(handles.ed_theta_3, 'String'));
set(handles.slider_theta_3, 'value',theta_3);

%% Initialize arm robot
global arti_robot
handles.pre_theta_1 = 0;
handles.pre_theta_2 = 90;
handles.pre_theta_3 = -90;
guidata(hObject, handles);
SetTitleTrajectoryPlot(handles);
arti_robot = Arm(handles.pre_theta_1, handles.pre_theta_2, handles.pre_theta_3);
Update_Pose_End_Effector(handles,arti_robot);
arti_robot.plot_skeleton(handles);
%-------------------------------------------


% --- Outputs from this function are returned to the command line.
function varargout = BTL_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider_theta_1_Callback(hObject, eventdata, handles)
% hObject    handle to slider_theta_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
%% begin coding
theta_1 = get(handles.slider_theta_1, 'value');
set(handles.ed_theta_1, 'string', num2str(theta_1));
%% end function

% --- Executes during object creation, after setting all properties.
function slider_theta_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_theta_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

%%begin 

% --- Executes on slider movement.
function slider_theta_2_Callback(hObject, eventdata, handles)
% hObject    handle to slider_theta_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
%% begin coding 
theta_2 = get(handles.slider_theta_2, 'value');
set(handles.ed_theta_2, 'string', num2str(theta_2));
%% end function

% --- Executes during object creation, after setting all properties.
function slider_theta_2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_theta_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider_theta_3_Callback(hObject, eventdata, handles)
% hObject    handle to slider_theta_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
%% begin codeing 
theta_3 = get(handles.slider_theta_3, 'value');
set(handles.ed_theta_3, 'string',num2str(theta_3));
%%end function

% --- Executes during object creation, after setting all properties.
function slider_theta_3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_theta_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function ed_theta_1_Callback(hObject, eventdata, handles)
% hObject    handle to ed_theta_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ed_theta_1 as text
%        str2double(get(hObject,'String')) returns contents of ed_theta_1 as a double


% --- Executes during object creation, after setting all properties.
function ed_theta_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed_theta_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ed_theta_2_Callback(hObject, eventdata, handles)
% hObject    handle to ed_theta_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ed_theta_2 as text
%        str2double(get(hObject,'String')) returns contents of ed_theta_2 as a double


% --- Executes during object creation, after setting all properties.
function ed_theta_2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed_theta_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ed_theta_3_Callback(hObject, eventdata, handles)
% hObject    handle to ed_theta_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ed_theta_3 as text
%        str2double(get(hObject,'String')) returns contents of ed_theta_3 as a double


% --- Executes during object creation, after setting all properties.
function ed_theta_3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed_theta_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in show_workspace.
function show_workspace_Callback(hObject, eventdata, handles)
% hObject    handle to show_workspace (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of show_workspace
%% begin function
    global arti_robot
    axes(handles.robot_plot);
    if get(hObject, 'Value') == 1
        Plot_workspace(arti_robot.pos(2,1),arti_robot.pos(2,3));
    else 
        arti_robot = Arm(arti_robot.theta(1), arti_robot.theta(2), arti_robot.theta(3));
        Update_Pose_End_Effector(handles,arti_robot);
        arti_robot.plot_skeleton(handles);
    end
%% end function

% --- Executes on button press in show_coordinate.
function show_coordinate_Callback(hObject, eventdata, handles)
% hObject    handle to show_coordinate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of show_coordinate
%% start function
global arti_robot
axes(handles.robot_plot);
if get(hObject, 'Value') == 1
    a = arti_robot.a;
    alpha = deg2rad(arti_robot.alpha);
    d = arti_robot.d;
    theta = deg2rad(arti_robot.theta);
    %% tính ma trận thuần nhất của A0_1, A0_2, A0_3
    A0_1 = arti_robot.T_matrix(a(1), alpha(1), d(1), theta(1));
    A1_2 = arti_robot.T_matrix(a(2), alpha(2), d(2), theta(2));
    A2_3 = arti_robot.T_matrix(a(3), alpha(3), d(3), theta(3));
    
    A0_0=[1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];
    A0_2 = A0_1 * A1_2;
    A0_3 = A0_1 * A1_2 * A2_3;
    %draw reference frame of joint 1
    plot_coordinates(handles.robot_plot, arti_robot.pos(1,1), arti_robot.pos(1,2), arti_robot.pos(1,3),A0_0,'o');
    %draw reference frame of joint 2
    plot_coordinates(handles.robot_plot, arti_robot.pos(2,1), arti_robot.pos(2,2), arti_robot.pos(2,3),A0_1,'1');
    %draw reference frame of joint 3
    plot_coordinates(handles.robot_plot, arti_robot.pos(3,1), arti_robot.pos(3,2), arti_robot.pos(3,3),A0_2,'2');
    %draw reference frame of joint 4
    plot_coordinates(handles.robot_plot, arti_robot.pos(4,1), arti_robot.pos(4,2), arti_robot.pos(4,3),A0_3,'3');   

    arti_robot.is_coordinate = 1;
else
    arti_robot = Arm(arti_robot.theta(1), arti_robot.theta(2), arti_robot.theta(3));
    Update_Pose_End_Effector(handles,arti_robot);
    arti_robot.plot_skeleton(handles);
    arti_robot.is_coordinate = 0;
end
%% end function


function text_x_Callback(hObject, eventdata, handles)
% hObject    handle to text_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text_x as text
%        str2double(get(hObject,'String')) returns contents of text_x as a double


% --- Executes during object creation, after setting all properties.
function text_x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function text_y_Callback(hObject, eventdata, handles)
% hObject    handle to text_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text_y as text
%        str2double(get(hObject,'String')) returns contents of text_y as a double


% --- Executes during object creation, after setting all properties.
function text_y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function text_z_Callback(hObject, eventdata, handles)
% hObject    handle to text_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text_z as text
%        str2double(get(hObject,'String')) returns contents of text_z as a double


% --- Executes during object creation, after setting all properties.
function text_z_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function text_roll_Callback(hObject, eventdata, handles)
% hObject    handle to text_roll (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text_roll as text
%        str2double(get(hObject,'String')) returns contents of text_roll as a double


% --- Executes during object creation, after setting all properties.
function text_roll_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_roll (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function text_pitch_Callback(hObject, eventdata, handles)
% hObject    handle to text_pitch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text_pitch as text
%        str2double(get(hObject,'String')) returns contents of text_pitch as a double


% --- Executes during object creation, after setting all properties.
function text_pitch_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_pitch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function text_yaw_Callback(hObject, eventdata, handles)
% hObject    handle to text_yaw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text_yaw as text
%        str2double(get(hObject,'String')) returns contents of text_yaw as a double


% --- Executes during object creation, after setting all properties.
function text_yaw_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_yaw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function text_x_inver_Callback(hObject, eventdata, handles)
% hObject    handle to text_x_inver (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text_x_inver as text
%        str2double(get(hObject,'String')) returns contents of text_x_inver as a double


% --- Executes during object creation, after setting all properties.
function text_x_inver_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_x_inver (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function text_y_inver_Callback(hObject, eventdata, handles)
% hObject    handle to text_y_inver (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text_y_inver as text
%        str2double(get(hObject,'String')) returns contents of text_y_inver as a double


% --- Executes during object creation, after setting all properties.
function text_y_inver_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_y_inver (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function text_z_inver_Callback(hObject, eventdata, handles)
% hObject    handle to text_z_inver (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text_z_inver as text
%        str2double(get(hObject,'String')) returns contents of text_z_inver as a double


% --- Executes during object creation, after setting all properties.
function text_z_inver_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_z_inver (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btn_forward.
function btn_forward_Callback(hObject, eventdata, handles)
% hObject    handle to btn_forward (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%% start coding 

global arti_robot;
global pre_theta_1 pre_theta_2 pre_theta_3;
pre_theta_1 = handles.pre_theta_1;
pre_theta_2 = handles.pre_theta_2;
pre_theta_3 = handles.pre_theta_3;
x = [];
y = [];
z = [];
%get the new jpint parameter

[new_theta_1, new_theta_2, new_theta_3] = Get_Value_Forward(handles);
a = arti_robot.a;
alpha = arti_robot.alpha;
theta = [new_theta_1; new_theta_2; new_theta_3];
d = arti_robot.d;

%caclulate denta theta
denta_theta_1 = new_theta_1 - pre_theta_1;
denta_theta_2 = new_theta_2 - pre_theta_2;
denta_theta_3 = new_theta_3 - pre_theta_3;
temp_arti_robot = arti_robot;

%draw a little each iteration
    for i=1:1:30
    iteration_theta_1 = pre_theta_1 + (denta_theta_1*i/30);
    iteration_theta_2 = pre_theta_2 + (denta_theta_2*i/30);
    iteration_theta_3 = pre_theta_3 + (denta_theta_3*i/30);
    temp_arti_robot = Arm(iteration_theta_1, iteration_theta_2, iteration_theta_3);
    temp_arti_robot.plot_skeleton(handles);
    Update_Pose_End_Effector(handles, temp_arti_robot);
    x = [x, temp_arti_robot.pos(4,1)];
    y = [y, temp_arti_robot.pos(4,2)];
    z = [z, temp_arti_robot.pos(4,3)];
    plot3(handles.robot_plot,x,y,z,'r','LineWidth',1.5);
    hold on;
    pause(0.1);
    end
    warndlg('Done forward movement');

%update previous joint parameter
handles.pre_theta_1 = new_theta_1;
handles.pre_theta_2 = new_theta_2;
handles.pre_theta_3 = new_theta_3;
arti_robot = temp_arti_robot;
guidata(hObject, handles);
%% end fuction

% --- Executes on button press in btn_inverse.
function btn_inverse_Callback(hObject, eventdata, handles)
% hObject    handle to btn_inverse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    %% start function
    global arti_robot;
    global pre_theta_1 pre_theta_2 pre_theta_3;
    pre_theta_1 = handles.pre_theta_1;
    pre_theta_2 = handles.pre_theta_2;
    pre_theta_3 = handles.pre_theta_3;
    xx = [];
    yy = [];
    zz = [];
    x_inver = str2double(get(handles.text_x_inver,'String'));
    y_inver = str2double(get(handles.text_y_inver,'String'));
    z_inver = str2double(get(handles.text_z_inver,'String'));
%     [new_theta_1, new_theta_2, new_theta_3] = arti_robot.InverseKinematic(x_inver,y_inver,z_inver);
     [new_theta_1, new_theta_2, new_theta_3] = new_inverse_kinematic(arti_robot, x_inver,y_inver,z_inver);
    %calulate denta theta
    check = Check_Limit_Theta(arti_robot, new_theta_1, new_theta_2, new_theta_3);
    if check == 0
  
        denta_theta_1 = new_theta_1 - pre_theta_1;
        denta_theta_2 = new_theta_2 - pre_theta_2;
        denta_theta_3 = new_theta_3 - pre_theta_3;
        temp_arti_robot = arti_robot;
        %draw a little each iteration
        for i=1:1:30
        iteration_theta_1 = pre_theta_1 + (denta_theta_1*i/30);
        iteration_theta_2 = pre_theta_2 + (denta_theta_2*i/30);
        iteration_theta_3 = pre_theta_3 + (denta_theta_3*i/30);
        temp_arti_robot = Arm(iteration_theta_1, iteration_theta_2, iteration_theta_3);
        temp_arti_robot.plot_skeleton(handles);
        SetValueTheta(handles,round(iteration_theta_1,4), round(iteration_theta_2,4), round(iteration_theta_3,4));
        Update_Pose_End_Effector(handles, temp_arti_robot);
        xx = [xx, temp_arti_robot.pos(4,1)];
        yy = [yy, temp_arti_robot.pos(4,2)];
        zz = [zz, temp_arti_robot.pos(4,3)];
        plot3(handles.robot_plot,xx ,yy ,zz ,'r','LineWidth',1.5);
        hold on;
        pause(0.1);
        end
        %update previous joint parameter
        arti_robot = temp_arti_robot;
        handles.pre_theta_1 = new_theta_1;
        handles.pre_theta_2 = new_theta_2;
        handles.pre_theta_3 = new_theta_3;
        guidata(hObject, handles);
        warndlg('Done inverse kinematic position');
    else 
        warndlg('Out range of worksapce');
    end
    %% end fuction

% --- Executes on button press in btn_reset.
function btn_reset_Callback(hObject, eventdata, handles)
% hObject    handle to btn_reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%% start function
global arti_robot
handles.pre_theta_1 = 0;
handles.pre_theta_2 = 90;
handles.pre_theta_3 = -90;
guidata(hObject, handles);
arti_robot = Arm(handles.pre_theta_1, handles.pre_theta_2, handles.pre_theta_3);
Update_Pose_End_Effector(handles,arti_robot);
arti_robot.plot_skeleton(handles);
set(handles.slider_theta_1, 'value',handles.pre_theta_1);
set(handles.slider_theta_2, 'value',handles.pre_theta_2);
set(handles.slider_theta_3, 'value',handles.pre_theta_3);
set(handles.ed_theta_1, 'string', num2str(handles.pre_theta_1));
set(handles.ed_theta_2, 'string', num2str(handles.pre_theta_2));
set(handles.ed_theta_3, 'string', num2str(handles.pre_theta_3));
%% end function

% --- Executes on button press in btn_run.
function btn_run_Callback(hObject, eventdata, handles)
% hObject    handle to btn_run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%% begin fuction
%set title of plot
    SetTitleTrajectoryPlot(handles);
% Step 1: get v max and a max of system
    v_max = str2double(get(handles.v_max, 'String'));
    a_max = str2double(get(handles.a_max, 'String'));
% Step 2: get previous theta of robot
    global arti_robot;
    global pre_theta_1 pre_theta_2 pre_theta_3;
    pre_theta_1 = handles.pre_theta_1;
    pre_theta_2 = handles.pre_theta_2;
    pre_theta_3 = handles.pre_theta_3;
    % below array that used for record position of end effector while
    % moving
    xx = [];
    yy = [];
    zz = [];
    %velocity of end effector in 3D space
    vx = [];
    vy = [];
    vz = [];
    wx = [];
    wy = [];
    wz = [];
% Step 3: Calculate inverse of robot
    x_inver = str2double(get(handles.text_x_inver,'String'));
    y_inver = str2double(get(handles.text_y_inver,'String'));
    z_inver = str2double(get(handles.text_z_inver,'String'));
    [new_theta_1, new_theta_2, new_theta_3] = arti_robot.InverseKinematic(x_inver,y_inver,z_inver);
    check = Check_Limit_Theta(arti_robot, new_theta_1, new_theta_2, new_theta_3);
    if check == 0
        q1_max = new_theta_1 - pre_theta_1;
        q2_max = new_theta_2 - pre_theta_2;
        q3_max = new_theta_3 - pre_theta_3;
    % Step 4: Joint trajectory planning based on LSPB
        [t1, q1, v1, a1] = LSPB_trajectory(q1_max, v_max, a_max);
        [t2, q2, v2, a2] = LSPB_trajectory(q2_max, v_max, a_max);
        [t3, q3, v3, a3] = LSPB_trajectory(q3_max, v_max, a_max);
    
    %Step 5: Do movement and plot graph
        temp_arti_robot = arti_robot;
        %plot graph
        for i=1:length(t3)
            % joint 1
            plot(handles.joint1_q, t1(1:i), q1(1:i),'LineWidth',1.5,'Color','m');
            plot(handles.joint1_v, t1(1:i), v1(1:i),'LineWidth',1.5,'Color','r');
            plot(handles.joint1_a, t1(1:i), a1(1:i),'LineWidth',1.5,'Color','g');
            %joint 2
            plot(handles.joint2_q, t2(1:i), q2(1:i),'LineWidth',1.5,'Color','m');
            plot(handles.joint2_v, t2(1:i), v2(1:i),'LineWidth',1.5,'Color','r');
            plot(handles.joint2_a, t2(1:i), a2(1:i),'LineWidth',1.5,'Color','g');
            %joint 3
            plot(handles.joint3_q, t3(1:i), q3(1:i),'LineWidth',1.5,'Color','m');
            plot(handles.joint3_v, t3(1:i), v3(1:i),'LineWidth',1.5,'Color','r');
            plot(handles.joint3_a, t3(1:i), a3(1:i),'LineWidth',1.5,'Color','g');
        % do animation movement of robot
            iteration_theta_1 = pre_theta_1 + q1(i);
            iteration_theta_2 = pre_theta_2 + q2(i);
            iteration_theta_3 = pre_theta_3 + q3(i);
            temp_arti_robot = Arm(iteration_theta_1, iteration_theta_2, iteration_theta_3);
            temp_arti_robot.plot_skeleton(handles);
            SetValueTheta(handles,round(iteration_theta_1,4), round(iteration_theta_2,4), round(iteration_theta_3,4));
            Update_Pose_End_Effector(handles, temp_arti_robot);
            xx = [xx, temp_arti_robot.pos(4,1)];
            yy = [yy, temp_arti_robot.pos(4,2)];
            zz = [zz, temp_arti_robot.pos(4,3)];
            plot3(handles.robot_plot,xx ,yy ,zz ,'r','LineWidth',1.5);
            % Calculate velocity of end effector from velocity of each joint by using jacobian
            J = Cal_jacobian(temp_arti_robot);
            v_robot = J * ([v1(i) v2(i) v3(i)]');
            %% plot end-effector space
            vx = [vx, v_robot(1)];
            vy = [vy, v_robot(2)];
            vz = [vz, v_robot(3)];
            wx = [wx, v_robot(4)];
            wy = [wy, v_robot(5)];
            wz = [wz, v_robot(6)];
            %vx
            plot(handles.vx_plot, t3(1:i), vx(1: end), 'LineWidth',1.5,'Color','r');
            %vy
            plot(handles.vy_plot, t3(1:i), vy(1: end) ,'LineWidth',1.5,'Color','r');
            %vz 
            plot(handles.vz_plot, t3(1:i), vz(1: end) ,'LineWidth',1.5,'Color','r');
            %wx 
            plot(handles.wx_plot, t3(1:i), wx(1:end) ,'LineWidth',1.5,'Color','r');
            %wy
            plot(handles.wy_plot, t3(1:i), wy(1:end) ,'LineWidth',1.5,'Color','r');
            %wz
            plot(handles.wz_plot, t3(1:i), wy(1:end) ,'LineWidth',1.5,'Color','r');
            hold on;  
        end
        arti_robot = temp_arti_robot;
        warndlg('Done');
    else 
        warndlg('Out range of worksapce');
    end
%% end function


function v_max_Callback(hObject, eventdata, handles)
% hObject    handle to v_max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of v_max as text
%        str2double(get(hObject,'String')) returns contents of v_max as a double


% --- Executes during object creation, after setting all properties.
function v_max_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v_max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function a_max_Callback(hObject, eventdata, handles)
% hObject    handle to a_max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of a_max as text
%        str2double(get(hObject,'String')) returns contents of a_max as a double


% --- Executes during object creation, after setting all properties.
function a_max_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a_max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btn_clear_lspb.
function btn_clear_lspb_Callback(hObject, eventdata, handles)
% hObject    handle to btn_clear_lspb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%% begin fuction
    cla(handles.joint1_q);
    cla(handles.joint1_v);
    cla(handles.joint1_a);
    
    cla(handles.joint2_q);
    cla(handles.joint2_v);
    cla(handles.joint2_a);

    cla(handles.joint3_q);
    cla(handles.joint3_v);
    cla(handles.joint3_a);

    cla(handles.vx_plot);
    cla(handles.vy_plot);
    cla(handles.vz_plot);

    cla(handles.wx_plot);
    cla(handles.wy_plot);
    cla(handles.wz_plot);
%% end function


% --- Executes on selection change in selection_menu.
function selection_menu_Callback(hObject, eventdata, handles)
% hObject    handle to selection_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns selection_menu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from selection_menu


% --- Executes during object creation, after setting all properties.
function selection_menu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to selection_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in select_menu.
function select_menu_Callback(hObject, eventdata, handles)
% hObject    handle to select_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns select_menu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from select_menu
%% start function
    contents = cellstr(get(hObject, 'String'));
    selected_option = contents{get(hObject, 'Value')};
    if selected_option == "Joint space"
        set(handles.joint_panel,'Visible','On');
        set(handles.end_panel,'Visible','Off');
    else
        set(handles.joint_panel,'Visible','Off');
        set(handles.end_panel,'Visible','On');
    end
%% end function
% --- Executes during object creation, after setting all properties.
function select_menu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to select_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
