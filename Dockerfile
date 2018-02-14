FROM microsoft/nanoserver:latest

ENV VERSION 1.13.8

RUN powershell Invoke-WebRequest https://nginx.kr/nginx/win64/nginx-$ENV:VERSION-dev-win64.zip -UseBasicParsing -OutFile C:\\nginx-$ENV:VERSION-dev-win64.zip
RUN powershell Expand-Archive C:\\nginx-$ENV:VERSION-dev-win64.zip -Dest C:\ -Force;
RUN powershell Remove-Item C:\\nginx-$ENV:VERSION-dev-win64.zip -Confirm:$False;
RUN powershell Rename-Item -Path nginx-$ENV:VERSION-dev-win64 -NewName nginx

WORKDIR C:\\nginx
EXPOSE 80

ENTRYPOINT powershell .\\nginx.exe
