DATA_DIR=dataset

MODEL_NAME=XTransE
DATASET_NAME=DualSecurity
DATA_PATH=$DATA_DIR/$DATASET_NAME
LITMODEL_NAME=XTransELitModel
TRAIN_SAMPLER_CLASS=XTransESampler
LOSS_NAME=Adv_Loss
ADV_TEMP=0.5
MAX_EPOCHS=1000
EMB_DIM=500
TRAIN_BS=256
EVAL_BS=64
NUM_NEG=0
MARGIN=6.0
LEARNING_RATE=0.001
REGULARIZATION=0
CHECK_PER_EPOCH=5
NUM_WORKERS=4
GPU=0

nohup python -u main.py \
    --model_name $MODEL_NAME \
    --dataset_name $DATASET_NAME \
    --data_path $DATA_PATH \
    --litmodel_name $LITMODEL_NAME \
    --train_sampler_class $TRAIN_SAMPLER_CLASS \
    --loss_name $LOSS_NAME \
    --adv_temp $ADV_TEMP \
    --negative_adversarial_sampling \
    --max_epochs $MAX_EPOCHS \
    --emb_dim $EMB_DIM \
    --train_bs $TRAIN_BS \
    --eval_bs $EVAL_BS \
    --num_neg $NUM_NEG \
    --margin $MARGIN \
    --lr $LEARNING_RATE \
    --regularization $REGULARIZATION \
    --check_per_epoch $CHECK_PER_EPOCH \
    --num_workers $NUM_WORKERS \
    --save_config \
>./logs/${MODEL_NAME}_${DATASET_NAME}.log 2>&1 &
