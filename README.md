# AddingUserToAmazonLinux2023
This bash script performs a series of administrative tasks on a Linux system, ensuring that it is run with root privileges. Here's a breakdown of what the script does:

1. **Root Privilege Check**: The script checks if it's being run as root. If not, it will exit with an error message.

2. **User Creation**: It prompts for a username and adds this new user to the system.

3. **Password Setting**: Sets a password for the newly created user with interactive prompts.

4. **Sudo Group Assignment**: It checks if the group 'wheel' exists (commonly used for granting administrative privileges on Red Hat-based systems) and adds the user to this group if it exists.

5. **SSH Directory and Permissions**: Creates a `.ssh` directory in the user's home folder, sets the appropriate permissions, and configures `authorized_keys` with a provided SSH public key for remote authentication.

6. **Software Installation**: It downloads and runs a script from Netbird (presumably to install specific software from that source).

# AddingUserToLinux

This script, like the previous one, automates a series of system administration tasks under a Linux environment, ensuring it is executed with root privileges. Here's what this script specifically does:

1. **Root Privilege Check**: Confirms if the script is running with root privileges. If not, it exits with an error message.

2. **User Creation**: It uses `adduser` (as opposed to `useradd` in the previous script) to add a new user. This is generally considered to be more user-friendly as it sets defaults that are typically more desirable on Debian-based systems.

3. **Password Setup**: It checks if password authentication for SSH is enabled. If not, it prompts for and sets a password for the new user manually. This suggests an awareness of security practices regarding SSH.

4. **Sudo Group Assignment**: The script adapts to different distributions by checking for the existence of either 'wheel' (common in CentOS/RHEL) or 'sudo' (common in Ubuntu/Debian) groups to grant administrative privileges, making it versatile across different Linux systems.

5. **SSH Directory Setup**: It creates a `.ssh` directory, sets the permissions, and sets up an `authorized_keys` file with a provided SSH public key. This allows for key-based SSH authentication.

6. **Software Installation**: It downloads and executes a script from Netbird, likely for application installation or setup, which is similar to the previous script.

7. **Cleanup**: It removes the script after execution is complete.

**Adjusted for Multiple Linux Systems**: This script is designed to work across various Linux distributions. It adjusts for different administrative group conventions (`wheel` for Red Hat-based systems like CentOS and `sudo` for Debian-based systems like Ubuntu). The use of `adduser` instead of `useradd` and the checks for SSH configuration also suggest a design to support a broader range of systems compared to the first script, which was more specifically tailored for Amazon Linux.

8. **Cleanup**: Removes the script itself after execution is complete.

This script appears to be tailored for **Amazon Linux**, as it uses 'wheel' as the administrative group which is standard on Red Hat-based systems like Amazon Linux. Additionally, the specific reference to how it handles the 'wheel' group suggests it is optimized for compatibility with Amazon Linux's configuration and package management practices.
