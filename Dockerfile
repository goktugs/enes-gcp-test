# Node.js tabanlı bir imaj kullanarak başla
FROM node:18

# Çalışma dizinini ayarla
WORKDIR /app

# Paket dosyalarını kopyala ve bağımlılıkları yükle
COPY package.json package-lock.json ./
RUN npm install

# Uygulama dosyalarını kopyala ve Vite ile üretim için build et
COPY . .
RUN npm run build

# Ortam değişkeni olarak Cloud Run'dan gelen PORT değerini kullan
ENV PORT=8080

# Uygulamanın bu portta dinlemesi gerektiğini bildir
EXPOSE 8080

# Vite'ın preview komutu ile build edilen dosyaları sun, ve PORT'u kullan
CMD ["npm", "run", "preview", "--", "--port", "8080", "--host"]
