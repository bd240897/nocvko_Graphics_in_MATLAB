% ускорение вывода графики

close all, clear all

%% drawnow

h = animatedline;
axis([0 4*pi -1 1])
x = linspace(0,4*pi,2000);

for k = 1:length(x)
    y = sin(x(k));
    addpoints(h,x(k),y);
    % обновляются только те точки котоыре изменяются
    drawnow
end

%% drawnow limitrate

h = animatedline;
axis([0 4*pi -1 1])
x = linspace(0,4*pi,10000);

for k = 1:length(x)
    y = sin(x(k));
    addpoints(h,x(k),y);
    % ограничить кол-во точек для обновляения - они идут батчами по х -
    % точек
    drawnow limitrate
end
drawnow

%% сначала сгенерили данные а потом выводим 

h = animatedline;
axis([0 4*pi -1 1])
x = linspace(0,4*pi,10000);
y = sin(x);

for k = 1:length(x)
    addpoints(h,x(k),y(k));
    drawnow limitrate
end
drawnow