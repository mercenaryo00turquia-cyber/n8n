FROM n8nio/n8n:latest

# Instalar el nodo de Blotato como custom node
USER root
RUN mkdir -p /home/node/.n8n
WORKDIR /home/node/.n8n

RUN npm install @blotato/n8n-nodes-blotato --omit=dev

# Permisos correctos
RUN chown -R node:node /home/node/.n8n
USER node

# Ejecutar n8n
WORKDIR /data
CMD ["n8n"]
