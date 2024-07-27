#!/bin/bash

echo "Starting the script. Ensure it's being run with root privileges."

# Ensure the script is run as root.
if [ "$(id -u)" != "0" ]; then
    echo "This script must be run as root" 1>&2
    exit 1
fi

echo "Script is running as root."

# Get the username as input.
read -p "Enter the username of the new user: " username
echo "Adding new user: $username..."

# Add the new user and ask for a password.
adduser $username

# Now verify if a password was set, if not, set it explicitly
if ! grep -q '^PasswordAuthentication yes' /etc/ssh/sshd_config; then
    echo "Password authentication is not enabled in SSH configuration, setting password manually."
    echo "Enter password for new user:"
    passwd $username
fi

echo "$username has been added and password is set."

echo "Checking and adding user to appropriate sudo group."

# Check if the system uses 'wheel' (CentOS/RHEL) or 'sudo' (Ubuntu/Debian) for granting admin privileges.
if grep -q -E "^wheel:" /etc/group; then
    usermod -aG wheel $username
    echo "$username added to 'wheel' group."
elif grep -q -E "^sudo:" /etc/group; then
    usermod -aG sudo $username
    echo "$username added to 'sudo' group."
else
    echo "Failed to add user to sudo group. Group 'wheel' or 'sudo' does not exist." 1>&2
    exit 2
fi

echo "Creating .ssh directory and setting permissions."

# Create .ssh directory for the user's home directory.
mkdir -p /home/$username/.ssh
chmod 700 /home/$username/.ssh

echo ".ssh directory created and permissions set."

# Create and set the authorized_keys file with the provided public SSH key.
echo "Setting up SSH key authentication for the user."
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC49VWuDh8kL3IjN6en8PSV0DNMR6ysMIZQzCnHh2n/XEuiSXlciX8SQsQplJuk8EAxCq/+Kt84E1wkNd1WDXLMtNAFOMZVsoPsG5TfSAD04qAbNc2YLS340w+jjp1DIeItQmSyipD2x868q7HwCjy01HSlt0Z+ddmRk7a67CYtEwuXO751hkXrdCZPFD29ugK/SJVyOP/WIVJ/ov+TyXc3Gdv8ToTiRAMsDbelabSPUCE6BTFA4Bjg3YdnrT17EWS2PfRy3UgGLg35qSpKmQodweFEFCHK0D5gib09Fo29xTV1sKKgez4/hAsbbqbrYhMyCXcGS+QxZNQ72Xci9Azv1Lk1OEe7kPd6Ju/mMU3j1ZkI4QRnJi+o+X02VHtz9ksHHWR7EqQq2/N6Ci30OL8VI2ILqwojrhhQF1LkjPQSYi0rPiMehhCvIE+ze8GWTN3PT5m2Y1hxjZaKwOs8fbmY9+aQXqGAkAy2MSBb/JZ15lx6I/zFatIzlvVrAC1nNKkOE0h7XsHVQjwGeb2yHTIPzes8kM1MHUEvq3IfCOBPnV5zQYFT5Hszbv80P9gsfG2yBh5Xs4CGWbKkU0+Vpn2chJvj63i783JP6BKuf/AoJL54JL0/Jy9Pz6AOzlmp4W8LIg4JvKuXlSUDdHkehlDMni45wAHDWYmt/McxKlFGFQ== gocitybuy@gmail.com" > /home/$username/.ssh/authorized_keys
chmod 600 /home/$username/.ssh/authorized_keys
chown -R $username:$username /home/$username/.ssh

echo "SSH key authentication setup complete."

echo "Installing software from Netbird..."
curl -fsSL https://pkgs.netbird.io/install.sh | sh
echo "Software installation complete."

echo "Cleaning up by removing the script."
rm -- "$0"
echo "Setup completed successfully. Script removed."
