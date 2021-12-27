%% визуализация разлинчных объектов на графике

clear all, clc, close all

%%
% парсим данные из радарного датасета
parsing_data % матлаб сгенерил эту фнукцию

% для осей графика
min_x = min(MLMS006.Coord1);
max_x = max(MLMS006.Coord1);
min_y = min(MLMS006.Coord2);
max_y = max(MLMS006.Coord2);

%% основной цилк

i = 1;
key = 0; % отображать ли график
while i <= size(MLMS006, 1)
    
    % считываем данные от одного фрейма
    % если первый элементв даты
    if i == 1 %
        Data =[];
        Target ={};
        Data = [Data;  MLMS006.Id(i), MLMS006.Coord1(i), MLMS006.Coord2(i)];
        Target = [Target, {MLMS006.Type(i)}];
    % если слудющий свопадает с предыдущим    
    elseif MLMS006.Id(i) == MLMS006.Id(i-1)
        Data = [Data; MLMS006.Id(i), MLMS006.Coord1(i), MLMS006.Coord2(i)];
        Target = [Target, {MLMS006.Type(i)}];
    % если слудющий НЕ свопадает с предыдущим - тогда строим график       
    elseif MLMS006.Id(i) ~= MLMS006.Id(i-1)
        
        % построение графика
        key = 1;
        if key
            f = figure;
            for j = 1 : size(Data,1)
                if Target{1,j} == categorical("car")
                    RGB = [1 0 0];
                elseif Target{1,j} == categorical("pedestrian")
                    RGB = [0 1 0];
                else
                    RGB = [0 0 1];
                end
                scatter(Data(j,2), Data(j,3), 'MarkerEdgeColor', RGB);
                text(Data(j,2)+0.5, Data(j,3)+0.5, Target{1,j})
                xlim([min_x-10 max_x+10])
                ylim([min_y-10 max_y+10])
                pause(0.2)
                hold on
            end
        end
        
        % обнуляем
        Data = [];
        Target = {};
        
        close(f)
        pause(0.2)
        
        % начинчается новый фрейм
        Data = [Data; MLMS006.Id(i), MLMS006.Coord1(i), MLMS006.Coord2(i)];
        Target = [Target, {MLMS006.Type(i)}];
        key =0;
    end
    
    i = i + 100;
end
