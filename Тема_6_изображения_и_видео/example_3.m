% запись видео

clear all, close all

%% запись видео

% видео ридера - видео контейнер
vidObj = VideoReader('video_2020-12-16 13-18-12.avi');

% диапозон считывания (весь файл большой(
frame_start = 1;
frame_stop = 373;

% cоздаем папку 
name_folder = 'new_video';
result = isfolder(name_folder);
if ~result
    mkdir(name_folder)
end

% дискриптор записи видео - видео контейнер
v = VideoWriter('new_video.avi');
open(v);

filename_gif = 'testAnimated.gif';

while frame_start< frame_stop
    % считаели 1 фрем
    frame = read(vidObj, frame_start);
    % изменили размер фремы - 3 размерность можно не указывать
    frame = imresize(frame, [200, 400]);
    % путь для картина - геенрация имени
    filename = ['./new_video/',  num2str(frame_start), '.jpg'];
    % запись картннки
    imwrite(frame, filename)
    
    % запись видео 
    writeVideo(v,frame);
    
    % запись гифки
    
    % переформатировать к const карте цветности - фиксирвоанная длина карты
    % цветности
    [A, map] = rgb2ind(frame,256);
    
    if frame_start == 1
        % записываем - тут vidObj.FrameRate - ФПС
        imwrite(A,map,filename_gif,'gif','LoopCount',Inf,'DelayTime',1/vidObj.FrameRate);
    else
        imwrite(A,map,filename_gif,'gif','WriteMode','append','DelayTime',1/vidObj.FrameRate);
    end

    frame_start = frame_start + 1;
end

close(v)


