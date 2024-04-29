resource "aws_cloudwatch_metric_alarm" "high_cpu" {
  alarm_name          = var.scale_up_alarm_name
  comparison_operator = var.sclae_up_alarm_comparison_operator //Compare metric against threshold
  evaluation_periods  = var.evaluation_periods                 //Look at metric across this many periods
  metric_name         = var.metric_name
  namespace           = var.namespace
  period              = var.period    //Period to check metric
  statistic           = var.statistic //Statistic to use on metric (average, min, max)
  threshold           = var.threshold
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.this.name
  }
  alarm_description = var.scale_up_alarm_description
  alarm_actions     = [aws_autoscaling_policy.scale_up.arn]
}

resource "aws_cloudwatch_metric_alarm" "low_cpu" {
  alarm_name          = var.scale_down_alarm_name
  comparison_operator = var.scale_down_alarm_comparison_operator
  evaluation_periods  = 1
  metric_name         = var.metric_name
  namespace           = var.namespace
  period              = var.period
  statistic           = var.statistic
  threshold           = var.threshold
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.this.name
  }
  alarm_description = var.scale_down_alarm_description
  alarm_actions     = [aws_autoscaling_policy.scale_down.arn]
}
