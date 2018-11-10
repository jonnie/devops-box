FROM python:3.6-jessie

# AWS CLI
RUN pip install awscli --upgrade --user
ENV PATH ~/.local/bin:$PATH

# KUBERNETES
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
RUN chmod 755 kubectl
RUN mv kubectl /usr/local/bin

# KOPS
RUN curl -LO https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64
RUN chmod 755 kops-linux-amd64
RUN mv kops-linux-amd64 /usr/local/bin/kops

# UTILS
RUN apt-get -y update
RUN apt-get -y install jq dnsutils uuid-runtime vim

# HELM
RUN curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get > get_helm.sh
RUN chmod 700 get_helm.sh
RUN ./get_helm.sh
