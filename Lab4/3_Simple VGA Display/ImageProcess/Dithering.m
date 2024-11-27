DIR = "E:\EIE330_FPGA\Lab4\3_Simple VGA Display\ImageProcess";
%Read image
raw = imread('Input.jpg');
I = imresize(raw,[480,640],'bilinear');

[Img1,map2] = rgb2ind(I,4,'dither');
imshow(Img1,map2)

Color = fopen("COLOR.txt","w");
for r = 1:size(map2,1)
    Hex = rgb2hex(map2(r,:));
    Hex = sprintf('%05s', Hex);
    fprintf(Color,'parameter COLOR%d = 16''h%s;\n',r,Hex(2:6));
end
h = size(Img1,1);
w  = size(Img1,2);
fid = fopen( 'image.mif', 'w+' );
fprintf( fid, 'WIDTH=2;\n');
fprintf( fid, 'DEPTH=%d;\n', h*w);
fprintf( fid, 'ADDRESS_RADIX=UNS;\n');
fprintf( fid, 'DATA_RADIX=HEX;\n');
fprintf(fid,'%s %s\n','CONTENT','BEGIN');
for i = 1:size(Img1,1)*size(Img1,2)
    fprintf(fid,'\t%d\t:%x\t;\n',i-1,Img1(i));
end
fprintf(fid,'END;');
fclose( fid );
