"C:\Program Files\PuTTY\plink.exe" -i "..\MmsPiFobReader Private.ppk" root@10.1.2.191 systemctl stop MmsPiFobReader
del /Q /S bin\Release\publish
dotnet publish -c Release -o bin\Release\publish
"C:\Program Files\PuTTY\pscp.exe" -batch -r -i "..\MmsPiFobReader Private.ppk" "bin\Release\publish\*" root@10.1.2.191:/opt/MmsPiFobReader/
"C:\Program Files\PuTTY\plink.exe" -i "..\MmsPiFobReader Private.ppk" root@10.1.2.191 systemctl start MmsPiFobReader