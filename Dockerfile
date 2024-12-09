FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /source

COPY *.sln .
COPY web7/*.csproj ./web7/
RUN dotnet restore

COPY web7/. ./web7/
WORKDIR /source/web7
RUN dotnet publish -c release -o /app --no-restore

FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY --from=build /app ./
ENTRYPOINT ["dotnet", "web7.dll"]