%% Welcome Message and Start Button
  % code to play welcome sound located in our file
[y,Fs] = audioread('welcome2.m4a');
sound(y,Fs);
%pause(5)
%[y,Fs] = audioread('songg.mp3');
%sound(y,Fs);
% Name of Program
disp('Image Decryption Tool')
%BUTTON DISPLAYS WELCOME MESSAGE
 button = questdlg('Welcome to the Image Decryption Tool','Welcome','Start','Start');
% if statement ensures an image has been received to be decrypted
 if exist('NewImg','var')
     % reveals undecrypted image that has been received
figure,imshow(NewImg);title('Image with hidden message')
[y,Fs] = audioread('received.m4a');
sound(y,Fs);
pause(3)
Tries=3;
%%asks for the password
[y,Fs] = audioread('input.m4a');
sound(y,Fs);
 Password=inputdlg('Input password');
%ensures password is not empty
while isempty(Password)
    [y,Fs] = audioread('input.m4a');
sound(y,Fs);

 Password=inputdlg('Input password');
end
Password=str2double(Password{1});
%% Response for incorrect password attempts
while Password~=password
    %reduces attempts after an incorrrect try
    Tries=Tries-1;
    % deletes all data and terminates if password is failed 3 times
    if Tries==0
       [y,Fs] = audioread('bye.m4a');
sound(y,Fs);
close all;
clear;
clc;
       return
    elseif Tries==2
        %informs user number of attempts remaining
       [y,Fs] = audioread('two.m4a');
sound(y,Fs);
    elseif Tries==1
        %informs user number of attempts remaining
       [y,Fs] = audioread('one.m4a');
sound(y,Fs);
    end
   Password=inputdlg('What is the password?');
   Password=str2double(Password{1});
end


 %% Import the hidden image
Hid = imread('NewImg.bmp');

%% Extract the bitplane of the Messsage Signal

HiddenImage = bitget(Hid(:,:,1),1);

%% Reveal hidden image
imshow(logical(HiddenImage));
[y,Fs] = audioread('correct.m4a');
sound(y,Fs);

 else
    %ends script if no image is available to be decrypted
[y,Fs] = audioread('none.m4a');
sound(y,Fs);
end