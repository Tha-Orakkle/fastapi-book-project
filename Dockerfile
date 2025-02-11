FROM python:3.12-slim

RUN apt update && apt install -y nginx

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY ./nginx/nginx.conf /etc/nginx/nginx.conf  
COPY . .

EXPOSE 80 8000

RUN chmod +x start.sh  

# Expose necessary ports
EXPOSE 80 8000  

# Run the startup script
CMD ["sh", "start.sh"]