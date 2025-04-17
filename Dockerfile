FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src


# Copy the rest of the code and build
COPY . .

FROM base AS final
WORKDIR /app
COPY --from=build /app/publish .
