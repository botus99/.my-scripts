# Update all PowerShell modules
sudo update-AllPSModules

# Update all installed packages using Scoop
sudo scoop update *

# Clean up unused and leftover files from Scoop
sudo scoop cleanup -k *

# Remove cached files and archives from Scoop
sudo scoop cache rm *

# Display a message to inform the user that their applications are up to date
echo "Your applications are now up to date."