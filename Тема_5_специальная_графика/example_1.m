% анализ различных ДН антенн - txt файлы

%%
close all, clear all

% ищем все файлы txt
list_txt_files = dir('.\26ouj8j75ss112mc96y3hi0bnd\26ouj8j75ss112mc96y3hi0bnd\Conformal-Array-Antenna-Patterns\StackedPatch\*.txt');

%%
% импорт даты
parsing_data

% углы из градусов в радианы
theta = deg2rad(farfieldf31.Thetad);

% для графика
MAX = max(farfieldf31.AbsTheta);
MIN = min(farfieldf31.AbsTheta);


T = 181; % период 
p = size(farfieldf31, 1)/ T; % число прериодов

%% первый способ отрисовки
for i = 1 : p
    
    % оси
    f = polaraxes;
    % график
    polarplot(theta( 1+ T*(i-1): T*i), farfieldf31.AbsTheta(1+ T*(i-1): T*i));
    rlim([MIN MAX])
    hold off
    
    % настрока угла гарфика - покахет 1/4 графика
    f.ThetaLim = [0, 90];

    pause(0.3)
end

%% второй способ отрисовки
for i = 1 : p
    
    % переход из поляных в декарты
    [U,V] = pol2cart(theta( 1+ T*(i-1): T*i), farfieldf31.AbsTheta(1+ T*(i-1): T*i))
    
    compass(U,V)
    pause(0.3)
end