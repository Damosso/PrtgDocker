ARG BASE_IMAGE=mcr.microsoft.com/windows/server:ltsc2019
FROM $BASE_IMAGE

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

ARG PRTG_INSTALLER_URL
arg PRTG_INSTALLER_ADDITIONAL_ARGS
ARG PRTG_EMAIL="prtg@example.com"
ARG PRTG_LICENSENAME="prtgtrial"
ARG PRTG_LICENSEKEY="000014-YZ6KFM-8FFR8Y-JFF7UE-1HANF7-22MGUY-MJQV86-FHY6EX-BGDEUY-CU7HFJ"

COPY PrtgDocker.ps1 config.dat* *.exe *.ttf C:/Installer/

RUN Set-ExecutionPolicy Unrestricted; C:/Installer/PrtgDocker.ps1 -Install 

COPY RegSync.ps1 RegImport.ps1 TaskSchedule.ps1 C:/Scripts/

ENTRYPOINT ["powershell"]
CMD ["-command", "C:/Scripts/RegImport.ps1 | C:/Scripts/TaskSchedule.ps1 ; C:/Installer/PrtgDocker.ps1 -Wait"]
