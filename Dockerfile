# Node.js image'ni tanlaymiz
FROM node:18-alpine

# Loyiha katalogiga o'tamiz
WORKDIR /app

# package.json va package-lock.json'ni nusxalaymiz
COPY package*.json ./

# dependency'larni o'rnatamiz
RUN npm install

# qolgan fayllarni nusxalaymiz
COPY . .

# app'ni build qilamiz
RUN npm run build

# Nginx orqali xizmatni ishga tushuramiz
RUN npm install -g serve

CMD ["serve", "-s", "dist"]