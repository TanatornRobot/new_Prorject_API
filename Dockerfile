# ==============================
# 1. Runtime Image (.NET 8)
# ==============================
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 80

# ==============================
# 2. Build Image (.NET SDK 8)
# ==============================
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# คัดลอกไฟล์ .csproj และ restore dependencies
COPY new_Prorject_API.csproj ./
RUN dotnet restore new_Prorject_API.csproj

# คัดลอกไฟล์โปรเจคที่เหลือทั้งหมด แล้วทำ build และ publish
COPY . .
RUN dotnet publish new_Prorject_API.csproj -c Release -o /app/publish

# ==============================
# 3. Final Image
# ==============================
FROM base AS final
WORKDIR /app

# คัดลอกไฟล์ publish
