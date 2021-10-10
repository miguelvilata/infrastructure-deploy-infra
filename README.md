##  TERRAFORM - DEPLOY-APP
### Despliegue infraestructura.

## INSTRUCCIONES DE USO ##
Se creó para este ejemplo un bucket s3. Esta bucket servirá como storage para el estado remoto de terraform.
Se utilizará terraform v-1.0.2

### 1- CERTIFICATE_MANAGER

El DNS debe estar migrado a AWS antes de iniciar.

```
terraform init
terraform plan
terraform apply
```

### 2- VPC

Definir si se despliega con 1 NAT o con Multiples NAT (Cambiar valores en variables.tf)

```
terraform init
terraform plan
terraform apply
```
### 3- AURORA MYSQL

Desplegamos el servicio de BBDD Aurora MySQL. El tipo de motor de BBDD se define en los directorios como aurora-mysql.

```
terraform init
terraform plan
terraform apply
```

### 4.1- EC2/Bastion

Desplegamos el Bastion.

```
terraform init
terraform apply -auto-approve
terraform output report >> ../../informe.proyecto
```

### 4.2- EC2/packer-ami

Creamos la AMI para el proyecto.

```
packer build packer-ami.json
```

### 4.3- EC2/alb

Desplegamos un balanceador de carga de aplicación para el entorno requerido.

```
terraform init
terraform plan
terraform apply
```

### 4.4- EC2/asg_alb

Desplegamos el servicio de auto escalado para el entorno requerido.

```
terraform init
terraform plan
terraform apply
```

## Versiones

Para el versionado completo del proyecto usamos [Github](http://github.com/) para el versionado. 

## Autor

* ** Reinaldo León ** 

## Información

* https://www.linkedin.com/in/reinaldoleon/
* Tel. +34 625 59 26 00
