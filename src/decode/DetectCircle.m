function [ cen_cir ] = DetectCircle(RGB)

bw  = WhiteThreshold(RGB);

bw  = medfilt2(bw,[7 7]);

[B,L] = bwboundaries(bw,'noholes');

stats = regionprops(L,'Area','Centroid');

threshold = 0.9;
met= zeros(length(B),1);
z=1;
% loop over the boundaries
for k = 1:length(B)

  % obtain (X,Y) boundary coordinates corresponding to label 'k'
  boundary = B{k};

  % compute a simple estimate of the object's perimeter
  delta_sq = diff(boundary).^2;
  perimeter = sum(sqrt(sum(delta_sq,2)));

  % obtain the area calculation corresponding to label 'k'
  area = stats(k).Area;
  if(area > 100)
  % compute the roundness metric
  met(k) = 4*pi*area/perimeter^2;
  end
end
t   = find(met>0.92);

for i= 1:size(t,1)
cen_cir(i,1)=stats(t(i)).Centroid(1);
cen_cir(i,2)=stats(t(i)).Centroid(2);
end

if(cen_cir(1,2)>cen_cir(2,2))
    z=cen_cir(1,2);
    cen_cir(1,2)=cen_cir(2,2);
    cen_cir(2,2)=z;
end

if(cen_cir(3,2)>cen_cir(4,2))
    z=cen_cir(3,2);
    cen_cir(3,2)=cen_cir(4,2);
    cen_cir(4,2)=z;
end
end







