function varargout = mysample_timer(varargin)
% MYSAMPLE_TIMER MATLAB code for mysample_timer.fig
%      MYSAMPLE_TIMER, by itself, creates a new MYSAMPLE_TIMER or raises the existing
%      singleton*.
%
%      H = MYSAMPLE_TIMER returns the handle to a new MYSAMPLE_TIMER or the handle to
%      the existing singleton*.
%
%      MYSAMPLE_TIMER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MYSAMPLE_TIMER.M with the given input arguments.
%
%      MYSAMPLE_TIMER('Property','Value',...) creates a new MYSAMPLE_TIMER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before mysample_timer_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to mysample_timer_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help mysample_timer

% Last Modified by GUIDE v2.5 08-Aug-2014 12:25:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @mysample_timer_OpeningFcn, ...
                   'gui_OutputFcn',  @mysample_timer_OutputFcn, ...
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


% --- Executes just before mysample_timer is made visible.
function mysample_timer_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to mysample_timer (see VARARGIN)

% Choose default command line output for mysample_timer
handles.output = hObject;
handles.timer = timer(...
    'ExecutionMode', 'fixedRate', ...       % Run timer repeatedly
    'Period', 0.01, ...                        % Initial period is 1 sec.
    'TimerFcn', {@mytime_callback,hObject}); % Specify callback function
handles.hzq=10;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes mysample_timer wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = mysample_timer_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
start(handles.timer);

function mytime_callback(hObject,eventdata,hfigure)
% Timer timer1 callback, called each time timer iterates.
% Gets surface Z data, adds noise, and writes it back to surface object.
fprintf('new\n');
handles = guidata(hfigure);
fprintf('%d\n',handles.hzq);
% END USER CODE


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
stop(handles.timer);
