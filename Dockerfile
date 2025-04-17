# 1. Base image สำหรับ .NET 8
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 80

# 2. SDK image เพื่อ build
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

COPY API_Project/API_Project.csproj ./API_Project/
RUN dotnet restore ./API_Project/API_Project.csproj

COPY . .
WORKDIR /src/API_Project
RUN dotnet publish -c Release -o /app/publish

# 3. Final image
FROM base AS final
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "API_Project.dll"]
