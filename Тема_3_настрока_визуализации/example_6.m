% настрока физуализации

%%
close all

%% построение графика 

hf = figure(); % дискрипотрная графика - опистаельныя
ha = axes('Color', [1 1 1]); % настраиваем оси
% внутри графических осей рисуется график

x = linspace (0, 1, 100);
y = x.^2;
plot(x,y)
hold off
plot(x, x.^3)

% проверка вкл ли hold on 
temp = ishold(ha);

% утсновка параметров графика
set(hf, 'Color', [1 0 0], 'Name', 'Example_6', 'Position', [0 0 1920 1080])

%%
% написание текста на графике - позиция, надпись
ht = text(0.2, 0.2, 'Text Example');
% устанвока настроек текста
set(ht, 'FontSize', 40, 'Rotation', 45)
% пауза
pause(3)
% меняем текст
set(ht, 'String', 'Text Example 2')
