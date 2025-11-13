###############################
# Variables generales
###############################

variable "cluster_name" {
  description = "Nombre del cluster EKS"
  type        = string
}

variable "project" {
  description = "Nombre del proyecto"
  type        = string
}

variable "bdo_name_service" {
  description = "Nombre del servicio BDO"
  type        = string
}

variable "bdo_environment" {
  description = "Entorno (dev, staging, prod)"
  type        = string
}

variable "alarm_actions" {
  description = "ARNs para las acciones de alarma (SNS, etc.)"
  type        = list(string)
  default     = []
}

variable "ok_actions" {
  type        = list(string)
  default     = []
  description = "Lista de ARNs a notificar cuando una alarma vuelva a estado OK"
}

variable "resource_adicional_tags" {
  type        = map(string)
  default     = {}
  description = "Etiquetas adicionales no obligatorias"
}

variable "resource_tags" {
  type        = map(string)
  default     = {}
  description = "Etiquetas Bdo - Etiquetas Aval"
}

variable "sns_topic_arn" {
  type        = string
  description = "SNS topic ARN para notificaciones"
}

###############################
# Variables por métrica
###############################

## CPU
variable "eks_cpu_evaluation_periods" {
  description = "Número de períodos a evaluar para la CPU"
  type        = number
  default     = 2
}
variable "eks_cpu_events_period" {
  description = "Periodo (en segundos) para la métrica de CPU"
  type        = number
  default     = 300
}
variable "eks_cpu_threshold" {
  description = "Umbral de CPU (%) para alarmas"
  type        = number
  default     = 80
}

## Memory
variable "eks_memory_evaluation_periods" {
  description = "Número de períodos a evaluar para la memoria"
  type        = number
  default     = 2
}
variable "eks_memory_events_period" {
  description = "Periodo (en segundos) para la métrica de memoria"
  type        = number
  default     = 300
}
variable "eks_memory_threshold" {
  description = "Umbral de memoria (%) para alarmas"
  type        = number
  default     = 75
}

## Pod restarts
variable "eks_restarts_evaluation_periods" {
  description = "Número de periodos a evaluar para reinicios"
  type        = number
  default     = 1
}
variable "eks_restarts_events_period" {
  description = "Periodo (en segundos) para contar reinicios"
  type        = number
  default     = 300
}
variable "eks_restarts_threshold" {
  description = "Umbral (sum) de reinicios de contenedores"
  type        = number
  default     = 3
}

## Replica availability
variable "eks_replicas_evaluation_periods" {
  description = "Número de periodos a evaluar para réplicas disponibles"
  type        = number
  default     = 1
}
variable "eks_replicas_events_period" {
  description = "Periodo (en segundos) para verificar réplicas disponibles"
  type        = number
  default     = 300
}
variable "eks_replicas_threshold" {
  description = "Porcentaje mínimo de réplicas disponibles (p. ej. 100)"
  type        = number
  default     = 100
}

## Service errors
variable "eks_errors_evaluation_periods" {
  description = "Número de periodos a evaluar para errores"
  type        = number
  default     = 1
}
variable "eks_errors_events_period" {
  description = "Periodo (en segundos) para la métrica de errores"
  type        = number
  default     = 300
}
variable "eks_errors_threshold" {
  description = "Umbral (sum) de errores en servicios (por ejemplo 1 por periodo o porcentaje según métrica)"
  type        = number
  default     = 1
}
