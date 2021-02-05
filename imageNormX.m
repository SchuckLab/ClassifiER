function normimg = imageNormX(image)
image = double(image); %// Cast to double
minvalue = min(image(:)); %// Note the change here
maxvalue = max(image(:)); %// Got rid of superfluous nested min/max calls
normimg = uint8((image-minvalue)*255/(maxvalue-minvalue)); %// Cast back to uint8

