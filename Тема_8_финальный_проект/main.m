% Тема 8 - финальный проект
% Описание:
% Приложееме которое строит на одном графике - видео изображения,
% точки троектории и данные с радара. А затем записывает это в гифку.

%%

% скачать npy reader для matlab https://github.com/kwikteam/npy-matlab
% скачать датасет отсюда: https://www.cruwdataset.org/download
% averin-artem2007@yandex.ru

%% 1.ИНИФИАЛИЗАЦИЯ
close all, clear all, clc

%% 2.БАЗОВЫЕ НАСТРОЙКИ
% Добавляю требуетмые папки в идимость основному скрипту
addpath('./npy-matlab/')
addpath(genpath('./2019_05_29_MLMS006'))
addpath('./TRAIN_RAD_H_ANNO/')


filename_gif = 'test.gif'; % название гифок

%  папка с файлами для радара - команда дир - считывает всю папки и сует ее
%  в список (возвращает список файлов)
list_radar_data = dir('./2019_05_29_MLMS006/RADAR_RA_H/');

%  папка с файлами для видео
list_video_frames = dir('./2019_05_29_MLMS006/IMAGES_0/');

% папка с троеткориями
path_to_anno = './TRAIN_RAD_H_ANNO/2019_05_29_MLMS006.txt';

% функция из инета для парсинга *.npy файлов
parsing_data % парсим данные из аннотации

% findgroups - делит столбец на группы 1.2.3..., unique - берез из них
% уникальные
ID_vect = unique(findgroups(MLMS006.ID)) - 1; % ищем количество кадров радара

% для гифки
FPS = 120; % установки частоты кадров камеры

%% 3.Контейнеры для хранения
% Координаты разнотипных объектов
% тут будем хранить троекторию объектов - для каждого объекта свой список
pos_coord1_cyclist = [];
pos_coord2_cyclist = [];
pos_coord1_car = [];
pos_coord2_car = [];
pos_coord1_pedestrian = [];
pos_coord2_pedestrian = [];

filename_gif = 'test.gif'; % имя гифки

%% ОСНОВНОЙ ЦИКЛ
% Непосредственно вычисления

% дискриптор фигуры
h = figure();

% устанавливаем имя и позицию с помощью команды set
set(h, 'Name', 'Data from camera and radar!')
set(h, 'Position', [0 0 1000 1000]);

% основной цикл 0 пробегаемся по всему видео - ИТЕРАЦИЯ ПО ФРЕЙМАМ
for i = 3 : size(list_video_frames, 1)
    
    % Отображение с камеры
    
    % создаем путь до файлов - это horcat == []
    frame_filename = [list_video_frames(i).folder, '\', list_video_frames(i).name];
    
    % читаем файл
    A = imread(frame_filename);
    
    % строим сабплот 3 на 1 и берем первый график
    subplot(311), imshow(A)
    
    % переводим список файлов радара - в структуру
    temp = {list_radar_data.name};
    
    % берем элементс начиная с 3-го (до этого там фигня)
    temp = temp(1,3:end);
    
    % измениил размер reshape так чтоб в столбце было 4 отсчета
    temp = reshape(temp, 4, []);
    
    % делаем вектор для сраза - возьмем в троектории только те отчеты
    % которые принадлежат нужному фрему
    % что сравнить categorical нужно чтоб они обы были такими(categorical)
    index = MLMS006.ID == categorical(ID_vect(i-2)); % формирование подтаблицы из аннотации
    
    % берем срез на каждом фрейме
    temp_table = MLMS006(index,:);
    
    % Отображение координат разными цветами
    for k = 1 : size(temp_table,1)
        if temp_table.Type(k) == categorical("cyclist")
            % заполнение глобального списка троектории
            pos_coord1_cyclist = [pos_coord1_cyclist, temp_table.Coord1(k)];
            pos_coord2_cyclist = [pos_coord2_cyclist, temp_table.Coord2(k)];
            % стрим полярный график троектории
            subplot(313), polar(pos_coord2_cyclist, pos_coord1_cyclist, 'or')%scatter(pos_coord1_cyclist, pos_coord2_cyclist, 'r')
            hold on
        elseif temp_table.Type(k) == categorical("car")
            % заполнение глобального списка троектории
            pos_coord1_car = [pos_coord1_car, temp_table.Coord1(k)];
            pos_coord2_car = [pos_coord2_car, temp_table.Coord2(k)];
            % стрим полярный график троектории
            subplot(313), polar(pos_coord2_car, pos_coord1_car, 'ob')%scatter(pos_coord1_car, pos_coord2_car, 'b')
            hold on
        else
            % заполнение глобального списка троектории
            pos_coord1_pedestrian = [pos_coord1_pedestrian, temp_table.Coord1(k)];
            pos_coord2_pedestrian = [pos_coord2_pedestrian, temp_table.Coord2(k)];
            % стрим полярный график троектории
            subplot(313), polar(pos_coord2_pedestrian, pos_coord1_pedestrian, 'og')% scatter(pos_coord1_pedestrian, pos_coord2_pedestrian, 'g')
            hold on
        end
    end
    
    % Построение радиолокационных данных - ЛОКАТОР
    for j = 1 : 4
        % обработки файлов типа npy
        data = readNPY([list_radar_data(1).folder, '\', temp{j, i-2}]);
        % строим трехмерный гарфик и берем под углом 90 (2д график от него)
        subplot(312), mesh(abs(data(:,:,1))), view(0, 90), colormap hsv
    end
    
    % пишем текст текущего фрейма на графике - используем sprintf для
    % форматирования строки и числа!!!!
    text(min(xlim),min(ylim)+200, sprintf('Frame of radar is %d', i), 'Horiz', 'left')
    
    % Создание гифки
    frame = getframe(h);
    [A,map] = rgb2ind(frame.cdata,256);
    if i-2 == 1
        imwrite(A,map,filename_gif,'gif','LoopCount',Inf,'DelayTime',1/FPS);
    else
        imwrite(A,map,filename_gif,'gif','WriteMode','append','DelayTime',1/FPS);
    end
    
    % добавляем новые настрйоки для фигуры через get в этот раз
    hh = get(h);
    hh.Children(3).Title.String = 'Video Data';
    hh.Children(2).Title.String = 'Coord Data';
    hh.Children(1).Title.String = 'Radar Data';
    pause(1/FPS)
   
end
% конец главного цикла

