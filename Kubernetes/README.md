# Recursos de Kubernetes

## Utilidades generales

* [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) - CLI para interactuar con la API de Kubernetes. Sigue las instrucciones de instalación que indica la propia web.
* [kubectx](https://github.com/ahmetb/kubectx/#installation) - `tacoma switch` para contextos de Kubernetes.
* [kubectl cheat sheet](resources/k8s-cheat-sheet.pdf)
* [Mozilla SOPS](https://github.com/mozilla/sops/releases) - Si usas Debian o derivados, puedes instalarlo usando el fichero `*.deb`. Con cualquier otra distribución, realiza estos pasos (sustituye `${VERSION}` por la última versión disponible):

```bash
# Cambia .linux por .darwin si usas MacOS
sudo wget https://github.com/mozilla/sops/releases/download/${VERSION}/sops-${VERSION}.linux -O /usr/local/bin/sops
sudo chmod +x /usr/local/bin/sops
```

## AWS EKS

Para acceder a un clúster de Kubernetes en AWS EKS, necesitamos las siguientes herramientas:

* [aws-iam-authenticator](https://docs.aws.amazon.com/eks/latest/userguide/install-aws-iam-authenticator.html) - Con Linux o MacOS, realiza los siguientes pasos (sustituye `${VERSION}` por la última versión disponible, y `${OS}` por `linux` o `darwin`):

```bash
sudo wget https://github.com/kubernetes-sigs/aws-iam-authenticator/releases/download/v${VERSION}/heptio-authenticator-aws_${VERSION}_${OS}_amd64 -O /usr/local/bin/aws-iam-authenticator
sudo chmod +x /usr/local/bin/aws-iam-authenticator
```

* [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-bundle.html) - CLI para interactuar con la API de AWS.

### Obtener KUBECONFIG para proyecto de AWS

**NOTA:** Para que devuelva las credenciales correctamente, primero debes tener configuradas las credenciales de acceso al proyecto de AWS, ya sea con `tacoma switch`, o con [variables de entorno de AWS](https://docs.aws.amazon.com/es_es/cli/latest/userguide/cli-configure-envvars.html).

* La variable `${CLUSTERNAME}` es el nombre del clúster de Kubernetes en AWS EKS.

```bash
aws eks update-kubeconfig --name ${CLUSTERNAME}
```

Puedes comprobar que tienes acceso al clúster ejecutando lo siguiente:

```bash
$ kubectl get nodes
NAME                                       STATUS   ROLES    AGE   VERSION
ip-10-0-1-133.eu-west-1.compute.internal   Ready    <none>   63d   v1.11.5
ip-10-0-2-19.eu-west-1.compute.internal    Ready    <none>   63d   v1.11.5
ip-10-0-2-39.eu-west-1.compute.internal    Ready    <none>   63d   v1.11.5
```

## GCP GKE

* [GCloud CLI](https://cloud.google.com/sdk/install) -  CLI de Google para interactuar con la API de GCloud. Forma parte del SDK de Google, que tendrás que instalar para utilizar el comando `gcloud`.

### Obtener KUBECONFIG para proyecto de GCloud

Debes solicitar a tu DevOps favorito que te otorgue permisos en el proyecto de GCloud correspondiente para poder obtener las credenciales y el acceso al clúster.

**NOTA:** Las variables `${PROJECTNAME}`, `${CLUSTERNAME}` y `${GCPZONE}` varian entre proyectos, y tendrás que consultarlas y configurarlas previamente.

```bash
gcloud container cluster get-credentails --project ${PROJECTNAME} --name ${CLUSTERNAME} --zone ${GCPZONE}
```

Puedes comprobar que tienes acceso al clúster ejecutando lo siguiente:

```bash
$ kubectl get nodes
NAME                                  STATUS   ROLES    AGE    VERSION
gke-ue-cluster-pool-2-2960fbeb-1w2j   Ready    <none>   133d   v1.11.4-gke.8
gke-ue-cluster-pool-2-2960fbeb-cnld   Ready    <none>   133d   v1.11.4-gke.8
gke-ue-cluster-pool-2-2960fbeb-flgf   Ready    <none>   147d   v1.11.4-gke.8
```
