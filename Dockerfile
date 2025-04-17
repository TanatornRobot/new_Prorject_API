# -------- Build Stage --------
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copy only .csproj file to use layer caching and restore early
COPY *.csproj ./
RUN dotnet restore

# Copy the rest of the source code
COPY . . 
RUN dotnet publish -c Release -o /app/publish

# -------- Runtime Stage --------
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS final
WORKDIR /app

# Copy build result from previous stage
COPY --from=build /app/publish .

# Set the entry point of the application
ENTRYPOINT ["dotnet", "new_Prorject_API.dll"]
