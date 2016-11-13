%%initialization
clear all;

symbols = {' ','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'};
p = [4.000 7.167 1.492 2.782 4.253 10.702 2.228 2.016 6.094 6.966 0.153 0.772 4.025 2.406 6.749 7.507 1.929 0.095 5.987 6.327 8.056 2.758 0.978 2.360 0.150 1.974 0.074];
p=p./100;

dict = huffmandict(symbols,p);

%read txt
prompt = 'enter text ';
str = input(prompt,'s');
bin = huffmanenco(str,dict);
bin = dec2bin(bin);
bin = bin';
t=size(bin,2);
i=0;

while(t>300)
    img(:,:,:,i+1)=frame(bin(i*300+1:(i+1)*300));
    i=i+1;
    t=t-300;
    imshow(img(:,:,:,i));
    prompt = 'nex frame';
	st = input(prompt,'s');

end
    img(:,:,:,i+1)=frame(bin(i*300+1:end));
   
    img=img.*255;
    
    img=uint8(img);
    
    