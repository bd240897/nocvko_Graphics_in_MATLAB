% файлы со стринговыми перменным

close all; clear all;

%%
filename = 'nums3.txt';
fid = fopen(filename, 'r');

if fid > 0
    disp ('OK')
else
    error('не можем открыть файл %s для чтения', filename(1:end-4));
end

%%
nData = fscanf(fid, '%d', 1);
Data = cell(nData, 1);
for i = 1 : nData  
   nLines = fscanf(fid, '%d', 1);
   % деление стркои по делиметру спомощью strsplit
   tmp = strsplit(fscanf(fid, '%s', nLines), '''')';
   % применяем свою фунецию к кадлой ячейки для обрезания кавычек cellfun
   % а затем переводим массив ячеек в простой массив(матрицу)
   Data{i} = cell2mat(cellfun(@(c) str2num(c), tmp(2:end-1), 'UniformOutput',false) ); 
end

fclose (fid);