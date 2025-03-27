# Use the existing base image
FROM quay.io/souravkl11/rgnk-v3:latest

# Clone the repository
RUN git clone https://github.com/souravkl11/raganork-md /railway/Raganork

# Set the working directory
WORKDIR /railway/Raganork

# Set the timezone
ENV TZ=Asia/Kolkata

# Install dependencies
RUN yarn install --network-concurrency 1

# Create a custom entrypoint script
# This script will run the Node.js application directly
RUN echo '#!/bin/bash' > /entrypoint.sh \
    && echo 'node /railway/Raganork/index.js' >> /entrypoint.sh \
    && chmod +x /entrypoint.sh

# Set the entrypoint to the custom script
ENTRYPOINT ["/entrypoint.sh"]

# Optional: Expose the port your application uses, if any.
# Replace <port> with the actual port number.
# EXPOSE <port>

# No need for CMD here, as the ENTRYPOINT handles running the application.
