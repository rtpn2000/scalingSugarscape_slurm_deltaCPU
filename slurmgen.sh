#!/bin/bash

# Printing timestamp!
printTimestamp() {
    echo "$(date +"%Y-%m-%d %H:%M:%S")"
}

# Recording the start time for calculating the total execution time.
startTime=$(date +%s)

# Checking if correct number of arguments are passed.
if [ "$#" -ne 1 ]; then
    echo "$(printTimestamp) - Usage: $0 <configFile>"
    exit 1
fi

configFile="$1"
outputDirectory="simulation_outputs"

if [ ! -d "$outputDirectory" ]; then
    mkdir -p "$outputDirectory"
    echo "$(printTimestamp) - Created directory: $outputDirectory"
fi

echo "$(printTimestamp) - Extracting configuration..."
read numSeeds numTimesteps decisionModels <<< $(python3 extractConfig.py "$configFile")
echo "$(printTimestamp) - Configuration extraction complete."

IFS=', ' read -r -a decisionModelsArray <<< "$decisionModels"

# SLURM scripts creation!
for seed in $(seq 1 $numSeeds); do
    for model in "${decisionModelsArray[@]}"; do
        scriptName="sugarscape_${model}_${seed}.slurm"
        echo "$(printTimestamp) - Creating SLURM batch script: $scriptName"
        cat <<EOL > "$scriptName"
#!/bin/bash
#SBATCH --job-name=sugarscape_${model}_${seed}
#SBATCH --output=${outputDirectory}/sugarscape_${model}_${seed}.out
#SBATCH --error=${outputDirectory}/sugarscape_${model}_${seed}.err
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --time=02:00:00
#SBATCH --account=bcob-delta-cpu
#SBATCH --partition=cpu
#SBATCH --mem=4GB

python3 sugarscape.py --conf $configFile
EOL

        echo "$(printTimestamp) - Submitting SLURM job: $scriptName"
        sbatch "$scriptName"
    done
done

echo "$(printTimestamp) - Waiting for SLURM jobs to finish..."
squeue -u $USER
while squeue -u $USER | grep "sugarscape" > /dev/null; do
    sleep 10
done

echo "$(printTimestamp) - All SLURM jobs completed."

echo "$(printTimestamp) - Cleaning up SLURM script files..."
for seed in $(seq 1 $numSeeds); do
    for model in "${decisionModelsArray[@]}"; do
        rm -f "sugarscape_${model}_${seed}.slurm"
    done
done

echo "$(printTimestamp) - Cleanup complete."

endTime=$(date +%s)

# Calculating total execution time!
duration=$((endTime - startTime))
echo "$(printTimestamp) - Total execution time: $duration seconds."