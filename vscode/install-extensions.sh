#!/bin/bash

# VS Code Extensions
# Run this script to install all extensions

extensions=(
  "akamud.vscode-theme-onedark"
  "anthropic.claude-code"
  "biomejs.biome"
  "bradlc.vscode-tailwindcss"
  "eamodio.gitlens"
  "esbenp.prettier-vscode"
  "expo.vscode-expo-tools"
  "github.copilot"
  "github.copilot-chat"
  "github.vscode-pull-request-github"
  "llvm-vs-code-extensions.lldb-dap"
  "redhat.vscode-yaml"
  "swiftlang.swift-vscode"
  "vscode-icons-team.vscode-icons"
  "vscodevim.vim"
)

for extension in "${extensions[@]}"; do
  code --install-extension "$extension"
done

echo "VS Code extensions installed!"
