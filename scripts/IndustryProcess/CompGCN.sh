DATA_DIR=dataset

MODEL_NAME=CompGCN
DATASET_NAME=DualSecurity
DATA_PATH=$DATA_DIR/$DATASET_NAME
LITMODEL_NAME=CompGCNLitModel
TRAIN_SAMPLER_CLASS=CompGCNSampler
TEST_SAMPLER_CLASS=CompGCNTestSampler
MAX_EPOCHS=2000
EMB_DIM=200
LOSS_NAME=Cross_Entropy_Loss
TRAIN_BS=64
EVAL_BS=16
NUM_NEG=1
LR=0.0001
CHECK_PER_EPOCH=5
DECODER_MODEL=ConvE
OPN=mult
NUM_WORKERS=2
# GPU=1

# CUDA_VISIBLE_DEVICES=$GPU python -W ignore -u main.py  \
nohup python -W ignore -u main.py \
    --model_name $MODEL_NAME \
    --dataset_name $DATASET_NAME \
    --data_path $DATA_PATH \
    --litmodel_name $LITMODEL_NAME \
    --train_sampler_class $TRAIN_SAMPLER_CLASS \
    --test_sampler_class $TEST_SAMPLER_CLASS \
    --max_epochs $MAX_EPOCHS \
    --emb_dim $EMB_DIM \
    --loss_name $LOSS_NAME \
    --train_bs $TRAIN_BS \
    --eval_bs $EVAL_BS \
    --num_neg $NUM_NEG \
    --lr $LR \
    --check_per_epoch $CHECK_PER_EPOCH \
    --decoder_model $DECODER_MODEL \
    --opn $OPN \
    --num_workers $NUM_WORKERS \
    --save_config \
>./logs/${MODEL_NAME}_${DATASET_NAME}.log 2>&1 &


