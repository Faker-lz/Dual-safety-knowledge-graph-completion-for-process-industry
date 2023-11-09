DATA_DIR=dataset

MODEL_NAME=HAKE
DATASET_NAME=DualSecurity
DATA_PATH=$DATA_DIR/$DATASET_NAME
LITMODEL_NAME=KGELitModel
MAX_EPOCHS=1000
EMB_DIM=500
LOSS=Adv_Loss
ADV_TEMP=0.5
TRAIN_BS=256
EVAL_BS=8
NUM_NEG=100
MARGIN=6.0
LR=5e-5
CHECK_PER_EPOCH=5
PHASE_WEIGHT=0.5
MODULUS_WEIGHT=0.5
NUM_WORKERS=2
# GPU=1


# CUDA_VISIBLE_DEVICES=$GPU python -u main.py \
nohup python -u main.py\
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
    --phase_weight $PHASE_WEIGHT \
    --modulus_weight $MODULUS_WEIGHT \
    --num_workers $NUM_WORKERS \
    --save_config \
>./logs/${MODEL_NAME}_${DATASET_NAME}.log 2>&1 &