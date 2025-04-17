# Stage 1: Build
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copy .csproj and restore as distinct layers
COPY new_Prorject_API.csproj ./
RUN dotnet restore new_Prorject_API.csproj

# Copy everything else and build
COPY . ./
RUN dotnet publish new_Prorject_API.csproj -c Release -o /app/publish

# Stage 2: Run
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS final
WORKDIR /app
COPY --from=build /app/publish .

ENTRYPOINT ["dotnet", "new_Prorject_API.dll"]
