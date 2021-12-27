% сравненеи быстродействия различных методами отрисовки
% параметр renderer из opengl - zbuffer - painters

clc;
clear all;
close all;

%% заготовка

% specify the vertices of the beams
vert = [ 0, 0, 0;  % beam 1
         1, 0, 0;
         1, 6, 1;
         0, 6, 1;
         0, 0, 1;  % beam 2
         0, 1, 1;
         6, 1, 0;
         6, 0, 0;
         5, 0, 1;  % beam 3
         6, 0, 1;
         6, 6, 0;
         5, 6, 0;
         6, 5, 1;  % beam 4
         6, 6, 1;
         0, 6, 0;
         0, 5, 0 ];
% specify the faces of the beams by listing the vertices
surf1 = [ 1 2 3 4;
          5 6 7 8;
          9 10 11 12;
          13 14 15 16 ];
f = figure;
% удалить мерцаиения из анимации
set(f,'doublebuffer','on');
set(f,'menubar','none');
set(f,'name','Comparison of Painters, ZBuffer, and Open GL Rendering Modes');
set(f,'renderermode','man');
patch('Faces',surf1,...
          'Vertices',vert,...
          'FaceColor','red',...
          'EdgeColor','black');
axis equal;
xlabel('X');
ylabel('Y'); 
zlabel('Z');
view( 3 );
grid on;
set(f,'renderer','painters');
title('Painters Renderer');
for i=1:25
view(-45,45 - i );
pause( 0.1 );
end;
for i=1:25
view(-45,20 + i );
pause( 0.1 );
end;
pause( 2 );

%% разыне алгоритмы отрисвоки 
% растровая графика, много оперативы
set(f,'renderer','zbuffer');
title('Zbuffer Renderer');
pause( 2 );

% растрвая гарфика - самая продвинутая 
set(f,'renderer','opengl'); 
title('OpenGL Renderer'); 
pause( 2 );

% метод художника - самый быстрый 
% нет каустик - своященности и прозраночть
set(f,'renderer','painters'); 
title('Painters Renderer');