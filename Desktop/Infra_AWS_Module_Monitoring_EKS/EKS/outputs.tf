output "eks_cpu_alarm_name" {
  description = "Nombre de la alarma de uso de CPU en los nodos EKS"
  value       = aws_cloudwatch_metric_alarm.cpu_utilization.alarm_name
}

output "eks_memory_alarm_name" {
  description = "Nombre de la alarma de uso de memoria en los nodos EKS"
  value       = aws_cloudwatch_metric_alarm.memory_utilization.alarm_name
}

output "eks_pod_restarts_alarm_name" {
  description = "Nombre de la alarma de reinicios de contenedores en EKS"
  value       = aws_cloudwatch_metric_alarm.pod_restarts.alarm_name
}

output "eks_replica_availability_alarm_name" {
  description = "Nombre de la alarma de disponibilidad de réplicas en EKS"
  value       = aws_cloudwatch_metric_alarm.replica_availability.alarm_name
}

output "eks_service_errors_alarm_name" {
  description = "Nombre de la alarma de errores en los servicios EKS"
  value       = aws_cloudwatch_metric_alarm.service_errors.alarm_name
}
