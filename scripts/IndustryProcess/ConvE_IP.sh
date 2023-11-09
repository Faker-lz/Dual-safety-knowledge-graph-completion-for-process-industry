DATA_DIR=dataset

MODEL_NAME=ConvE
DATASET_NAME=DualSecurity
DATA_PATH=$DATA_DIR/$DATASET_NAME
LOSS=Cross_Entropy_Loss
TRAIN_BS=512
EVAL_BS=16
DIM=288
LEARNING_RATE=0.001
MAX_EPOCHES=3000
REGULARIZATION=0
NUM_WORKERS=2
CHECK_PER_EPOCH=5
LITMODEL_NAME=ConvELitModel
TRAIN_SAMPLER_CLASS=ConvSampler
GPU=0

nohup python -u main.py \
    --model_name $MODEL_NAME \
    --loss $LOSS \
    --dataset_name $DATASET_NAME \
    --data_path $DATA_PATH \
    --max_epochs $MAX_EPOCHES \
    --litmodel_name $LITMODEL_NAME \
    --emb_dim $DIM \
    --train_bs $TRAIN_BS \
    --eval_bs $EVAL_BS \
    --lr $LEARNING_RATE \
    --num_workers $NUM_WORKERS \
    --check_per_epoch $CHECK_PER_EPOCH \
    --regularization $REGULARIZATION \
    --litmodel_name $LITMODEL_NAME \
    --train_sampler_class $TRAIN_SAMPLER_CLASS \
    --save_config \
> ./logs/${MODEL_NAME}_${DATASET_NAME}.log 2>&1 &





