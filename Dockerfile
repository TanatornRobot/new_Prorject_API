# Runtime image
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 80

# Build image
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# ✅ ใช้ชื่อไฟล์ที่ถูกต้อง
COPY new_Prorject_API.csproj ./
RUN dotnet restore new_Prorject_API.csproj

# Copy source code and build
COPY . .
RUN dotnet publish new_Prorject_API.csproj -c Release -o /app/publish

# Final image
FROM base AS final
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "new_Prorject_API.dll"]
