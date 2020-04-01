function varargout = main(varargin)
% MAIN MATLAB code for main.fig
%      MAIN, by itself, creates a new MAIN or raises the existing
%      singleton*.
%
%      H = MAIN returns the handle to a new MAIN or the handle to
%      the existing singleton*.
%
%      MAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN.M with the given input arguments.
%
%      MAIN('Property','Value',...) creates a new MAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before main_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to main_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help main

% Last Modified by GUIDE v2.5 09-Jul-2017 04:36:10

% Begin initialization code - DO NOT EDIT

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main_OpeningFcn, ...
                   'gui_OutputFcn',  @main_OutputFcn, ...
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


% --- Executes just before main is made visible.
function main_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to main (see VARARGIN)

% Choose default command line output for main

handles.output = hObject;

% Update handles structure
% guidata(hObject, handles);

load binaryalphadigs

handles.dat=dat;
handles.cl = classlabels;

set(handles.consoleTxt, 'String' ,'');
handles.consoleText = get(handles.consoleTxt, 'String');
guidata(hObject, handles);

% --- Outputs from this function are returned to the command line.
function varargout = main_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;


% --- Executes on button press in simImgBtn.
function simImgBtn_Callback(hObject, eventdata, handles)

char = simmat(handles.net, handles.cl, ~handles.mat );
disp(char);

function layersTxt_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function layersTxt_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function unitsTxt_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function unitsTxt_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in trFcn.
function trFcn_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function trFcn_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in hiddenFcn.
function hiddenFcn_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function hiddenFcn_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
system('start microsoft.windows.camera:');

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
    disp('Load image button pressed ...')
    [filename, user_cancelled] = imgetfile;
    if user_cancelled
            disp('User pressed cancel')
    else
            disp(['User selected ', filename]);
            disp('Reading the image into variable X');
            [X,map] = imread(filename);
            imshow(X,'Parent',handles.axes1);
            handles.mat = image2mat(filename);
            imshow(handles.mat,'Parent',handles.axes2);

            set(handles.fileLbl,'string',filename);
            assignin('base','X',X); 
            assignin('base','map',map);
    end
    %image2mat()
    %mat2
    guidata(hObject, handles);
     

% --- Executes on button press in createBtn.
function createBtn_Callback(hObject, eventdata, handles)
set(handles.consoleTxt, 'String' ,'');
handles.consoleText = get(handles.consoleTxt, 'String');
handles.consoleText = sprintf('%sA iniciar', handles.consoleText);

set(handles.consoleTxt, 'String' ,handles.consoleText);

layers = get(handles.popCamadas, 'Value');
handles.consoleText = sprintf('%s\nNúmero de Camadas: %d', handles.consoleText,layers);
set(handles.consoleTxt, 'String' ,handles.consoleText);

val = get(handles.unitsTxt, 'String');
units = str2num(val);
handles.consoleText = sprintf('%s\nNúmero de Unidades: %d', handles.consoleText,units);
set(handles.consoleTxt, 'String' ,handles.consoleText);

val = get(handles.txtEpocas, 'String');
epochsN = str2num(val);
handles.consoleText = sprintf('%s\nNúmero de Épocas: %d', handles.consoleText,epochsN);
set(handles.consoleTxt, 'String' ,handles.consoleText);

val = get(handles.hiddenFcn,'Value'); 
string_list = get(handles.hiddenFcn,'String');
transfFnc1 = string_list{val};
handles.consoleText = sprintf('%s\nFunção de Camada #1: %s', handles.consoleText,transfFnc1);
set(handles.consoleTxt, 'String' ,handles.consoleText);
% disp(transfFnc1);

if(layers > 1)
    val = get(handles.hiddenFcn2,'Value');
    string_list = get(handles.hiddenFcn2,'String');
    transfFnc2 = string_list{val};
    handles.consoleText = sprintf('%s\nFunção de Camada #2: %s', handles.consoleText,transfFnc2);
    set(handles.consoleTxt, 'String' ,handles.consoleText);
else
    transfFnc2 = 0;
end


val = get(handles.trFcn,'Value');
string_list = get(handles.trFcn,'String');
trf = string_list{val};
handles.consoleText = sprintf('%s\nFunção de Treino: %s', handles.consoleText,trf);
set(handles.consoleTxt, 'String' ,handles.consoleText);

val = get(handles.divPop,'Value');
string_list = get(handles.divPop,'String');
divFnc = string_list{val};
handles.consoleText = sprintf('%s\nFunção de Divisão: %s', handles.consoleText,divFnc);
set(handles.consoleTxt, 'String' ,handles.consoleText);

outputFnc = get(handles.outputPop,'Value');
string_list = get(handles.outputPop,'String');
outputFnc = string_list{val};
handles.consoleText = sprintf('%s\nFunção de Saida: %s', handles.consoleText,outputFnc);
set(handles.consoleTxt, 'String' ,handles.consoleText);

val = get(handles.trainSegTxt, 'String');
trainSeg = str2double(val);
handles.consoleText = sprintf('%s\nSegmentação de Treino: %.4f', handles.consoleText,trainSeg);
set(handles.consoleTxt, 'String' ,handles.consoleText);

val = get(handles.valSegTxt, 'String');
valSeg = str2double(val);
handles.consoleText = sprintf('%s\nSegmentação de Validação: %.4f', handles.consoleText,valSeg);
set(handles.consoleTxt, 'String' ,handles.consoleText);

val = get(handles.testSegTxt, 'String');
testSeg = str2double(val);
handles.consoleText = sprintf('%s\nSegmentação de Teste: %.4f', handles.consoleText,testSeg);
set(handles.consoleTxt, 'String' ,handles.consoleText);


