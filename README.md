Request user to input their IP address for anonymous connection checking.

Check if the network connection is anonymous; if not, alert the user and exit.

If connection is anonymous, it will display the input IP location.

For next step, it will request user to input target IP address and nmap will be initiated to scan for any available services and ports.

User may choose to connect target ip via SSH or FTP

This project focus more on SSH, FTP is just extra option for experiment.

Once user choose to connect via SSH, it will once again request for any desire target IP, username and password.

When connected, it will display target machine IP address, uptime, and location (country).

Afterwards, another message will prompt and ask user to input which IP they want check using whois and output the result into a .txt
