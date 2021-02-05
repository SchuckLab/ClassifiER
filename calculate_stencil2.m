function stencil = calculate_stencil2(Img, detail, D_aggression, solidity, S_aggression, tubuleBG, sheetBG)

TBG = graythresh(imageNormX(Img))*(max(Img(:)))*tubuleBG;
SBG = graythresh(imageNormX(Img))*(max(Img(:)))*sheetBG;


Img = double(medfilt2(Img, [3 3]));
Dimg_expanded = padarray(Img, [detail+1 detail+1], 'symmetric');


%create detail convolution kernal
d1 = fspecial('disk', detail);
d1 = d1>0;
d1 = padarray(d1,[1 1]);
d2 = imdilate(d1, strel('disk', 1));
detail_convolution = d2 - d1;
detail_convolution = detail_convolution/sum(sum(detail_convolution));

%create solidty convolution kernal
s1 = fspecial('disk', solidity);
s1 = s1>0;
s1 = padarray(s1,[1 1]);
s2 = imdilate(s1, strel('disk', 1));
solidity_convolution = s2 - s1;
solidity_convolution = solidity_convolution/sum(sum(solidity_convolution));

%detail bright mask 
C = conv2(Dimg_expanded,detail_convolution, 'valid');
detail_mask = and(Img-(C*D_aggression)>0,Img>TBG);
detail_mask = bwareaopen(detail_mask,20);

nanImg = Img;
nanImg(detail_mask==1) = NaN;
%solidity bright mask 
C = nanconv(nanImg,solidity_convolution, 'same');
solidity_mask = and(Img-(C*S_aggression)>0,Img>SBG);
solidity_mask = bwareaopen(solidity_mask,20);

%combine masks
stencil = or(detail_mask, solidity_mask);




