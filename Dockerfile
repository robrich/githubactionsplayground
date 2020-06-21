FROM mcr.microsoft.com/dotnet/core/sdk:3.1-alpine

WORKDIR /src
COPY ./GitHubActionsPlayground.csproj .
RUN dotnet install

COPY . .
RUN dotnet build -c Release
RUN dotnet publish -c Release -o /dist

WORKDIR /dist
ENV ASPNETCORE_ENVIRONMENT Production
ENV ASPNETCORE_URLS http://+:80

CMD ["dotnet", "GitHubActionsPlayground.dll"]
