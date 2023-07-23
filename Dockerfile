FROM public.ecr.aws/nginx/nginx:1.25

COPY ./index.html /usr/share/nginx/html
COPY ./1_gb.txt /usr/share/nginx/html

EXPOSE 80
