#cocosetup
cd ../
mkdir downloadedData
cd downloadedData
wget http://images.cocodataset.org/zips/train2017.zip
wget http://images.cocodataset.org/zips/val2017.zip
wget http://calvin.inf.ed.ac.uk/wp-content/uploads/data/cocostuffdataset/stuffthingmaps_trainval2017.zip
wget http://images.cocodataset.org/annotations/annotations_trainval2017.zip
unzip -q train2017.zip; unzip -q val2017.zip
mkdir ../SPADE/datasets/fullcoco_stuff
unzip stuffthingmaps_trainval2017.zip -d ../SPADE/datasets/fullcoco_stuff
cd ../SPADE/datasets/fullcoco_stuff
mkdir train_inst && val_inst
mkdir train_img && val_img
mv train2017 train_label
mv val2017 val_label
cp -a train_label/. train_inst/
cp -a val_label/. val_inst/
cd ../../downloadedData
mv train2017 train_img
mv val2017 val_img
mv val_img/ ../SPADE/datasets/fullcoco_stuff/
mv train_img/ ../SPADE/datasets/fullcoco_stuff/

#ADEsetup
cd ../downloadedData
wget http://data.csail.mit.edu/places/ADEchallenge/ADEChallengeData2016.zip
unzip -q ADEChallengeData2016.zip
mkdir ../SPADE/datasets/ADE; mkdir ../SPADE/datasets/ADE/sametrainlabel
mv -v ADEChallengeData2016/images/validation/* ../SPADE/datasets/ADE/sametrainlabel/
mv -v ADEChallengeData2016/annotations/validation/* ../SPADE/datasets/ADE/sametrainlabel/


#testing 
#python test.py --name coco_pretrained --dataset_mode coco --dataroot ../SPADE/datasets/fullcoco_stuff/
#python test.py --name coco_pretrained --dataset_mode coco --dataroot /content/SPADE/datasets/fullcoco_stuff/
#CUDA_VISIBLE_DEVICES=3 python test.py --name ade20k_pretrained --dataset_mode ade20k --dataroot ../SPADE/datasets/ADE/sametrainlabel 

#traing 
#python train.py --dataset_mode coco --dataroot ../SPADE/datasets/fullcoco_stuff >> testLog/log1.txt
#python train.py --name cocofull --dataset_mode coco --dataroot ../SPADE/datasets/fullcoco_stuff --gpu_ids 2,4 --tf_log
#python train.py --name ADE --dataset_mode facades --dataroot ../SPADE/datasets/fullcoco_stuff --gpu_ids 2,4 --tf_log
