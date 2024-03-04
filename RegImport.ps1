$importExportFile = "C:/Reg/PRTGReg.reg"  # Path to the file used for both import and export
$registryKey = "HKLM\SOFTWARE\WOW6432Node\Paessler"        # Replace 'HKCU\Path\To\Key' with the actual registry key 

    # Import the registry file
    reg import $importExportFile