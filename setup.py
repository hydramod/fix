# setup.py
import subprocess

def main():
    # Check if the taskmanager database exists
    result = subprocess.run(['psql', '-lqt'], capture_output=True, text=True)
    databases = result.stdout.strip().split('\n')
    database_names = [line.split('|')[0].strip() for line in databases]

    if 'taskmanager' not in database_names:
        # Create the taskmanager database
        subprocess.run(['createdb', 'taskmanager'])

    # Execute the psql command to import the SQL file
    subprocess.run(['psql', '-d', 'taskmanager', '-f', 'taskmanager_db.sql'])

if __name__ == "__main__":
    main()
