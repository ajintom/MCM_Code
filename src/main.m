%%initialization
no(1)  = 10; %width
no(2)  = 10; %length
colors = 8;
hash   = [0 1 2 3 4 5 6 7];
decoded= zeros(no(1),no(2));
%%
%cam=webcam;
%pic = snapshot(cam);
pic         =   lightAdjust(pic);
centers     =   DetectCircle(pic);
pic         =   skew2sq(pic,centers);
pic = imcrop(pic,[119.5 119.5 371 371]);
s=struct('Centroid',[]);
s(colors).Centroid=[];
%%
%%thresholding


im(:,:,1)=YellowThreshold(pic);
im(:,:,1)=medfilt2(im(:,:,1),[5 5]);

im(:,:,2)=WhiteThreshold(pic);
im(:,:,2)=medfilt2(im(:,:,2),[5 5]);

im(:,:,3)=RedThreshold(pic);
im(:,:,3)=medfilt2(im(:,:,3),[5 5]);

im(:,:,4)=PurpleThreshold(pic);
im(:,:,4)=medfilt2(im(:,:,4),[5 5]);

im(:,:,5)=OrangeThreshold(pic);
im(:,:,5)=medfilt2(im(:,:,5),[5 5]);

im(:,:,6)=GreyThreshold(pic);
im(:,:,6)=medfilt2(im(:,:,6),[5 5]);

im(:,:,7)=GreenThreshold(pic);
im(:,:,7)=medfilt2(im(:,:,7),[5 5]);

im(:,:,8)=BlueThreshold(pic);
im(:,:,8)=medfilt2(im(:,:,8),[5 5]);

%%
%%Centroid and Decoding
for i= 1:colors
% subplot(2,2,i);
% imshow(im(:,:,i));
a=regionprops(im(:,:,i),'Centroid','AREA');
%s(i).Centroid(:,:)  =   [0 0];
k=1;
for j=1:size(a,1)
    if(a(j).Area > 500)    
        for l=1:2
            s(i).Centroid(k,l)=a(j).Centroid(l);
        end
    k=k+1;
    end
end
end

px(2)=size(pic,1);
px(1)=size(pic,2);

for i=1:colors
    for j=1:size(s(i).Centroid,1)
    s(i).Centroid(j,:) = s(i).Centroid(j,:) ./ px;
    s(i).Centroid(j,:) = s(i).Centroid(j,:) .*no;
    s(i).Centroid(j,:) = ceil(s(i).Centroid(j,:)) ;
    decoded(s(i).Centroid(j,2),s(i).Centroid(j,1))=hash(i);
    end
end

%% Convert to a string of char
deb=dec2bin(decoded');
deb=reshape(deb',[1 size(deb,1)*size(deb,2)]);

