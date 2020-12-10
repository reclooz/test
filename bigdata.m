function varargout = bigdata(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @bigdata_OpeningFcn, ...
                   'gui_OutputFcn',  @bigdata_OutputFcn, ...
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


% --- Executes just before bigdata is made visible.
function bigdata_OpeningFcn(hObject, eventdata, handles, varargin)


handles.dataset = 'o3_surface_20180701000000.nc';

handles.lon = ncread(handles.dataset, 'lon'); handles.nx = length(handles.lon);
handles.lat = ncread(handles.dataset, 'lat'); handles.ny = length(handles.lat);
handles.time = ncread(handles.dataset, 'hour');
handles.ozone = 'chimere_ozone';
handles.currentTime = 1;
handles.hour = ncread(handles.dataset, handles.ozone,[1 1 handles.currentTime],[handles.nx handles.ny 1]);

map = pcolor(handles.lon, handles.lat,handles.hour');
map.EdgeAlpha=0;    %changes the transparency to 0
load coastlines;
line(coastlon,coastlat);

% Choose default command line output for bigdata
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes bigdata wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = bigdata_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;


% --- Executes on selection change in popup_colourblind.
function popup_colourblind_Callback(hObject, eventdata, handles)

handles.color_schemes = ["default", "autumn", "bone", "cool", "copper", "gray", "hot", "hsv", "jet", "lines", "pink", "spring", "summer", "winter"]
val = get(hObject, 'val');
current_hour = get(handles.slider_hour, 'val');
current_hour = round(current_hour);
handles.currentTime = current_hour;
handles.color_scheme = handles.color_schemes(val); %set the color_scheme variable to the value they pick from the dropdown
handles.hour = ncread(handles.dataset, handles.ozone,[1 1 handles.currentTime],[handles.nx handles.ny 1]);
map = pcolor(handles.lon, handles.lat,handles.hour');
map.EdgeAlpha=0;
colormap(handles.color_scheme)
load coastlines;
line(coastlon,coastlat);
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function popup_colourblind_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider_hour_Callback(hObject, eventdata, handles)


val = get(hObject, 'val');
val = round(val);
handles.currentTime = val;

set(handles.hourtext,'String',num2str(val));

handles.hour = ncread(handles.dataset, handles.ozone,[1 1 handles.currentTime],[handles.nx handles.ny 1]);
map = pcolor(handles.lon, handles.lat,handles.hour');
map.EdgeAlpha=0;
load coastlines;
line(coastlon,coastlat);
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function slider_hour_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in chimere_ozone.
function chimere_ozone_Callback(hObject, eventdata, handles)

handles.ozone = 'chimere_ozone';
val = get(handles.slider_hour, 'val');
val = round(val);
handles.currentTime = val;
handles.hour = ncread(handles.dataset, handles.ozone,[1 1 handles.currentTime],[handles.nx handles.ny 1]);
map = pcolor(handles.lon, handles.lat,handles.hour');
map.EdgeAlpha=0;
load coastlines;
line(coastlon,coastlat);
guidata(hObject, handles);

% --- Executes on button press in emep_ozone.
function emep_ozone_Callback(hObject, eventdata, handles)

handles.ozone = 'emep_ozone';
val = get(handles.slider_hour, 'val');
val = round(val);
handles.currentTime = val;
handles.hour = ncread(handles.dataset, handles.ozone,[1 1 handles.currentTime],[handles.nx handles.ny 1]);
map = pcolor(handles.lon, handles.lat,handles.hour');
map.EdgeAlpha=0;
load coastlines;
line(coastlon,coastlat);
guidata(hObject, handles);

% --- Executes on button press in ensemble_ozone.
function ensemble_ozone_Callback(hObject, eventdata, handles)

handles.ozone = 'ensemble_ozone';
val = get(handles.slider_hour, 'val');
val = round(val);
handles.currentTime = val;
handles.hour = ncread(handles.dataset, handles.ozone,[1 1 handles.currentTime],[handles.nx handles.ny 1]);
map = pcolor(handles.lon, handles.lat,handles.hour');
map.EdgeAlpha=0;
load coastlines;
line(coastlon,coastlat);
guidata(hObject, handles);

% --- Executes on button press in eurad_ozone.
function eurad_ozone_Callback(hObject, eventdata, handles)

handles.ozone = 'eurad_ozone';
val = get(handles.slider_hour, 'val');
val = round(val);
handles.currentTime = val;
handles.hour = ncread(handles.dataset, handles.ozone,[1 1 handles.currentTime],[handles.nx handles.ny 1]);
map = pcolor(handles.lon, handles.lat,handles.hour');
map.EdgeAlpha=0;
load coastlines;
line(coastlon,coastlat);
guidata(hObject, handles);

% --- Executes on button press in lotoseuros_ozone.
function lotoseuros_ozone_Callback(hObject, eventdata, handles)

handles.ozone = 'lotoseuros_ozone';
val = get(handles.slider_hour, 'val');
val = round(val);
handles.currentTime = val;
handles.hour = ncread(handles.dataset, handles.ozone,[1 1 handles.currentTime],[handles.nx handles.ny 1]);
map = pcolor(handles.lon, handles.lat,handles.hour');
map.EdgeAlpha=0;
load coastlines;
line(coastlon,coastlat);
guidata(hObject, handles);

% --- Executes on button press in match_ozone.
function match_ozone_Callback(hObject, eventdata, handles)

handles.ozone = 'match_ozone';
val = get(handles.slider_hour, 'val');
val = round(val);
handles.currentTime = val;
handles.hour = ncread(handles.dataset, handles.ozone,[1 1 handles.currentTime],[handles.nx handles.ny 1]);
map = pcolor(handles.lon, handles.lat,handles.hour');
map.EdgeAlpha=0;
load coastlines;
line(coastlon,coastlat);
guidata(hObject, handles);

% --- Executes on button press in mocage_ozone.
function mocage_ozone_Callback(hObject, eventdata, handles)

handles.ozone = 'mocage_ozone';
val = get(handles.slider_hour, 'val');
val = round(val);
handles.currentTime = val;
handles.hour = ncread(handles.dataset, handles.ozone,[1 1 handles.currentTime],[handles.nx handles.ny 1]);
map = pcolor(handles.lon, handles.lat,handles.hour');
map.EdgeAlpha=0;
load coastlines;
line(coastlon,coastlat);
guidata(hObject, handles);

% --- Executes on button press in silam_ozone.
function silam_ozone_Callback(hObject, eventdata, handles)

handles.ozone = 'silam_ozone';
val = get(handles.slider_hour, 'val');
val = round(val);
handles.currentTime = val;
handles.hour = ncread(handles.dataset, handles.ozone,[1 1 handles.currentTime],[handles.nx handles.ny 1]);
map = pcolor(handles.lon, handles.lat,handles.hour');
map.EdgeAlpha=0;
load coastlines;
line(coastlon,coastlat);
guidata(hObject, handles);

% --- Executes on button press in btn_exit.
function btn_exit_Callback(hObject, eventdata, handles)

closereq();
