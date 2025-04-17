# Runtime image
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 80

# Build image
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copy project file and restore dependencies
COPY new_Prorject_API.csproj ./
RUN dotnet restore new_Prorject_API.csproj

# Copy the rest of the code and build
COPY . .
RUN dotnet publish new_Prorject_API.csproj -c Release -o /app/publish

# Final image
FROM base AS final
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "new_Prorject_API.dll"]