try
%     consoleText = strcat(get(handles.consoleTxt,'String'),sprintf('\nasdasd!'));
    handles.consoleText = sprintf('%s\nA criar!', handles.consoleText);
    set(handles.consoleTxt, 'String' ,handles.consoleText);
    
    handles.net = GUI_createNN(layers,units,transfFnc1,transfFnc2,trf,epochsN,divFnc,outputFnc,trainSeg,valSeg,testSeg);
    
    handles.consoleText = sprintf('%s\nRede Criada', handles.consoleText);
    set(handles.consoleTxt, 'String' ,handles.consoleText);
    waitfor(msgbox('Rede Criada!'));
    set(handles.uipanel7, 'Visible', 'on');
    view(handles.net);
    guidata(hObject,handles);
    
catch ME
    disp(ME.message);
    switch ME.message      
        case 'Index exceeds matrix dimensions.'
            waitfor(errordlg('Deve verificar as unidades','Erro'));
        case 'NET.trainParam.epochs is not scalar.'
            waitfor(errordlg('Deve verificar as épocas','Erro'));
        otherwise
            waitfor(errordlg(ME.message,'Erro'));
    end
    
end


% --- Executes on selection change in hiddenFcn2.
function hiddenFcn2_Callback(hObject, eventdata, handles)
% hObject    handle to hiddenFcn2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns hiddenFcn2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from hiddenFcn2


% --- Executes during object creation, after setting all properties.
function hiddenFcn2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hiddenFcn2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)



% --- Executes on selection change in trainDataPop.
function trainDataPop_Callback(hObject, eventdata, handles)

function trainDataPop_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function charNumTxt_Callback(hObject, eventdata, handles)

function charNumTxt_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sampleTxt_Callback(hObject, eventdata, handles)

function sampleTxt_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function simTxtBtn_Callback(hObject, eventdata, handles)

charNumTxt = 2;
sampleTxt = 2;

% mat_teste = logical(cell2mat(handles.dat(charNumTxt,sampleTxt)));
[char,out] = simcell( handles.net, handles.cl, handles.dat(charNumTxt,sampleTxt));
% out = sim(handles.net, handles.inputs);
disp(char);


function popCamadas_Callback(hObject, eventdata, handles)

switch get(hObject, 'Value')
    case 1
      set(handles.lblActiveFcn2, 'Visible', 'off');
      set(handles.hiddenFcn2, 'Visible', 'off');
    case 2
      set(handles.lblActiveFcn2, 'Visible', 'on');
      set(handles.hiddenFcn2, 'Visible', 'on');
end

% --- Executes during object creation, after setting all properties.
function popCamadas_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)

function loadNetBtn_Callback(hObject, eventdata, handles)

try
    [filename,filepath] = uigetfile('*.mat', 'Selecione uma rede');
    load([filepath,filename]);
    
    handles.net = net;
  
    view(handles.net);
    set(handles.netPathLbl,'string',filename);
    set(handles.uipanel7, 'Visible', 'off');
    handles.consoleText = sprintf('%s\n%s Rede Carregada', handles.consoleText,filename);
    set(handles.consoleTxt, 'String' ,handles.consoleText);
    guidata(hObject,handles);
catch ME
    waitfor(errordlg(ME.message,'Erro'));
end

function divPop_Callback(hObject, eventdata, handles)

function divPop_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function txtEpocas_Callback(hObject, eventdata, handles)

function txtEpocas_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in outputPop.
function outputPop_Callback(hObject, eventdata, handles)

function outputPop_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function trainSegTxt_Callback(hObject, eventdata, handles)

function trainSegTxt_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function testSegTxt_Callback(hObject, eventdata, handles)

function testSegTxt_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function valSegTxt_Callback(hObject, eventdata, handles)

function valSegTxt_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function trainBtn_Callback(hObject, eventdata, handles)

val = get(handles.trainDataPop,'Value');
% try
%     net = handles.net;
    
    handles.consoleText = sprintf('%s\nA Iniciar treino!', handles.consoleText);
    set(handles.consoleTxt, 'String' ,handles.consoleText);
    if(val == 1)
        handles.consoleText = sprintf('%s\nA treinar digitos!', handles.consoleText);
        set(handles.consoleTxt, 'String' ,handles.consoleText);       
        [handles.inputs, handles.targets] = initData(10, handles.dat);
    else
        handles.consoleText = sprintf('%s\nA treinar Alfanúmericos!', handles.consoleText);
        set(handles.consoleTxt, 'String' ,handles.consoleText);
        [handles.inputs, handles.targets] = initData(36, handles.dat);
        
    end    
    [handles.net ,handles.tr] = train(handles.net, handles.inputs, handles.targets);

    handles.consoleText = sprintf('%s\nTreino completo', handles.consoleText);
    set(handles.consoleTxt, 'String' ,handles.consoleText);
    
    waitfor(msgbox('Treino completo!'));
    
    out = sim(handles.net,  handles.inputs);
    figure;
    plotconfusion(handles.targets, out);
    
    guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function consoleTxt_CreateFcn(hObject, eventdata, handles)

function consoleTxt_Callback(hObject, eventdata, handles)


% --- Executes on button press in saveBtn.
function saveBtn_Callback(hObject, eventdata, handles)
% hObject    handle to saveBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
net = handles.net;
tr = handles.tr;
input = handles.inputs;
targets = handles.targets;

save('net.mat','net','tr','input','targets');

handles.consoleText = sprintf('%s\nRede guardada', handles.consoleText);
set(handles.consoleTxt, 'String' ,handles.consoleText);
guidata(hObject,handles);

