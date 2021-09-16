FROM mcr.microsoft.com/mssql/server:2019-latest
# Create database directory
RUN mkdir -p /opt/nuevo-mssql
RUN mkdir -p /opt/nuevo-mssql/data

WORKDIR /opt/nuevo-mssql
# Copy all scripts into working directory
COPY scripts /opt/nuevo-mssql
COPY data /opt/nuevo-mssql/data
# expose port
EXPOSE 1433
CMD /bin/bash ./entrypoint.sh
