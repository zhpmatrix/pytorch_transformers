#model_path=/data/zhanghaipeng/base_bert_model/bert-base-chinese
#model_path=/data/share/zhanghaipeng/data/pt_bert_models/bert-base-chinese
model_path=/nfs/users/zhanghaipeng/data/pt_bert_models/roberta-base
#data_dir=/data/zhanghaipeng/ner_data/
data_dir=/nfs/users/zhanghaipeng/general_ner/data
expr=7
cuda=0
ckpt=$1
CUDA_VISIBLE_DEVICES=$cuda python run_ner.py \
	--data_dir $data_dir/chinese/cluener_ontonotes/ \
	--model_type bert \
	--labels $data_dir/labels/aigen_labels.txt \
	--model_name_or_path $model_path \
	--output_dir $data_dir/models/$expr/checkpoint-$ckpt \
	--per_gpu_eval_batch_size 64 \
	--max_seq_length  60 \
	--seed 100 \
	--do_eval \
	--overwrite_output_dir \
	--logging_steps 100 \
	--save_steps 200 \
