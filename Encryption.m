clear;
clc;
%% Welcome Message and Start Button
  % code to play welcome sound located in our file
[y,Fs] = audioread('welcome.m4a');
sound(y,Fs);
%pause(5)
%[y,Fs] = audioread('songg.mp3');
%sound(y,Fs);
% Name of Program
disp('Image Encryption Tool')
%BUTTON DISPLAYS WELCOME MESSAGE
 button = questdlg('Welcome to the Image Encryption Tool','Welcome','Start','Start');
 
%% Import the Image to be visible
%ask user to import an image file from their computer
[y,Fs] = audioread('pick1.m4a');
sound(y,Fs);
f=uigetfile({'*.jpg';'*.png';'*.bmp'});
%makes sure importing an image is required
while f==0
    [y,Fs] = audioread('pick1.m4a');
sound(y,Fs);
f=uigetfile({'*.jpg';'*.png';'*.bmp'});
end
First = imread(f);
%% Import the Hidden Image and change to Binary Image
%ask user to import an image file from their computer
[y,Fs] = audioread('pick2.m4a');
sound(y,Fs);
w=uigetfile({'*.jpg';'*.jpeg';'*.png';'*.bmp'});
%makes sure importing an image is required
while w==0
    [y,Fs] = audioread('pick2.m4a');
sound(y,Fs);
    w=uigetfile({'*.jpg';'*.png';'*.bmp'});
end
Hidden = imread(w);
%converts to binary
Bin = imbinarize(rgb2gray(Hidden));

%% Makes the hidden message and oroginal image the same size
Bin = imresize(Bin,size(First(:,:,1)));

%% Select a bit plane and change it to our message signal
NewImg = First;
NewImg(:,:,1) = bitset(NewImg(:,:,1),1,Bin);

%% Save the Image file
%show how the image is sent to receiver
[y,Fs] = audioread('showpic.m4a');
sound(y,Fs);
figure,imshow(NewImg);title('Image with hidden message')
pause(3)
%save image
 imwrite(NewImg,'NewImg.bmp');
 %% Password Creation
 % ask for password
 [y,Fs] = audioread('createpass.m4a');
sound(y,Fs);

 password=inputdlg('Create a password');
%ensures password is not empty
while isempty(password)
    [y,Fs] = audioread('createpass.m4a');
sound(y,Fs);

 password=inputdlg('Create a password');
end
password=str2double(password{1});
%%Providing number of attempts
%[y,Fs] = audioread('attempts.m4a');
%sound(y,Fs);

%Tries=inputdlg('How many attempts does the receiver have');
%Tries=str2double(Tries{1});
% error checking
%while Tries==''|isnan(Tries)| ~isreal(Tries)| isinf(Tries)|Tries<1|isempty(Tries)
 %   [y,Fs] = audioread('attempts.m4a');
%sound(y,Fs);

 %       Tries=inputdlg('How many attempts does the receiver have');
%Tries=str2double(Tries{1});
%end
 close all ;