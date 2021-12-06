#!/bin/sh

# 1 - Run the vault kv get command to retrieve the value of a Secret
# 2 - Set the Secret value as an environment variable or file.
# 3 - Start the main application, which can now read the Secret from env var or file.

export VAULT_TOKEN=your-vault-token
export VAULT_ADDR=https://your-vault-address.com:8200
export HELLO_SECRET=$(vault kv get -field foo secret/hello) ./guestbook

