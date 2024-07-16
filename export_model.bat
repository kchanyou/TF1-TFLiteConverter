@echo off
setlocal

set INPUT_TYPE=image_tensor
set PIPELINE_CONFIG_PATH=C:/tensorflow1/models/research/object_detection/images/ssd_mobilenet_v1_quantized_300x300_coco14_sync_2018_07_18/pipeline.config
set TRAINED_CKPT_PREFIX=C:/tensorflow1/models/research/object_detection/model_output/model.ckpt-%1
set EXPORT_DIR=C:/tensorflow1/models/research/object_detection/saved_model

echo.
echo ==== SavedModel 생성 시작 ====
python object_detection/export_inference_graph.py ^
    --input_type=%INPUT_TYPE% ^
    --pipeline_config_path=%PIPELINE_CONFIG_PATH% ^
    --trained_checkpoint_prefix=%TRAINED_CKPT_PREFIX% ^
    --output_directory=%EXPORT_DIR%
echo ==== SavedModel 생성 완료 ====
echo.

set CONFIG_FILE=C:\tensorflow1\models\research\object_detection\saved_model\pipeline.config
set CHECKPOINT_PATH=C:\tensorflow1\models\research\object_detection\saved_model\model.ckpt
set OUTPUT_DIR=C:\tensorflow1\models\research\object_detection\saved_model

echo.
echo ==== TFLite 모델 생성 시작 ====
python object_detection/export_tflite_ssd_graph.py ^
    --pipeline_config_path=%CONFIG_FILE% ^
    --trained_checkpoint_prefix=%CHECKPOINT_PATH% ^
    --output_directory=%OUTPUT_DIR%
echo ==== TFLite 모델 생성 완료 ====
echo.

endlocal