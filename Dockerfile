FROM ubuntu:latest

# Set the environment variable for the password
ENV PASSWORD="JjwXujz50B=P.5E62SuXbff7"

# Install necessary packages
RUN apt-get update && apt-get install -y \
    openjdk-21-jdk \
    && rm -rf /var/lib/apt/lists/*

# Expose necessary ports
EXPOSE 25565 8081 443 8443 22

# Copy all files into the container
COPY . .

# Create a startup script
RUN echo '#!/bin/bash\n\
java -Xms64M -Xmx300M -XX:+UseG1GC -XX:G1HeapRegionSize=4M -XX:+UnlockExperimentalVMOptions -XX:+ParallelRefProcEnabled -XX:+AlwaysPreTouch -XX:MaxInlineLevel=15 -Dterminal.jline=false -Dterminal.ansi=true -jar waterfall-1.19-535.jar << EOF &\n\
confirm-code a78fbe3267\n\
EOF\n\
wait' > /start.sh && chmod +x /start.sh

# Replace 'passwordxd' with the value of the PASSWORD environment variable in plugins/nLogin/config.yml
RUN sed -i "s/passwordxd/\"$PASSWORD\"/g" plugins/nLogin/config.yml

# Set the startup script as the entry point
CMD ["/start.sh"]