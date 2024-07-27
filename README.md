# AddingUserToAmazonLinux2023
This bash script performs a series of administrative tasks on a Linux system, ensuring that it is run with root privileges. Here's a breakdown of what the script does:

1. **Root Privilege Check**: The script checks if it's being run as root. If not, it will exit with an error message.

2. **User Creation**: It prompts for a username and adds this new user to the system.

3. **Password Setting**: Sets a password for the newly created user with interactive prompts.

4. **Sudo Group Assignment**: It checks if the group 'wheel' exists (commonly used for granting administrative privileges on Red Hat-based systems) and adds the user to this group if it exists.

5. **SSH Directory and Permissions**: Creates a `.ssh` directory in the user's home folder, sets the appropriate permissions, and configures `authorized_keys` with a provided SSH public key for remote authentication.

6. **Software Installation**: It downloads and runs a script from Netbird (presumably to install specific software from that source).

7. **Cleanup**: Removes the script itself after execution is complete.

This script appears to be tailored for **Amazon Linux**, as it uses 'wheel' as the administrative group which is standard on Red Hat-based systems like Amazon Linux. Additionally, the specific reference to how it handles the 'wheel' group suggests it is optimized for compatibility with Amazon Linux's configuration and package management practices.
