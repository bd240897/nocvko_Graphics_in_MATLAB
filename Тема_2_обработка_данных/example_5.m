% обрабокта дыннх по частям, групировка данных

close all, clear all

%% расшарили папки
addpath('TRAIN_RAD_H_ANNO\')
List = dir('TRAIN_RAD_H_ANNO\');

%% изменение название столбцов
Data = [];
for i = 3 : size(List, 1)  
    i
    filename = [List(i).folder, '\' , List(i).name];
    BMS1000 = importfile(filename, [1, Inf]); % вернет тип данных - таблица
    Data = [Data; BMS1000];
end

% изменили названия столбцов в выходной таблице
Data.Properties.VariableNames = {'ID' 'Coord1' 'Coord12' 'Type'};

%% ОБРАБОТКА СЧИТАННОЙ ТАБЛИЦЫ
% Здесь происходит расчет количества совпадений 

tic

% считаем сколько машин и пешезодов в тиблице
j = 0;
k = 0;
CAR_param = [];
Pedes_param = [];

for i = 1 : size(Data,1)
   i
   if Data.Type(i) == 'car'
      % сохраняем координаты машины в список - массив 2 на х
      CAR_param = [ CAR_param ; [Data.Coord1(i), Data.Coord12(i)] ];  
      % счетчик
      j = j + 1; 
   elseif Data.Type(i) == 'pedestrian'
      % сохраняем координаты пешехода в список - массив 2 на х 
      Pedes_param = [ Pedes_param ; [Data.Coord1(i), Data.Coord12(i)] ]; 
      % счетчик
      k = k + 1; 
   end
end

toc
% дальности до автомобиля - по найденым координатам
D_to_car = (CAR_param(:,1).^2 + CAR_param(:,1).^2).^0.5;

%% Попробуем сделать модельный пример, в котором введем случайность и изменим категории на те, которые не характерны представленным данным

% случайные индексы размером 100 на 1 в диапозоне от 1 до х
index = randi([1 size(Data,1)],[100,1]); 
% копия таблцы
Data_100 = Data;
% меняем катеогрию по этим индексам 
Data_100.Type(index) = 'border';
% узнали количество уникальных объектов - категории - теперь тут 4 штуки 
id_class = unique(Data_100.Type);


