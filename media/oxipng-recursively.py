import os
import subprocess
def run_oxipng_recursively(directory):
    # Specify the full path to the oxipng executable
    oxipng_path = os.path.expanduser('~/.cargo/bin/oxipng')
    
    for root, dirs, files in os.walk(directory):
        for file in files:
            if file.endswith('.png'):
                file_path = os.path.join(root, file)
                # Use the full path to the oxipng executable in the subprocess.run call
                subprocess.run([oxipng_path, '-o', '2', file_path])
if __name__ == "__main__":
    current_directory = os.getcwd()
    run_oxipng_recursively(current_directory)
