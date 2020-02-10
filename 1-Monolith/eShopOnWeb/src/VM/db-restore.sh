#!/bin/bash
######################################################################################
# This script is to build the database context for the MSSQL eShopOnWeb DB container #
# requires dotnet tools be installed                                                 #
######################################################################################
cd /home/eshopadmin/eShopOnWeb/src/Web
dotnet restore
dotnet tool restore
dotnet ef database update -c catalogcontext -p ../Infrastructure/Infrastructure.csproj -s Web.csproj
dotnet ef database update -c appidentitydbcontext -p ../Infrastructure/Infrastructure.csproj -s Web.csproj