PROJECT_DIR="/home/adnan/wsl/projects/$1"
ENV_DIR="/home/adnan/wsl/environments" 

MODULES="pytest sphinx $2 $3 $4 $5 $6 $7 $8 $9"

echo "Setting up project $1 at $PROJECT_DIR"
echo $ENV_DIR
echo "With modules: $MODULES"

if [[ -d "$PROJECT_DIR" ]]
then
    rm -Rf $PROJECT_DIR
fi
mkdir $PROJECT_DIR
cd $PROJECT_DIR
git clone https://github.com/adnaan0l/python-folder-structure.git .

if [[ -d "$ENV_DIR/$1-env" ]]
then 
    rm -Rf "$ENV_DIR/$1-env"
fi
cd $ENV_DIR

python3 -m venv "$1-env"
. "$1-env"/bin/activate

cd $PROJECT_DIR

if [[ -z "$MODULES" ]]
then
    echo "No modules to install..."
else
    for MODULE in $MODULES
    do
        echo "Installing $MODULE"
        pip3 install $MODULE 
        echo "$MODULE" >> requirements.txt
    done
fi

