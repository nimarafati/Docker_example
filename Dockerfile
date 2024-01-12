# easyshiny

# Use the rocker/shiny image version 4.3.2 as the base image
FROM rocker/shiny:4.3.2

# Update package lists, upgrade installed packages, and clean up
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# apt-get install -y git libxml2-dev libudunits2-dev libhdf5-dev && \

# Install additional R packages using Rscript
RUN Rscript -e 'reqPkg = c("colourpicker", "tidyr", "dplyr", "DT", "ggplot2"); newPkg = reqPkg[!(reqPkg %in% installed.packages()[,"Package"])]; if(length(newPkg)){install.packages(newPkg)}'

# Create a directory for the Shiny app in the shiny-server directory
RUN mkdir /srv/shiny-server/app

# Copy the content of the current directory to the /srv/shiny-server/app directory in the container
COPY . /srv/shiny-server/app

# Copy the shiny-server configuration file to the /etc/shiny-server directory in the container
COPY shiny-server.config /etc/shiny-server/shiny-server.conf

# Change ownership of the /srv/shiny-server/app directory to the shiny user
RUN sudo chown -R shiny:shiny /srv/shiny-server/app

# Expose port 3838 for Shiny app
EXPOSE 3838

# Specify the command to run when the container starts (starts the shiny server)
CMD ["/usr/bin/shiny-server"]
