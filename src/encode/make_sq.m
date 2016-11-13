function [ img ] = make_sq( h,s,v,edge)
%MAKE_SQ makes a square of edge x edge pixels
%   returns the square
img (1:edge,1:edge,1)= h;
img (1:edge,1:edge,2)= s;
img (1:edge,1:edge,3)= v;
end

