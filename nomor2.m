function varargout = nomor2(varargin)
% nomor2 MATLAB code for nomor2.fig
%      nomor2, by itself, creates a new nomor2 or raises the existing
%      singleton*.
%
%      H = nomor2 returns the handle to a new nomor2 or the handle to
%      the existing singleton*.
%
%      nomor2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in nomor2.M with the given input arguments.
%
%      nomor2('Property','Value',...) creates a new nomor2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before nomor2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to nomor2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help nomor2

% Last Modified by GUIDE v2.5 26-Jun-2021 01:24:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @nomor2_OpeningFcn, ...
                   'gui_OutputFcn',  @nomor2_OutputFcn, ...
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


% --- Executes just before nomor2 is made visible.
function nomor2_OpeningFcn(hObject, ~, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to nomor2 (see VARARGIN)

% Choose default command line output for nomor2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes nomor2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = nomor2_OutputFcn(~, ~, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in tampil.
function tampil_Callback(~, ~, handles)
% hObject    handle to tampil (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = xlsread('DataRumah.xlsx','C2:H21');%membaca file yang terdapat pada RUMAH.xlsx pada kolom C2 sampai H21
set(handles.data,'data',data);% menampilkan pada tabel dengan tag data     



% --- Executes on button press in proses.
function proses_Callback(~, ~, handles)
% hObject    handle to proses (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
w = [0.3,0.2,0.23,0.1,0.07,0.1];%bobot yang telah di tentukan
k = [0,1,1,1,1,1];%menentukan cost atau benefit
x = xlsread('DataRumah.xlsx','C2:H21');%membaca file 

[m,n]=size (x); 
R=zeros (m,n); %membuat matriks R, yang merupakan matriks kosong
Y=zeros (m,n); %membuat matriks Y, yang merupakan titik kosong
for j=1:n
    if k(j)==1 %statement untuk kriteria dengan atribut benefit
        R(:,j)=x(:,j)./max(x(:,j));
    else %statement untuk kriteria dengan atribut cost
        R(:,j)=min(x(:,j))./x(:,j);
    end
end

for i=1:m
    V(i)= sum(w.*R(i,:)); %proses perhitungan nilai   
end

peringkat = sort(V, 'descend'); %melakukan peringkatan atau pengurutan
set(handles.hasil, 'data', peringkat); %menampilkan data yang sudah di urutkan ke tabel dengan tag hasil
