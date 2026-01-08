
###############################
# Alarmas EKS (iteración manual por clúster)
###############################

# CPU
resource "aws_cloudwatch_metric_alarm" "cpu_utilization" {
  for_each            = local.selected_clusters

  alarm_name          = "${local.alarm_name_base}-${each.key}-NodeCPU"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.eks_cpu_evaluation_periods
  metric_name         = "node_cpu_utilization"
  namespace           = "AWS/EKS"
  period              = var.eks_cpu_events_period
  statistic           = "Average"
  threshold           = var.eks_cpu_threshold
  alarm_description   = "Uso de CPU en nodos del EKS ${each.key}"

  tags = merge(local.merged_tags_common, { cluster = each.key })

  dimensions = {
    ClusterName = each.key
  }

  alarm_actions = local.alarm_actions_effective
  ok_actions    = local.ok_actions_effective
}

# Memory
resource "aws_cloudwatch_metric_alarm" "memory_utilization" {
  for_each            = local.selected_clusters

  alarm_name          = "${local.alarm_name_base}-${each.key}-NodeMemory"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.eks_memory_evaluation_periods
  metric_name         = "node_memory_utilization"
  namespace           = "AWS/EKS"
  period              = var.eks_memory_events_period
  statistic           = "Average"
  threshold           = var.eks_memory_threshold
  alarm_description   = "Uso de memoria en nodos del EKS ${each.key}"

  tags = merge(local.merged_tags_common, { cluster = each.key })

  dimensions = {
    ClusterName = each.key
  }

  alarm_actions = local.alarm_actions_effective
  ok_actions    = local.ok_actions_effective
}

# Pod restarts
resource "aws_cloudwatch_metric_alarm" "pod_restarts" {
  for_each            = local.selected_clusters

  alarm_name          = "${local.alarm_name_base}-${each.key}-PodRestarts"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.eks_restarts_evaluation_periods
  metric_name         = "kube_pod_container_status_restarts_total"
  namespace           = "AWS/EKS"
  period              = var.eks_restarts_events_period
  statistic           = "Sum"
  threshold           = var.eks_restarts_threshold
  alarm_description   = "Reinicios de contenedores en EKS ${each.key} exceden el umbral"

  tags = merge(local.merged_tags_common, { cluster = each.key })

  dimensions = {
    ClusterName = each.key
  }

  alarm_actions = local.alarm_actions_effective
  ok_actions    = local.ok_actions_effective
}

# Replica availability
resource "aws_cloudwatch_metric_alarm" "replica_availability" {
  for_each            = local.selected_clusters

  alarm_name          = "${local.alarm_name_base}-${each.key}-ReplicaAvailability"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = var.eks_replicas_evaluation_periods
  metric_name         = "kube_deployment_status_replicas_available"
  namespace           = "AWS/EKS"
  period              = var.eks_replicas_events_period
  statistic           = "Average"
  threshold           = var.eks_replicas_threshold
  alarm_description   = "Réplicas disponibles en EKS ${each.key} por debajo del umbral"

  tags = merge(local.merged_tags_common, { cluster = each.key })

  dimensions = {
    ClusterName = each.key
  }

  alarm_actions = local.alarm_actions_effective
  ok_actions    = local.ok_actions_effective
}

# Service errors
resource "aws_cloudwatch_metric_alarm" "service_errors" {
  for_each            = local.selected_clusters

  alarm_name          = "${local.alarm_name_base}-${each.key}-ServiceErrors"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.eks_errors_evaluation_periods
  metric_name         = "service_request_error_total"
  namespace           = "AWS/EKS"
  period              = var.eks_errors_events_period
  statistic           = "Sum"
  threshold           = var.eks_errors_threshold
  alarm_description   = "Tasa de errores en servicios del EKS ${each.key} supera el umbral"

  tags = merge(local.merged_tags_common, { cluster = each.key })

  dimensions = {
    ClusterName = each.key
  }

  alarm_actions = local.alarm_actions_effective
  ok_actions    = local.ok_actions_effective
}
