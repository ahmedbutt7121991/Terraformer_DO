echo "TERRAFORMER"
echo "PROVIDER=DIGITAALOCEAN"

echo "CRETING INSTLLER FILE TO INSTALL TERRFORMER IN LINUX SYSTEM"

echo "Installer is specific to digital ocen provider and linux system"
echo "DO version used is 2.8.0"

export PROVIDER=digitalocean
export PROVIDER_VERSION=2.8.0
export OS=linux

echo "INSTLLING TERRAFORMER"

curl -LO https://github.com/GoogleCloudPlatform/terraformer/releases/download/$(curl -s https://api.github.com/repos/GoogleCloudPlatform/terraformer/releases/latest | grep tag_name | cut -d '"' -f 4)/terraformer-${PROVIDER}-linux-amd64



chmod +x terraformer-${PROVIDER}-linux-amd64



sudo mv terraformer-${PROVIDER}-linux-amd64 /usr/local/bin/terraformer


echo "INSTALLING DIGITALOCEAN PROVIDER"


mkdir -p ~/.terraform.d/plugins/linux_amd64


curl -L https://releases.hashicorp.com/terraform-provider-digitalocean/2.8.0/terraform-provider-digitalocean_2.8.0_linux_amd64.zip -o terraform-provider-digitalocean.zip



apt install unzip -y
unzip terraform-provider-digitalocean.zip



mv terraform-provider-digitalocean_v2.8.0 ~/.terraform.d/plugins/linux_amd64/


echo "Checking terraformer version"


terraformer -v

# Removing artifacts

rm -rf terraform-provider-digitalocean.zip
rm -rf terraform-provider-digitalocean_v2.8.0