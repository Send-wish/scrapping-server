#! /bin/bash
# $#-> 인자의 개수
USER=hcs4125
IMG="python"

echo "==================================================="
echo "컨테이너가 실행중이면 종료"
echo "==================================================="

OLD="$(docker ps --all --quiet --filter "name=$IMG")"
if [ -n "$OLD" ];
then
        docker rm -f $IMG
fi

echo "==================================================="
echo "컨테이너 PULL"
echo "==================================================="
docker pull hcs4125/sendwish_scrapping_only


echo "==================================================="
echo "컨테이너 실행"
echo "==================================================="
docker run -p 5001:5000 -d --name=python hcs4125/sendwish_scrapping_only


echo "==================================================="
echo "이전 버전 이미지 삭제"
echo "==================================================="
docker rmi -f $(docker images -f "dangling=true" -q) || true

echo "==================================================="
echo "container 확인"
echo "==================================================="
docker ps -a

