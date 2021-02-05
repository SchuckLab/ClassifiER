clear global
global sheetStackNum tubuleStackNum sheet_D sheet_S sheet_D_agg ...
    sheet_S_agg sheetMask sheetImg tubule_D tubule_S tubule_D_agg ...
    tubule_S_agg tubuleMask tubuleImg sheetBGT tubuleBGT sheetBGS tubuleBGS PathName ...
    trim_factor trimMask trimMaskR numCells segAdj segImg
sheetStackNum = 1;
tubuleStackNum = 1;
sheet_D = 2;
sheet_S = 20;
sheet_D_agg = 1;
sheet_S_agg = 1;
sheetMask = [];
sheetImg = [];
tubule_D = 2;
tubule_S = 20;
tubule_D_agg = 1;
tubule_S_agg = 1;
tubuleMask = [];
tubuleImg = [];
sheetBGT = 1;
sheetBGS = 2;
tubuleBGT = 1;
tubuleBGS = 2;
PathName = [];
trim_factor = 12;
trimMask = [];
trimMaskR = [];
numCells = 0;
segAdj = 0;
segImg = [];
waitfor(SheetTubules5());
