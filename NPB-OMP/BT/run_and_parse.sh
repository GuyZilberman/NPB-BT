# Set the default class to A
CLASS=${1:-A}

# Accept OMP_NUM_THREADS from the second parameter or default to 1
OMP_NUM_THREADS=${2:-32}

source BT/script.sh ${CLASS} ${OMP_NUM_THREADS} &> BT/log.txt
python BT/parse_results.py 