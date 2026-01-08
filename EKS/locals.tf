locals {
  # Base del nombre para todas las alarmas
  alarm_name_base = "${var.project}-${var.bdo_name_service}-${var.bdo_environment}"

  # Tags comunes + adicionales
  merged_tags_common = merge(
    {
      name = local.alarm_name_base
    },
    var.resource_tags,
    var.resource_adicional_tags
  )

  # Acciones efectivas con fallback a sns_topic_arn si no se pasan listas
  alarm_actions_effective = (
    length(var.alarm_actions) > 0
    ? var.alarm_actions
    : (var.sns_topic_arn != null ? [var.sns_topic_arn] : [])
  )

  ok_actions_effective = (
    length(var.ok_actions) > 0
    ? var.ok_actions
    : (var.sns_topic_arn != null ? [var.sns_topic_arn] : [])
  )

  # Set de clústeres seleccionados (manual)
  selected_clusters = toset(var.cluster_name)
}
