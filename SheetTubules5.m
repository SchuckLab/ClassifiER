function varargout = SheetTubules5(varargin)
% SheetTubules5 MATLAB code for SheetTubules5.fig
%      SheetTubules5, by itself, creates a new SheetTubules5 or raises the existing
%      singleton*.
%
%      H = SheetTubules5 returns the handle to a new SheetTubules5 or the handle to
%      the existing singleton*.
%
%      SheetTubules5('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SheetTubules5.M with the given input arguments.
%
%      SheetTubules5('Property','Value',...) creates a new SheetTubules5 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the SheetTubules5 before SheetTubules5_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SheetTubules5_OpeningFcn via varargin.
%
%      *See SheetTubules5 Options on GUIDE's Tools menu.  Choose "SheetTubules5 allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SheetTubules5

% Last Modified by GUIDE v2.5 06-Feb-2021 14:47:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SheetTubules5_OpeningFcn, ...
                   'gui_OutputFcn',  @SheetTubules5_OutputFcn, ...
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


% --- Executes just before SheetTubules5 is made visible.
function SheetTubules5_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SheetTubules5 (see VARARGIN)

% Choose default command line output for SheetTubules5
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SheetTubules5 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SheetTubules5_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in load_total_ER_image.
function load_total_ER_image_Callback(hObject, eventdata, handles)
% hObject    handle to load_total_ER_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.axes1, 'NextPlot', 'replace');
global sheetImg sheetStackNum PathName sheetFileName
if isempty(PathName)
    [sheetFileName,PathName] = uigetfile('*.tif','Select the image containing sheets');
else
    [sheetFileName,PathName] = uigetfile('*.tif','Select the image containing sheets', PathName);
end
sheetImg = imread([PathName, sheetFileName], sheetStackNum);
sheetImg = double(sheetImg);
imshow(sheetImg,[min(sheetImg(:)) prctile(sheetImg(:), 99.99)], 'parent', handles.axes1);
set(handles.axes1, 'NextPlot', 'replacechildren');
linkaxes([handles.axes1 handles.axes2], 'xy');

% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function sheetStack_Callback(hObject, eventdata, handles)
% hObject    handle to sheetStack (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sheetStack as text
%        str2double(get(hObject,'String')) returns contents of sheetStack as a double
global sheetStackNum
sheetStackNum = str2double(get(hObject, 'String'));

% --- Executes during object creation, after setting all properties.
function sheetStack_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sheetStack (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in load_tubule_image.
function load_tubule_image_Callback(hObject, eventdata, handles)
% hObject    handle to load_tubule_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.axes2, 'NextPlot', 'replace');
global tubuleImg tubuleStackNum PathName tubuleFileName

if isempty(PathName)
    [tubuleFileName, PathName] = uigetfile('*.tif','Select the image containing sheets');
else
    [tubuleFileName, PathName] = uigetfile('*.tif','Select the image containing sheets', PathName);
end

tubuleImg = imread([PathName, tubuleFileName], tubuleStackNum);
tubuleImg = double(tubuleImg);
imshow(tubuleImg,[min(tubuleImg(:)) prctile(tubuleImg(:), 99.99)], 'parent', handles.axes2)
set(handles.axes2, 'NextPlot', 'replacechildren');

function tubuleStack_Callback(hObject, eventdata, handles)
% hObject    handle to tubuleStack (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tubuleStack as text
%        str2double(get(hObject,'String')) returns contents of tubuleStack as a double
global tubuleStackNum
tubuleStackNum = str2double(get(hObject, 'String'));

% --- Executes during object creation, after setting all properties.
function tubuleStack_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tubuleStack (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sheet_D_Callback(hObject, eventdata, handles)
% hObject    handle to sheet_D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sheet_D as text
%        str2double(get(hObject,'String')) returns contents of sheet_D as a double
global sheet_D
sheet_D = str2double(get(hObject,'String'));

% --- Executes during object creation, after setting all properties.
function sheet_D_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sheet_D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sheet_S_Callback(hObject, eventdata, handles)
% hObject    handle to sheet_S (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sheet_S as text
%        str2double(get(hObject,'String')) returns contents of sheet_S as a double
global sheet_S
sheet_S = str2double(get(hObject,'String'));

% --- Executes during object creation, after setting all properties.
function sheet_S_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sheet_S (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sheet_D_agg_Callback(hObject, eventdata, handles)
% hObject    handle to sheet_D_agg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sheet_D_agg as text
%        str2double(get(hObject,'String')) returns contents of sheet_D_agg as a double
global sheet_D_agg
sheet_D_agg = str2double(get(hObject,'String'));

% --- Executes during object creation, after setting all properties.
function sheet_D_agg_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sheet_D_agg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sheet_S_agg_Callback(hObject, eventdata, handles)
% hObject    handle to sheet_S_agg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sheet_S_agg as text
%        str2double(get(hObject,'String')) returns contents of sheet_S_agg as a double
global sheet_S_agg
sheet_S_agg = str2double(get(hObject,'String'));

% --- Executes during object creation, after setting all properties.
function sheet_S_agg_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sheet_S_agg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tubule_D_Callback(hObject, eventdata, handles)
% hObject    handle to tubule_D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tubule_D as text
%        str2double(get(hObject,'String')) returns contents of tubule_D as a double
global tubule_D
tubule_D = str2double(get(hObject,'String'));

% --- Executes during object creation, after setting all properties.
function tubule_D_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tubule_D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tubule_S_Callback(hObject, eventdata, handles)
% hObject    handle to tubule_S (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tubule_S as text
%        str2double(get(hObject,'String')) returns contents of tubule_S as a double
global tubule_S
tubule_S = str2double(get(hObject,'String'));

% --- Executes during object creation, after setting all properties.
function tubule_S_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tubule_S (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tubule_D_agg_Callback(hObject, eventdata, handles)
% hObject    handle to tubule_D_agg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tubule_D_agg as text
%        str2double(get(hObject,'String')) returns contents of tubule_D_agg as a double
global tubule_D_agg
tubule_D_agg = str2double(get(hObject,'String'));

% --- Executes during object creation, after setting all properties.
function tubule_D_agg_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tubule_D_agg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tubule_S_agg_Callback(hObject, eventdata, handles)
% hObject    handle to tubule_S_agg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tubule_S_agg as text
%        str2double(get(hObject,'String')) returns contents of tubule_S_agg as a double
global tubule_S_agg
tubule_S_agg = str2double(get(hObject,'String'));

% --- Executes during object creation, after setting all properties.
function tubule_S_agg_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tubule_S_agg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in make_stack_mask.
function make_stack_mask_Callback(hObject, eventdata, handles)
% hObject    handle to make_stack_mask (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sheet_D sheet_S sheet_D_agg sheet_S_agg sheetImg sheetMask sheetBGT sheetBGS segImg
sheetMask = calculate_stencil2(sheetImg, sheet_D, sheet_D_agg, sheet_S, sheet_S_agg, sheetBGT, sheetBGS);
sheet8 = uint8((sheetImg-min(sheetImg(:)))*255/(prctile(sheetImg(:),99.99)-min(sheetImg(:)))); % normalize image and make 8bit
if isempty(segImg)
    sheetsMasked = cat(3, sheet8 + uint8(sheetMask * 100), sheet8, sheet8);
else
    outline = bwperim(segImg);
    sheetsMasked = cat(3, sheet8 + uint8(sheetMask * 100), sheet8 + uint8(outline * 100), sheet8);
end
imshow(sheetsMasked, [], 'parent', handles.axes1)
set(handles.show_mask, 'value', 1);
set(handles.show_mask_overlap, 'value', 0);
set(handles.show_trim, 'value', 0);


% --- Executes on button press in make_tubule_mask.
function make_tubule_mask_Callback(hObject, eventdata, handles)
% hObject    handle to make_tubule_mask (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global tubule_D tubule_S tubule_D_agg tubule_S_agg tubuleImg tubuleMask tubuleBGT tubuleBGS segImg
tubuleMask = calculate_stencil2(tubuleImg, tubule_D, tubule_D_agg, tubule_S, tubule_S_agg, tubuleBGT, tubuleBGS);
tubule8 = uint8((tubuleImg-min(tubuleImg(:)))*255/(prctile(tubuleImg(:),99.99)-min(tubuleImg(:)))); % normalize image and make 8bit

if isempty(segImg)
    tubulesMasked = cat(3, tubule8 + uint8(tubuleMask * 100), tubule8, tubule8);
else
    outline = bwperim(segImg);
    tubulesMasked = cat(3, tubule8 + uint8(tubuleMask * 100), tubule8 + uint8(outline * 100), tubule8);
end



imshow(tubulesMasked, [], 'parent', handles.axes2)
set(handles.show_mask, 'value', 1);
set(handles.show_mask_overlap, 'value', 0);
set(handles.show_trim, 'value', 0);

% --- Executes on button press in calc_ratio.
function calc_ratio_Callback(hObject, eventdata, handles)
% hObject    handle to calc_ratio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sheetMask tubuleMask trim_factor trimMask sheetImg tubuleImg ...
    trimMaskR ratio ratio2 ratio3 ratio4 trueSheetMask

set(handles.text16, 'String', 'Rtn1 tubules/total ER:');
set(handles.text17, 'String', 'SEC63 tubules/ER:')

totalMask = or(sheetMask, tubuleMask);
ratio = sum(tubuleMask(:))/sum(totalMask(:));
set(handles.ratio_display, 'String', num2str(ratio));

tubuleOnlyMask = and(tubuleMask, sheetMask);
ratio2 = sum(tubuleOnlyMask(:))/sum(sheetMask(:));
set(handles.ratio_display_2, 'String', num2str(ratio2));

se = strel('disk', trim_factor);


sheetMask2 = imresize(sheetMask,2); 
trimmedSheets = imerode(sheetMask2,se); 
trimmedSheets = imdilate(trimmedSheets, se);
trimmedSheets = imresize(trimmedSheets, 0.5);
trimMask = and(sheetMask,trimmedSheets);
ratio3 = sum(trimMask(:))/sum(sheetMask(:));
set(handles.alt_ratio_display, 'String', num2str(ratio3));

tubuleMask2 = imresize(tubuleMask,2);
trimmedTubules = imerode(tubuleMask2,se);
trimmedTubules = imdilate(trimmedTubules, se);
trimmedTubules = imresize(trimmedTubules, 0.5);
trimMaskR = and(tubuleMask,trimmedTubules);

trueSheetMask = (trimMask - trimMaskR)>0;
ratio4 = sum(trueSheetMask(:))/sum(sheetMask(:));
set(handles.true_sheet_ratio, 'String', num2str(ratio4));

if get(handles.show_trim, 'value')
        sheet8 = uint8((sheetImg-min(sheetImg(:)))*255/(prctile(sheetImg(:), 99.99)-min(sheetImg(:)))); % normalize image and make 8bit
        trimMasked = cat(3, sheet8 + uint8(((trimMask)>0) * 100), sheet8 + uint8(((sheetMask-and(trimMask, trimMaskR)>0)) * 100), sheet8);
        imshow(trimMasked, [], 'parent', handles.axes1)
        
        tubule8 = uint8((tubuleImg-min(tubuleImg(:)))*255/(prctile(tubuleImg(:), 99.99)-min(tubuleImg(:)))); % normalize image and make 8bit
        trimMaskedR = cat(3, tubule8 + uint8(trimMaskR * 100), tubule8 + uint8(tubuleMask * 100), tubule8);
        imshow(trimMaskedR, [], 'parent', handles.axes2)
end





% --- Executes on button press in show_mask.
function show_mask_Callback(hObject, eventdata, handles)
% hObject    handle to show_mask (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sheetMask sheetImg tubuleMask tubuleImg
if and(~isempty(sheetMask),~isempty(sheetImg))
    if get(hObject,'Value')
         sheet8 = uint8((sheetImg-min(sheetImg(:)))*255/(prctile(sheetImg(:), 99.99)-min(sheetImg(:)))); % normalize image and make 8bit
         sheetsMasked = cat(3, sheet8 + uint8(sheetMask * 100), sheet8, sheet8);
         tubule8 = uint8((tubuleImg-min(tubuleImg(:)))*255/(prctile(tubuleImg(:), 99.99)-min(tubuleImg(:)))); % normalize image and make 8bit
         tubulesMasked = cat(3, tubule8 + uint8(tubuleMask * 100), tubule8, tubule8);
         imshow(sheetsMasked, [], 'parent', handles.axes1)
         imshow(tubulesMasked, [], 'parent', handles.axes2)
         set(handles.show_mask_overlap, 'value', 0);
         set(handles.show_trim, 'value', 0);




    else
        imshow(sheetImg, [min(sheetImg(:)) prctile(sheetImg(:), 99.99)], 'parent', handles.axes1)
        imshow(tubuleImg, [min(tubuleImg(:)) prctile(tubuleImg(:), 99.99)], 'parent', handles.axes2)
    end
end

% Hint: get(hObject,'Value') returns toggle state of show_mask



function sheetBGT_Callback(hObject, eventdata, handles)
% hObject    handle to sheetBGT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sheetBGT as text
%        str2double(get(hObject,'String')) returns contents of sheetBGT as a double
global sheetBGT
sheetBGT = str2double(get(hObject,'String'));

% --- Executes during object creation, after setting all properties.
function sheetBGT_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sheetBGT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tubuleBGT_Callback(hObject, eventdata, handles)
% hObject    handle to tubuleBGT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tubuleBGT as text
%        str2double(get(hObject,'String')) returns contents of tubuleBGT as a double
global tubuleBGT
tubuleBGT = str2double(get(hObject,'String'));

% --- Executes during object creation, after setting all properties.
function tubuleBGT_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tubuleBGT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in show_mask_overlap.
function show_mask_overlap_Callback(hObject, eventdata, handles)
% hObject    handle to show_mask_overlap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of show_mask_overlap
global sheetMask sheetImg tubuleMask tubuleImg
if and(~isempty(sheetMask),~isempty(sheetImg))
    if get(hObject,'Value')
        
        sheet8 = uint8((sheetImg-min(sheetImg(:)))*255/(prctile(sheetImg(:), 99.99)-min(sheetImg(:)))); % normalize image and make 8bit
        tubule8 = uint8((tubuleImg-min(tubuleImg(:)))*255/(prctile(tubuleImg(:), 99.99)-min(tubuleImg(:)))); % normalize image and make 8bit
        tubulesMasked = cat(3, tubule8 + uint8(tubuleMask * 100), tubule8 + uint8(sheetMask * 100), tubule8);
        sheetsMasked = cat(3, sheet8 + uint8(tubuleMask * 100), sheet8 + uint8(sheetMask * 100), sheet8);
        imshow(sheetsMasked, [], 'parent', handles.axes1)
        imshow(tubulesMasked, [], 'parent', handles.axes2)
        set(handles.show_mask, 'value', 0);
        set(handles.show_trim, 'value', 0);
    else
        imshow(sheetImg, [min(sheetImg(:)) prctile(sheetImg(:), 99.99)], 'parent', handles.axes1)
        imshow(tubuleImg, [min(tubuleImg(:)) prctile(tubuleImg(:), 99.99)], 'parent', handles.axes2)
    end
end



function trim_Callback(hObject, eventdata, handles)
% hObject    handle to trim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of trim as text
%        str2double(get(hObject,'String')) returns contents of trim as a double
global trim_factor
trim_factor = str2double(get(hObject,'String'));

% --- Executes during object creation, after setting all properties.
function trim_CreateFcn(hObject, eventdata, handles)
% hObject    handle to trim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in show_trim.
function show_trim_Callback(hObject, eventdata, handles)
% hObject    handle to show_trim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of show_trim
global trimMask trimMaskR sheetMask sheetImg  tubuleImg tubuleMask
if and(~isempty(sheetMask),~isempty(sheetImg))
    if get(hObject,'Value')
        
        sheet8 = uint8((sheetImg-min(sheetImg(:)))*255/(prctile(sheetImg(:), 99.99)-min(sheetImg(:)))); % normalize image and make 8bit
        trimMasked = cat(3, sheet8 + uint8(((trimMask)>0) * 100), sheet8 + uint8(((sheetMask-and(trimMask, trimMaskR)>0)) * 100), sheet8);
        imshow(trimMasked, [], 'parent', handles.axes1)
        
        tubule8 = uint8((tubuleImg-min(tubuleImg(:)))*255/(prctile(tubuleImg(:), 99.99)-min(tubuleImg(:)))); % normalize image and make 8bit
        trimMaskedR = cat(3, tubule8 + uint8(trimMaskR * 100), tubule8 + uint8(tubuleMask * 100), tubule8);
        imshow(trimMaskedR, [], 'parent', handles.axes2)
        
        set(handles.show_mask, 'value', 0);
        set(handles.show_mask_overlap, 'value', 0);
    else
        imshow(sheetImg, [min(sheetImg(:)) prctile(sheetImg(:), 99.99)], 'parent', handles.axes1)
        imshow(tubuleImg, [min(tubuleImg(:)) prctile(tubuleImg(:), 99.99)], 'parent', handles.axes2)
    end
end



function sheetBGS_Callback(hObject, eventdata, handles)
% hObject    handle to sheetBGS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sheetBGS as text
%        str2double(get(hObject,'String')) returns contents of sheetBGS as a double
global sheetBGS
sheetBGS = str2double(get(hObject,'String'));

% --- Executes during object creation, after setting all properties.
function sheetBGS_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sheetBGS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tubuleBGS_Callback(hObject, eventdata, handles)
% hObject    handle to tubuleBGS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tubuleBGS as text
%        str2double(get(hObject,'String')) returns contents of tubuleBGS as a double
global tubuleBGS
tubuleBGS = str2double(get(hObject,'String'));

% --- Executes during object creation, after setting all properties.
function tubuleBGS_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tubuleBGS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in copy2clip.
function copy2clip_Callback(hObject, eventdata, handles)
% hObject    handle to copy2clip (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sheet_D sheet_D_agg sheetBGT sheet_S sheet_S_agg ...
    sheetBGS tubule_D tubule_D_agg tubuleBGT tubule_S tubule_S_agg ...
    tubuleBGS trim_factor ratio ratio2 ratio3 ratio4 PathName ... 
    sheetFileName tubuleFileName numCells segAdj

mat2clip({PathName, sheetFileName, tubuleFileName, sheet_D, sheet_D_agg, ...
    sheetBGT, sheet_S, sheet_S_agg, sheetBGS, tubule_D, tubule_D_agg, ...
    tubuleBGT, tubule_S, tubule_S_agg, tubuleBGS, trim_factor, ratio, ...
    ratio2, ratio3, ratio4, numCells, segAdj});



function numCells_Callback(hObject, eventdata, handles)
% hObject    handle to numCells (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of numCells as text
%        str2double(get(hObject,'String')) returns contents of numCells as a double
global numCells
numCells = str2double(get(hObject,'String'));

% --- Executes during object creation, after setting all properties.
function numCells_CreateFcn(hObject, eventdata, handles)
% hObject    handle to numCells (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in load_seg_image.
function load_seg_image_Callback(hObject, eventdata, handles)
% hObject    handle to load_seg_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global segImg PathName sheetImg segAdj segImg0 numCells
if isempty(PathName)
    [segFileName,PathName] = uigetfile(fullfile('*.tif;*.mat'),'Select the image or .mat file for segmentation');
else
    [segFileName,PathName] = uigetfile(fullfile('*.tif;*.mat'),'Select the image or .mat file for segmentation', PathName);
end
if strcmp(lower(segFileName(end-2:end)), 'tif')
    segImg = imread([PathName, segFileName]);  
    segImg = double(segImg);
    segImg(segImg==0)=1;
    segImg(segImg==255)=0;
else
    load([PathName, segFileName]);
    segImg = segmentationMask > 0;
    D = -bwdist(~segImg);
    minimums = imextendedmin(D,5); % <- optimise this number
    D2 = imimposemin(D,minimums);
    Ld2 = watershed(D2);
    segImg(Ld2 == 0) = 0;
end


segImg = segImg > 0;
segImg0 = segImg;
[bw, numCells] = bwlabel(segImg);
set(handles.numCells, 'String', num2str(numCells));
se = strel('Disk',abs(segAdj));
if segAdj > 0
    segImg = imdilate(segImg, se);
elseif segAdj < 0
    segImg = imerode(segImg, se);
end
sheet8 = uint8((sheetImg-min(sheetImg(:)))*255/(prctile(sheetImg(:),99.99)-min(sheetImg(:)))); % normalize image and make 8bit
bw = bwperim(segImg);
segmask = cat(3, sheet8 + uint8(bw * 255), sheet8, sheet8);
imshow(segmask, [], 'parent', handles.axes1)


% --- Executes on button press in calc_seg_ratios.
function calc_seg_ratios_Callback(hObject, eventdata, handles)
% hObject    handle to calc_seg_ratios (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global trimMask sheetMask trueSheetMask segImg sheetImg ratio ratio2 ratio3 ratio4
props = regionprops(segImg, sheetMask, 'Area', 'PixelValues');
props2 = regionprops(segImg, trimMask, 'Area', 'PixelValues');
props3 = regionprops(segImg, trueSheetMask, 'Area', 'PixelValues');

for i=1:numel(props)
    props(i).totalERcoverage = sum(props(i).PixelValues)/props(i).Area;
    props(i).ratio3 = sum(props2(i).PixelValues)/sum(props(i).PixelValues);
    props(i).ratio4 = sum(props3(i).PixelValues)/sum(props(i).PixelValues);
end
ratio = 'n/a';
ratio2 = nanmean([props(:).totalERcoverage]);
ratio3 = nanmean([props(:).ratio3]);
ratio4 = nanmean([props(:).ratio4]);
set(handles.text16, 'String', '');
set(handles.ratio_display, 'String', '');
set(handles.text17, 'String', 'ER coverage:')
set(handles.ratio_display_2, 'String', num2str(ratio2));
set(handles.alt_ratio_display, 'String', num2str(ratio3));
set(handles.true_sheet_ratio, 'String', num2str(ratio4));

sheet8 = uint8((sheetImg-min(sheetImg(:)))*255/(prctile(sheetImg(:),99.99)-min(sheetImg(:)))); % normalize image and make 8bit
bw = bwperim(segImg);
segmask = cat(3, sheet8 + uint8(bw * 255), sheet8, sheet8);
imshow(segmask, [], 'parent', handles.axes1)



function seg_adj_Callback(hObject, eventdata, handles)
% hObject    handle to seg_adj (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of seg_adj as text
%        str2double(get(hObject,'String')) returns contents of seg_adj as a double
global segAdj
segAdj = str2num(get(hObject,'String'));

% --- Executes during object creation, after setting all properties.
function seg_adj_CreateFcn(hObject, eventdata, handles)
% hObject    handle to seg_adj (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in update_seg.
function update_seg_Callback(hObject, eventdata, handles)
% hObject    handle to update_seg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global segImg0 sheetImg segAdj segImg
se = strel('Disk',abs(segAdj));
if segAdj > 0
    segImg = imdilate(segImg0, se);
elseif segAdj < 0
    segImg = imerode(segImg0, se);
elseif segAdj ==0
    segImg = segImg0;
end
sheet8 = uint8((sheetImg-min(sheetImg(:)))*255/(prctile(sheetImg(:),99.99)-min(sheetImg(:)))); % normalize image and make 8bit
bw = bwperim(segImg);
segmask = cat(3, sheet8 + uint8(bw * 255), sheet8, sheet8);
imshow(segmask, [], 'parent', handles.axes1)
