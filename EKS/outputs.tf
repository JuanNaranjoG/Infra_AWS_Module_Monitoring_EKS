
# Clústeres monitoreados (para validar)
output "eks_clusters_monitored" {
  description = "Conjunto de clústeres EKS a los que se aplicaron alarmas (modo manual)"
  value       = local.selected_clusters
}

# Nombres de alarmas por clúster (mapas)
output "eks_cpu_alarm_names" {
  description = "Nombres de la alarma de uso de CPU por clúster"
  value       = { for k, v in aws_cloudwatch_metric_alarm.cpu_utilization : k => v.alarm_name }
}

output "eks_memory_alarm_names" {
  description = "Nombres de la alarma de uso de memoria por clúster"
  value       = { for k, v in aws_cloudwatch_metric_alarm.memory_utilization : k => v.alarm_name }
}

output "eks_pod_restarts_alarm_names" {
  description = "Nombres de la alarma de reinicios de contenedores por clúster"
  value       = { for k, v in aws_cloudwatch_metric_alarm.pod_restarts : k => v.alarm_name }
}

output "eks_replica_availability_alarm_names" {
  description = "Nombres de la alarma de disponibilidad de réplicas por clúster"
  value       = { for k, v in aws_cloudwatch_metric_alarm.replica_availability : k => v.alarm_name }
}

output "eks_service_errors_alarm_names" {
  description = "Nombres de la alarma de errores en servicios por clúster"
  value       = { for k, v in aws_cloudwatch_metric_alarm.service_errors : k => v.alarm_name }
}
