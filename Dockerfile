FROM docker.io/dotnet/runtime:7.0

# Install curl (Debian-based)
RUN apt-get update && \
    apt-get install -y curl && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY /appdata .
    
 ENTRYPOINT ["dotnet", "greannyApp.dll"]
