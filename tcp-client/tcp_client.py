import socket

# Defines target host and port
target_host = "www.google.com"
target_port = 80

# Creates a socket object
# AF_INET (Indicates IPv4 format)
# SOCK_STREAM (Indicates TCP client)
client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# Connects to the client
client.connect((target_host, target_port))

# Sends data to target
# b"..." (Indicates a sequence of bytes)
# GET / HTTP/1.1 (GET makes an HTTP(version 1.1) request at the root path)
# Host:xxx (HTTP header, indicating domain name of requested server)
# \r\n (Escape sequences, important for HTTP structure that are seperated by headers)
client.send(b"GET / HTTP/1.1\r\nHost: google.com\r\n\r\n")

# Recieves data from target
# 4096 arguement represents max amount of data (in bytes) that may be received 
response = client.recv(4096)

# Displays response from target
print("-----BEGIN RESPONSE-----")
# Decode converts bytes into a string
# Decode with no arguement defaults to string encoding using UTF-8
print(response.decode())
print("-----END RESPONSE-----")

# Closes socket connection
client.close()