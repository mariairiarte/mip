% Medical Image Processing
% D2: Reading DICOM files
% Autores:
% María Iriarte 
% Frank Hernández
% Carmen Sánchez

fileName = '1060618_2015_1.MR.0048.0001.2015.07.10.10.44.57.875000.35174004.IMA';
matrix = dicomread(fileName);

% Poner como segundo argumento los corchetes vacíos, maximizar contraste
imshow(matrix,[]);
dicominfo(fileName); % Output the metadata of the DICOM file
dicomdisp(fileName); % View these metadata

%% Reading landmarks files

file = load('1060618 buena calidad 2015 Lndmk_handle_1.mat'); 
data = file.Trn_img_data;

N = length(data); % dicom files
for i = 1:N
    
    dicomFile = data(i); % read data
    figure(i), imshow(dicomread(dicomFile.name),[]); % show image
    
    strokes = dicomFile.strokes; 
    
    % Plot strokes on image
    
    figure(i)
    hold on    
    for j=1:length(strokes)
        plot(strokes(j).x, strokes(j).y);
    end
    hold off
    
end