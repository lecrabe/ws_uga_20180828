####################################################################################################
## Segmentation of the mosaic (bash)
## remi.dannunzio@fao.org
## 2018/08/21
####################################################################################################
####################################################################################################

cd ~/ws_uga_20180828/
home=`pwd`
workdir=$home"/data/mosaic_lsat"
segdir=$home"/data/segments/"

#################### PERFORM SEGMENTATION USING THE OTB-SEG ALGORITHM
p1=3   # radius of smoothing (pixels)
p2=16  # radius of proximity (pixels)
p3=0.1 # radiance threshold 
p4=50  # iterations of algorithm
p5=5   # segment minimum size (pixels)


for input in `ls $workdir/uga*.tif`;
  do echo $input;
  otbcli_MeanShiftSmoothing      -in $input         -fout tmp_smooth.tif   -foutpos tmp_pos.tif -spatialr $p1 -ranger $p2 -thres $p3 -maxiter $p4;
  otbcli_LSMSSegmentation        -in tmp_smooth.tif -inpos tmp_pos.tif     -out tmp_seg_lsm.tif -spatialr $p1 -ranger $p2 -minsize 0 -tmpdir $workdir -tilesizex 512 -tilesizey 512;
  otbcli_LSMSSmallRegionsMerging -in tmp_smooth.tif -inseg tmp_seg_lsm.tif -out $segdir/seg_${input##*/} -minsize $p5 -tilesizex 512 -tilesizey 512;
  rm tmp*.tif;
  done;


