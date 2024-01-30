# Start with a base image with R pre-installed
FROM rocker/shiny:latest

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    git

# Clone the app from GitHub
RUN git clone https://github.com/Brook98/ConversionTool.git /srv/shiny-server/conversiontool

# Set the working directory to the app directory
WORKDIR /srv/shiny-server/conversiontool

# Restore the R environment using renv
RUN R -e "install.packages('renv', repos = 'http://cran.rstudio.com/')" && \
    R -e "renv::restore()"

# Make the ShinyApp available at port 8080
EXPOSE 8080

# Run the app
CMD ["R", "-e", "shiny::runApp('/srv/shiny-server/conversiontool', host='0.0.0.0', port=8080)"]

