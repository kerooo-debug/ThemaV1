#!/bin/bash

# Input tetap
node_id="1"
ip_address="0.0.0.0"
port="3000-3200"

# Meminta API token dari pengguna
read -p "Masukkan Bearer Token (API Key): " api_token

# Endpoint API
endpoint="https://panel.domain.com/api/application/nodes/$node_id/allocations"

# Membuat Allocation menggunakan API
response=$(curl -s -X POST "$endpoint" \
    -H "Authorization: Bearer $api_token" \
    -H "Content-Type: application/json" \
    -d '{
        "ip": "'"$ip_address"'",
        "ports": ["'"$port"'"]
    }')

# Cek apakah berhasil
if echo "$response" | grep -q '"object":"allocation"'; then
    echo "Allocation berhasil dibuat untuk IP $ip_address pada port $port."
else
    echo "Gagal membuat allocation. Respon API: $response"
fi
