###############################
# Alarmas EKS
###############################

resource "aws_cloudwatch_metric_alarm" "cpu_utilization" {

  alarm_name          = "${var.project}-${var.bdo_name_service}-NodeCPU-${var.bdo_environment}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.eks_cpu_evaluation_periods
  metric_name         = "node_cpu_utilization"
  namespace           = "AWS/EKS"
  period              = var.eks_cpu_events_period
  statistic           = "Average"
  threshold           = var.eks_cpu_threshold
  alarm_description   = "Uso de CPU en nodos del EKS ${var.cluster_name}"
 
  tags = merge({
    name = "${var.project}-${var.bdo_name_service}-${var.bdo_environment}"
    },
    var.resource_tags
  )

  dimensions = {
    ClusterName = var.cluster_name
  }

  alarm_actions = var.alarm_actions
  ok_actions    = var.ok_actions
}

resource "aws_cloudwatch_metric_alarm" "memory_utilization" {

  alarm_name          = "${var.project}-${var.bdo_name_service}-NodeMemory-${var.bdo_environment}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.eks_memory_evaluation_periods
  metric_name         = "node_memory_utilization"
  namespace           = "AWS/EKS"
  period              = var.eks_memory_events_period
  statistic           = "Average"
  threshold           = var.eks_memory_threshold
  alarm_description   = "Uso de memoria en nodos del EKS ${var.cluster_name}"

  tags = merge({
    name = "${var.project}-${var.bdo_name_service}-${var.bdo_environment}"
    },
    var.resource_tags
  )

  dimensions = {
    ClusterName = var.cluster_name
  }

  alarm_actions = var.alarm_actions
  ok_actions    = var.ok_actions
}

resource "aws_cloudwatch_metric_alarm" "pod_restarts" {

  alarm_name          = "${var.project}-${var.bdo_name_service}-PodRestarts-${var.bdo_environment}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.eks_restarts_evaluation_periods
  metric_name         = "kube_pod_container_status_restarts_total"
  namespace           = "AWS/EKS"
  period              = var.eks_restarts_events_period
  statistic           = "Sum"
  threshold           = var.eks_restarts_threshold
  alarm_description   = "Reinicios de contenedores en EKS ${var.cluster_name} exceden el umbral"

  tags = merge({
    name = "${var.project}-${var.bdo_name_service}-${var.bdo_environment}"
    },
    var.resource_tags
  )

  dimensions = {
    ClusterName = var.cluster_name
  }

  alarm_actions = var.alarm_actions
  ok_actions    = var.ok_actions
}

resource "aws_cloudwatch_metric_alarm" "replica_availability" {

  alarm_name          = "${var.project}-${var.bdo_name_service}-ReplicaAvailability-${var.bdo_environment}"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = var.eks_replicas_evaluation_periods
  metric_name         = "kube_deployment_status_replicas_available"
  namespace           = "AWS/EKS"
  period              = var.eks_replicas_events_period
  statistic           = "Average"
  threshold           = var.eks_replicas_threshold
  alarm_description   = "Porcentaje de réplicas disponibles en EKS ${var.cluster_name} por debajo del umbral"

   tags = merge({
    name = "${var.project}-${var.bdo_name_service}-${var.bdo_environment}"
    },
    var.resource_tags
  )

  dimensions = {
    ClusterName = var.cluster_name
  }

  alarm_actions = var.alarm_actions
  ok_actions    = var.ok_actions
}

resource "aws_cloudwatch_metric_alarm" "service_errors" {

  alarm_name          = "${var.project}-${var.bdo_name_service}-ServiceErrors-${var.bdo_environment}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.eks_errors_evaluation_periods
  metric_name         = "service_request_error_total"
  namespace           = "AWS/EKS"
  period              = var.eks_errors_events_period
  statistic           = "Sum"
  threshold           = var.eks_errors_threshold
  alarm_description   = "Tasa de errores en servicios del EKS ${var.cluster_name} supera el umbral"

   tags = merge({
    name = "${var.project}-${var.bdo_name_service}-${var.bdo_environment}"
    },
    var.resource_tags
  )

  dimensions = {
    ClusterName = var.cluster_name
  }

  alarm_actions = var.alarm_actions
  ok_actions    = var.ok_actions
}
