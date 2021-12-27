% красная полоска с шумом

close all, clear all 

%% Вручную создание файла

% пустая матрицы - 1й слой
A = zeros(500, 500);

% создание слоев (3 слоя) + шумы
A(:, 200:250) =  200*ones(500, 51);
A = A + + 55*rand(500, 500);
B = zeros(500, 500) + 100*rand(500, 500);
C = zeros(500, 500) + 100*rand(500, 500);

% склеим и изменим формат 
D = uint8(cat(3, A,B,C));

% выведем
h = imshow(D)

%% изменение размера ???

% вывод с поомщью image
figure, h = image(D, 'CDataMapping', 'scaled')

% ??
figure, hh = imagesc(D)
