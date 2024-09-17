#!/bin/bash

# Duration of the stress test
DURATION=300 # 5 minutes (300 seconds)

# Interval for variation in load (15 seconds)
INTERVAL=15

# Calculate the number of iterations (every 15 seconds for 5 minutes)
ITERATIONS=$((DURATION / INTERVAL))

# Stress test loop
for ((i=1; i<=ITERATIONS; i++))
do
    # Generate random CPU load between 25% and 75% for 2 cores
    CPU_LOAD=$(( (RANDOM % 51) + 25 ))
    
    # Generate random memory load between 200MB and 1GB
    MEM_LOAD=$(( (RANDOM % 801) + 200 ))

    # Print status
    echo "Iteration $i: CPU Load: ${CPU_LOAD}% on 2 cores, Memory Load: ${MEM_LOAD}MB"

    # Run stress-ng with variable CPU and memory load for the interval duration
    stress-ng --cpu 2 --cpu-load ${CPU_LOAD} --vm 1 --vm-bytes ${MEM_LOAD}M --timeout ${INTERVAL}s
    
    # Sleep for 15 seconds to match the interval
    sleep ${INTERVAL}
done

echo "Stress test completed."

