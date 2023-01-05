## CONFIG LOCAL ENV
echo "[*] Config local environment..."
alias vault='sudo docker-compose exec vault vault "$@"'
export VAULT_ADDR=http://127.0.0.1:8200

## INIT VAULT
echo "[*] Init vault..."
vault operator init -address=${VAULT_ADDR} > ./data/keys.txt
export VAULT_TOKEN=$(grep 'Initial Root Token:' ./data/keys.txt | awk '{print substr($NF, 1, length($NF)-1)}')

## UNSEAL VAULT
echo "[*] Unseal vault..."
vault operator unseal -address=${VAULT_ADDR} $(grep 'Key 1:' ./data/keys.txt | awk '{print $NF}')
vault operator unseal -address=${VAULT_ADDR} $(grep 'Key 2:' ./data/keys.txt | awk '{print $NF}')
vault operator unseal -address=${VAULT_ADDR} $(grep 'Key 3:' ./data/keys.txt | awk '{print $NF}')
