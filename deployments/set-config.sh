# #!/usr/bin/env bash

# kubectl config set-cluster fuchicorp-cluster --server=https://kubernetes.default --certificate-authority=/var/run/secrets/kubernetes.io/serviceaccount/ca.crt
# kubectl config set-context fuchicorp-context --cluster=fuchicorp-cluster
# kubectl config set-credentials fuchicorp-user --token="$(cat /var/run/secrets/kubernetes.io/serviceaccount/token)"
# kubectl config set-context fuchicorp-context --user=fuchicorp-user
# kubectl config use-context fuchicorp-context

#!/usr/bin/env bash

if [ ! ~/.kube ]
then
  echo "Making .kube folder."
  mkdir ~/.kube
  echo "Making config inside .kube folder."
  kubectl config set-cluster fuchicorp-cluster --server=https://kubernetes.default --certificate-authority=/var/run/secrets/kubernetes.io/serviceaccount/ca.crt
  kubectl config set-context fuchicorp-context --cluster=fuchicorp-cluster
  kubectl config set-credentials fuchicorp-user --token="$(cat /var/run/secrets/kubernetes.io/serviceaccount/token)"
  kubectl config set-context fuchicorp-context --user=fuchicorp-user
  kubectl config use-context fuchicorp-context
else
  if [ ! -f ~/.kube/config ]
  then
    echo "Making config file inside .kube folder."
    kubectl config set-cluster fuchicorp-cluster --server=https://kubernetes.default --certificate-authority=/var/run/secrets/kubernetes.io/serviceaccount/ca.crt
    kubectl config set-context fuchicorp-context --cluster=fuchicorp-cluster
    kubectl config set-credentials fuchicorp-user --token="$(cat /var/run/secrets/kubernetes.io/serviceaccount/token)"
    kubectl config set-context fuchicorp-context --user=fuchicorp-user
    kubectl config use-context fuchicorp-context
  fi
fi