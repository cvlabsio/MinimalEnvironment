#!/bin/bash
# https://kubernetes.io/docs/tasks/tools/install-kubectl-macos/#install-kubectl-convert-plugin 
# https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/#install-kubectl-convert-plugin

which kubectl
if [ $? -eq 0 ]; then 
    echo "Installing kubectl convert plugin..."
    OS_TYPE="`uname -o`"

    # Ubuntu 20.04
    if [ $OS_TYPE = "GNU/Linux" ]; then
            curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl-convert"
            sudo install -o root -g root -m 0755 kubectl-convert /usr/local/bin/kubectl-convert
    fi
    
    if [ $OS_TYPE = "Darwin" ]; then
        MAC_ARCH="`uname -m`"
        curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/darwin/${MAC_ARCH}/kubectl-convert"
        chmod +x ./kubectl-convert
        sudo mv ./kubectl-convert /usr/local/bin/kubectl-convert
        sudo chown root: /usr/local/bin/kubectl-convert
    fi

    # verify
    kubectl convert --help
fi
