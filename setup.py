# setup.py
import subprocess

def main():
    # Execute the psql command to import the SQL file
    subprocess.run(['psql', '-d', 'taskmanager', '-f', 'taskmanager_db.sql'])

if __name__ == "__main__":
    main()
