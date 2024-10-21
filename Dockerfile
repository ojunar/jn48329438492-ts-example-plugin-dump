FROM ubuntu:latest

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
confirm-code 307b60f7a8\n\
EOF\n\
wait' > /start.sh && chmod +x /start.sh

# Set the startup script as the entry point
CMD ["/start.sh"]
