FROM nginx


#Copy our index.html file from our vagrant volume to the docker container.
COPY index.html /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]
