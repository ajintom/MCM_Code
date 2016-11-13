function I =    frame(bin)

no     = 10;
colors = 8;
px     = 80;
blk_w  = 30;
%       Y         W       R       P         O       Gy      Gr      B
h    = [0.162     1       0       0.854     0.075   1       0.3     0.6];
s    = [0.8       0       0.8     0.8       0.8     0       0.8     0.8];
v    = [0.9       1       0.9     0.9       0.9     0.5     0.9     0.9];


img    = (zeros (px*no+blk_w,px*no+blk_w,3));

if(size(bin,2)<8);
    bin(:,9-size(bin,2):8)=bin(:,1:end);
    bin(:,1)='0';
end

b =  reshape(bin',[1 size(bin,1)*size(bin,2)]);

b = [b char(ones(1,no*no*3-size(b,2))*'0')];

while(not(mod(size(b,2),3) ==0) )
    b(end+1)='0';
end
k=1;
for i=1:10
    for j = 1:10
        ind = bin2dec(b((k-1)*3+1:k*3)) + 1;
        img((i-1)*px + blk_w +1:i*px , (j-1)*px + blk_w + 1 : j*px , :)= make_sq(h(ind),s(ind),v(ind),px-blk_w);
        k=k+1;
    end
end

I = hsv2rgb(img);

I = padarray(I,[40 40]);
I = insertShape(I, 'filledcircle', [25 25 20;865 25 20;25 865 20;865 865 20],'color','white','opacity',1);
  
end

