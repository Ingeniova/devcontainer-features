#!/bin/bash                                                                                                                                  
set -e                                                                                                                                       
                                                                                                                                              
VERSION=${VERSION:-"latest"}                                                                                                                 
USERNAME="${_REMOTE_USER}"                                                                                                                   
USER_HOME=$(eval echo "~${USERNAME}")                                                                                                        
                                                                                                                                              
echo "Installing Claude Code (native) for user ${USERNAME}..."                                                                               
                                                                                                                                              
# Create required directories                                                                                                                
su - "${USERNAME}" -c "mkdir -p ${USER_HOME}/.local/bin ${USER_HOME}/.local/share/claude"                                                    
                                                                                                                                              
# Install using native installer                                                                                                             
su - "${USERNAME}" -c "curl -fsSL https://claude.ai/install.sh | bash"                                                                       
                                                                                                                                              
# Ensure PATH includes ~/.local/bin (for bash and zsh)                                                                                       
for rc in ".bashrc" ".zshrc"; do                                                                                                             
  RC_FILE="${USER_HOME}/${rc}"                                                                                                               
  if [ -f "$RC_FILE" ]; then                                                                                                                 
    if ! grep -q '.local/bin' "$RC_FILE"; then                                                                                               
      echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$RC_FILE"                                                                              
    fi                                                                                                                                       
  fi                                                                                                                                         
done                                                                                                                                         
                                                                                                                                              
echo "Claude Code installed successfully."
