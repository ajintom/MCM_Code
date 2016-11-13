function [ o_image ] = skew2sq(inp,ctrlpts)
    fixedpts=[100,100;100,500;500,100;500,500];
    tform = fitgeotrans(ctrlpts,fixedpts,'projective');
    o_image = imwarp(inp,tform,'OutputView',imref2d(size(inp)));
    
end
