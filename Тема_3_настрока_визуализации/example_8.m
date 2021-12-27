% поиск и пробразование графияеских объектов

close all, clear all

%% построение

h = figure()

subplot(2,2,1)
x = linspace(0,10);
y1 = sin(x);
plot(x,y1)
title('Subplot 1: sin(x)')

subplot(2,2,2)
y2 = sin(2*x);
plot(x,y2)
title('Subplot 2: sin(2x)')

subplot(2,2,3)
y3 = sin(4*x);
plot(x,y3)
title('Subplot 3: sin(4x)')

subplot(2,2,4)
y4 = sin(8*x);
plot(x,y4)
title('Subplot 4: sin(8x)')

%% поиск 
hh = findobj('Type','line');
% изменили цвет осей графика 2
set(hh(2), 'Color', 'r')





