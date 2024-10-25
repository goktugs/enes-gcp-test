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

# Vite tarafından build edilen dosyaları sunmak için bir statik sunucuya gerek yok
# Ancak Vite'ın yerleşik sunucusunu kullanmak için
EXPOSE 5173
CMD ["npm", "run", "preview"]
