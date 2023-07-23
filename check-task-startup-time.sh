CLUSTER=test
TASKDEF=$1
REGION=ap-northeast-1
TASKS=$(aws ecs list-tasks \
    --cluster $CLUSTER \
    --family $TASKDEF \
    --region $REGION \
    --query 'taskArns[*]' \
    --output text)

aws ecs describe-tasks \
    --tasks $TASKS \
    --region $REGION \
    --cluster $CLUSTER \
    --query "tasks[] | reverse(sort_by(@, &createdAt)) | [].[{startedAt: startedAt, createdAt: createdAt, taskArn: taskArn}]" \
    --output table
