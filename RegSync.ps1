$importExportFile = "C:/Reg/PRTGReg.reg"  # Path to the file used for both import and export
$registryKey = "HKLM\SOFTWARE\WOW6432Node\Paessler"        # Replace 'HKCU\Path\To\Key' with the actual registry key 

# Function to export the registry keys (remains unchanged)
function Export-Registry {
    reg export $registryKey $importExportFile /y
}


    # Call the export function (overwrites previous export)
    Export-Registry
    
	
