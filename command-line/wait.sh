#! /usr/bin/env bash
sleep 10 &
echo "开始等待后台任务完成..."
wait
echo "所有后台任务已完成"
ls
