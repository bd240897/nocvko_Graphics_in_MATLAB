
% случ вектора
x=rand(1000,1); 
y=rand(1000,1);

%% отрисовка без настроект

% строим картинку 1000 раз и замеряем время
tic 
for idx=1:100 
    cla; 
    h=scatter(x,y); 
end
toc

%% отрисовка с настройками

props = {'LineStyle','none','Marker','o','MarkerEdge','b','MarkerSize',6};

tic
for idx=1:100 
    cla; 
    h=line([x,x],[y,y],props{:}); 
end 
toc