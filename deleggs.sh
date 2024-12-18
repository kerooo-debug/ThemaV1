#!/bin/bash

# Input tetap
egg_ids=("1" "2" "3" "4") # Daftar ID Egg yang akan dihapus

# Meminta API Token dari pengguna
read -p "Masukkan Bearer Token (API Key): " api_token
read -p "Masukkan Domain Panel (tanpa https://): " domain

# Loop untuk menghapus setiap Egg
for egg_id in "${egg_ids[@]}"; do
    # Endpoint API
    endpoint="https://$domain/api/application/nests/5/eggs/$egg_id"
    
    # Menghapus Egg menggunakan API
    response=$(curl -s -X DELETE "$endpoint" \
        -H "Authorization: Bearer $api_token" \
        -H "Content-Type: application/json")
    
    # Cek apakah berhasil
    if [ -z "$response" ]; then
        echo "Egg dengan ID $egg_id berhasil dihapus."
    else
        echo "Gagal menghapus Egg dengan ID $egg_id. Respon API: $response"
    fi
done
