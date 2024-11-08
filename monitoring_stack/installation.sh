#! /bin/bash
#Grafana
helm repo add grafana https://grafana.github.io/helm-charts
helm install prometheus prometheus-community/kube-prometheus-stack --namespace default
helm install grafana grafana/grafana --version 8.5.12 -f monitoring_stack/grafana_helm_chart.yaml -n default

#Loki
helm install loki grafana/loki --version 6.18.0 -f monitoring_stack/loki_helm_chart.yml -n staging
helm install loki grafana/loki --version 6.18.0 -f monitoring_stack/loki_helm_chart.yml -n production

#Prometheus
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm install prometheus prometheus-community/prometheus --version 25.29.0 -f monitoring_stack/prometheus_helm_chart.yaml -n staging
helm install prometheus prometheus-community/prometheus --version 25.29.0 -f monitoring_stack/prometheus_helm_chart.yaml -n production

#Promtail
helm install promtail grafana/promtail --version 6.16.6 -f monitoring_stack/promtail_helm_chart.yaml -n staging
helm install promtail grafana/promtail --version 6.16.6 -f monitoring_stack/promtail_helm_chart.yaml -n production

#-------upgrade--------
#Grafana
helm upgrade grafana grafana/grafana --version 8.5.12 -f monitoring_stack/grafana_helm_chart.yaml -n default

#Loki
helm upgrade loki grafana/loki --version 6.18.0 -f monitoring_stack/loki_helm_chart.yml -n staging
helm upgrade loki grafana/loki --version 6.18.0 -f monitoring_stack/loki_helm_chart.yml -n production

#Prometheus
helm upgrade prometheus prometheus-community/prometheus --version 25.29.0 -f monitoring_stack/prometheus_helm_chart.yaml -n staging
helm upgrade prometheus prometheus-community/prometheus --version 25.29.0 -f monitoring_stack/prometheus_helm_chart.yaml -n production

#Promtail
helm upgrade promtail grafana/promtail --version 6.16.6 -f monitoring_stack/promtail_helm_chart.yaml -n staging
helm upgrade promtail grafana/promtail --version 6.16.6 -f monitoring_stack/promtail_helm_chart.yaml -n production


kubectl logs -f prometheus-server-0 -c prometheus-server -n staging