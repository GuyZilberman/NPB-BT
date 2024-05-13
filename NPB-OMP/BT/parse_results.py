import re
import os

def extract_times_from_log(file_path):
    time_pattern = re.compile(r"Time in seconds =\s+(\d+\.\d+)")
    times = []
    
    with open(file_path, 'r') as file:
        content = file.read()
        times = time_pattern.findall(content)
    
    return times

def print_times(times):
    print("Time in seconds results:")
    for time in times:
        print(time)

if __name__ == "__main__":
    log_file_path = os.path.join('BT', 'log.txt')  # Update this to your actual log file path
    times = extract_times_from_log(log_file_path)
    print_times(times)
