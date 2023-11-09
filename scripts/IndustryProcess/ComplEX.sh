DATA_DIR=dataset

MODEL_NAME=ComplEx
DATASET_NAME=DualSecurity
DATA_PATH=$DATA_DIR/$DATASET_NAME
LITMODEL_NAME=KGELitModel
MAX_EPOCHS=1000
EMB_DIM=1000
LOSS=Adv_Loss
ADV_TEMP=1.0
TRAIN_BS=1000
EVAL_BS=128
NUM_NEG=100
MARGIN=200.0
LR=0.00033858206813454155
REGULARIZATION=5e-6
CHECK_PER_EPOCH=5
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
    --regularization $REGULARIZATION \
    --check_per_epoch $CHECK_PER_EPOCH \
    --num_workers $NUM_WORKERS \
    --save_config \
>./logs/${MODEL_NAME}_${DATASET_NAME}.log 2>&1 &