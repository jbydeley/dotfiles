# Configuring git with personalized settings
# See also: https://git-scm.com/docs/git-config
if [ ! -f "$HOME/.gitconfig.local" ]; then
  echo "Configuring Git global settings..."
  read "FULL_NAME?Enter your full name: "
  read "EMAIL?Enter your email address: "
  read "KEY_PATH?Enter your signing key path [~/.ssh/id_ed25519]: "
  KEY_PATH=${KEY_PATH:-~/.ssh/id_ed25519}

  cat <<EOF > "$HOME/.gitconfig.local"
[user]
  name = ${FULL_NAME}
  email = ${EMAIL}
  signingkey = ${KEY_PATH}

[gpg]
  format = ssh
EOF
fi