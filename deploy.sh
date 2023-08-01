mkdir app
cd app

# git clone
echo "start to clone"
git clone https://github.com/mixkio/lion_django_app.git
cd lion_django_app

# venv 설치
echo "start to install venv"
sudo apt-get update && apt intall -y python3.8-venv

# venv 구성
echo "start to make venv"
python3 -m venv venv

# 가상환경 작동
echo "start to activate venv"
source venv/bin/activate

# pip install
echo "start to install requirements"
pip intall -r requirements.txt

# # runserver
# echo "start to runserver"
# cd lion_app && python3 manage.py runserver 0.0.0.0:8000