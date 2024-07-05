FROM python:3.8-alpine

WORKDIR /app

COPY . .

RUN apk update && apk add --no-cache gcc musl-dev 
RUN pip install --no-cache-dir -r requirements.txt
RUN apk add --no-cache nginx

RUN rm /etc/nginx/nginx.conf

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD nginx && python app.py
