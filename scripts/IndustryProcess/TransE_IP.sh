DATA_DIR=dataset

MODEL_NAME=TransE
DATASET_NAME=WN18RR
 DATASET_NAME=DualSecurity
DATA_PATH=$DATA_DIR/$DATASET_NAME
LITMODEL_NAME=KGELitModel
MAX_EPOCHS=50
EMB_DIM=512
LOSS=Adv_Loss
ADV_TEMP=1.0
TRAIN_BS=64
EVAL_BS=16
NUM_NEG=1
MARGIN=6.0
LR=1e-5
CHECK_PER_EPOCH=1
NUM_WORKERS=2
# GPU=1


nohup python -u main.py \
    --model_name $MODEL_NAME \
    --dataset_name $DATASET_NAME \
    --data_path $DATA_PATH \
    --litmodel_name $LITMODEL_NAME \
    --max_epochs $MAX_EPOCHS \
    --emb_dim $EMB_DIM \
    --loss $LOSS \
    --adv_temp $ADV_TEMP \
    --train_bs $TRAIN_BS \
    --eval_bs $EVAL_BS \
    --num_neg $NUM_NEG \
    --margin $MARGIN \
    --lr $LR \
    --check_per_epoch $CHECK_PER_EPOCH \
    --num_workers $NUM_WORKERS \
    --save_config \
> ./logs/${MODEL_NAME}_${DATASET_NAME}2.log 2>&1 &







