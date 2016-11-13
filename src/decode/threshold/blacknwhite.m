BW=WhiteThreshold(pic);
s=regionprops(BW,'extrema');
s=struct2cell(s);
s=s';
c=cell2mat(s);
centers=[c(1:2,:); c(end-1:end,:)];