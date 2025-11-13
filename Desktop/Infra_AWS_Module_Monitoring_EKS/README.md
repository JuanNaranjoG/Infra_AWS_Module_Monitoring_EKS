# 📊 Módulo de Monitoreo para EKS en AWS

Este módulo de **Terraform** permite configurar **alertas de monitoreo** en **Amazon CloudWatch** para el servicio de EKS. Las alertas supervisan errores del servidor, latencia de origen y errores en funciones Lambda@Edge, permitiendo detección temprana de problemas y acción preventiva.

---

## ✅ Requisitos

| Herramienta     | Versión mínima |
| --------------- | -------------- |
| Terraform       | >= 1.0         |
| AWS Provider    | ~> 5.0         |
| Random Provider | ~> 3.4.3       |

---

## 📁 Archivos principales

- **`main.tf`**: Configuración de recursos de CloudWatch (alarmas).
- **`output.tf`**: Variables de salida del módulo.
- **`variables.tf`**: Variables para personalización (nombres, umbrales, etc).

---

## 🔧 Configuración detallada

### Alarmas configuradas:

- **NodeCPUUtilization** – Porcentaje de uso de CPU en los nodos del clúster EKS:

```hcl
resource "aws_cloudwatch_metric_alarm" "cpu_utilization" {
  ...
}
```

- **NodeMemoryUtilization** – Porcentaje de uso de memoria en los nodos del clúster EKS:

```hcl
resource "aws_cloudwatch_metric_alarm" "memory_utilization" {
  ...
}
```

- **PodContainerRestarts** – Número total de reinicios de contenedores dentro de los pods:

```hcl
resource "aws_cloudwatch_metric_alarm" "pod_restarts" {
  ...
}
```

- **ReplicaAvailability** – Porcentaje de réplicas disponibles respecto a las deseadas en los deployments:

```hcl
resource "aws_cloudwatch_metric_alarm" "replica_availability" {
  ...
}
```

- **ServiceRequestErrors** – Porcentaje de solicitudes con error (4xx/5xx) en los servicios expuestos del EKS:

```hcl
resource "aws_cloudwatch_metric_alarm" "service_errors" {
  ...
}
```

**Los threshold vienen por defecto y estos valores son los que se encuentran en el documento de lineamientos de monitoreo.**

---

## ⚙️ Parámetros de las variables threshold

| Variable                                                  | Valor        |
| --------------------------------------------------------- | ------------ |
| eks_cpu_evaluation_periods                                | 2            |
| eks_cpu_events_period                                     | 300 segundos |
| eks_cpu_threshold                                          | 80 (%)       |
| eks_memory_evaluation_periods                             | 2            |
| eks_memory_events_period                                  | 300 segundos |
| eks_memory_threshold                                       | 75 (%)       |
| eks_restarts_evaluation_periods                           | 1            |
| eks_restarts_events_period                                | 300 segundos |
| eks_restarts_threshold                                     | 3            |
| eks_replicas_evaluation_periods                           | 1            |
| eks_replicas_events_period                                | 300 segundos |
| eks_replicas_threshold                                     | 100 (%)      |
| eks_errors_evaluation_periods                             | 1            |
| eks_errors_events_period                                  | 300 segundos |
| eks_errors_threshold                                       | 1 (%)        |


---

## ⚙️ Parámetros configurables

| Parámetro             | Descripción                                             |
| --------------------- | ------------------------------------------------------- |
| `var.service`         | Nombre del servicio.                                    |
| `alarm_name`          | Nombre de la alarma.                                    |
| `comparison_operator` | Operador de comparación (e.g., `GreaterThanThreshold`). |
| `evaluation_periods`  | Cantidad de períodos de evaluación antes de activar.    |
| `metric_name`         | Nombre de la métrica monitoreada.                       |
| `namespace`           | Espacio de nombres de la métrica.                       |
| `period`              | Frecuencia de evaluación en segundos.                   |
| `statistic`           | Estadística usada (`Average`, `Sum`, etc).              |
| `threshold`           | Valor límite para activar la alerta.                    |
| `tags`                | Etiquetas del banco: `tag_environment`, `tag_app`, etc. |

---

## 🧪 Modo de uso

```hcl
module "eks_monitoring" {
  source                  = "git::git@github.com:bocc-principal/Infra_AWS_Module_Monitoring_EKS.git//eks?ref=main"
  project                  = var.project
  bdo_name_service         = var.bdo_name_service
  bdo_environment          = var.bdo_environment
  purpose                  = var.purpose

  sns_topic_arn            = var.sns_topic_arn
}
```

---

## 🧪 A tener en cuenta

Una vez creado el SNS Topic se debe dejar encryptado con su respectivo KMS

---

## 📝 Resource

# https://docs.aws.amazon.com/eks/latest/userguide/what-is-eks.html

# Infra_AWS_Module_Monitoring_EKS
