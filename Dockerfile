FROM mannymu/ffcreator:latest
# RUN mkdir -p /shida && COPY . /shida && cd /shida && npm install
RUN mkdir -p /shida && cd /shida 
COPY . /shida
WORKDIR /shida
EXPOSE 4000
RUN npm install --legacy-peer-deps
RUN  npm run publish && xvfb-run --auto-servernum --server-num=1 -s '-ac -screen 0 1280x1024x24' node server/app.js
