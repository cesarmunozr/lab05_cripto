
# Network Traffic Capture and HASSH Calculation

This document outlines the steps to capture network traffic between SSH clients and a server using different versions of Ubuntu, and then calculate the HASSH and HASSHS from the captured traffic.

## Prerequisites

Ensure Docker and Docker Compose are installed on your system.

## Step-by-Step Guide

1. **Build and Run Docker Containers**

   Build and run the Docker containers defined in the `docker-compose.yml` file:

   ```bash
   docker-compose up --build -d
   ```

2. **Capture Network Traffic and Connect via SSH**

   For each client (Ubuntu 16.10, 18.10, 20.10, and 22.10), perform the following steps to capture network traffic while connecting to the server (Ubuntu 22.10).

   ### Client Ubuntu 16.10 to Server Ubuntu 22.10

   1. **Start Traffic Capture on the Client**

      ```bash
      docker exec -it client_16_10 /bin/bash
      tcpdump -i eth0 -w /data/traffic.pcap
      ```

   2. **Connect to the Server via SSH**

      ```bash
      docker exec -it client_16_10 /bin/bash
      ssh prueba@server_client_22_10 -p 22
      ```

   3. **Copy the Captured Traffic File to the Host**

      ```bash
      docker cp client_16_10:/data/traffic.pcap ./16_10to22_10.pcap
      ```

   ### Client Ubuntu 18.10 to Server Ubuntu 22.10

   1. **Start Traffic Capture on the Client**

      ```bash
      docker exec -it client_18_10 /bin/bash
      tcpdump -i eth0 -w /data/traffic.pcap
      ```

   2. **Connect to the Server via SSH**

      ```bash
      docker exec -it client_18_10 /bin/bash
      ssh prueba@server_client_22_10 -p 22
      ```

   3. **Copy the Captured Traffic File to the Host**

      ```bash
      docker cp client_18_10:/data/traffic.pcap ./18_10to22_10.pcap
      ```

   ### Client Ubuntu 20.10 to Server Ubuntu 22.10

   1. **Start Traffic Capture on the Client**

      ```bash
      docker exec -it client_20_10 /bin/bash
      tcpdump -i eth0 -w /data/traffic.pcap
      ```

   2. **Connect to the Server via SSH**

      ```bash
      docker exec -it client_20_10 /bin/bash
      ssh prueba@server_client_22_10 -p 22
      ```

   3. **Copy the Captured Traffic File to the Host**

      ```bash
      docker cp client_20_10:/data/traffic.pcap ./20_10to22_10.pcap
      ```

   ### Client Ubuntu 22.10 to Server Ubuntu 22.10

   1. **Start Traffic Capture on the Client**

      ```bash
      docker exec -it client_22_10 /bin/bash
      tcpdump -i lo -w /data/traffic.pcap
      ```

   2. **Connect to the Server via SSH**

      ```bash
      docker exec -it client_22_10 /bin/bash
      ssh prueba@127.0.0.1 -p 22
      ```

   3. **Copy the Captured Traffic File to the Host**

      ```bash
      docker cp client_22_10:/data/traffic.pcap ./22_10to22_10.pcap
      ```

3. **Calculate HASSH from Captured Traffic**

   1. **Clone the FATT Repository**

      ```bash
      git clone https://github.com/kauedg/fatt
      cd fatt
      ```

   2. **Run FATT to Calculate HASSH**

      ```bash
      python3 fatt.py -r ../captures/16_10to22_10.pcap -p -j
      python3 fatt.py -r ../captures/18_10to22_10.pcap -p -j
      python3 fatt.py -r ../captures/20_10to22_10.pcap -p -j
      python3 fatt.py -r ../captures/22_10to22_10.pcap -p -j
      ```

4. **Custom SSH and Modified Server KEI**

   To modify the KEI on the server and use a custom SSH version, follow these steps:

   1. **Run the Configuration Script**

      ```bash
      ./config.sh
      ```

   2. **Restart the Server Container**

      ```bash
      docker restart server_client_22_10
      ```

5. **Repeat Network Traffic Capture and HASSH Calculation**

   Repeat the steps above to capture network traffic and calculate HASSH with the modified server configuration.

---
