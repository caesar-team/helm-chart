{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "caesar-server.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "caesar-server.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "caesar-server.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "messengerTransportDsn" }}
{{- printf "amqp://%s:%s@%s:%s/%s" .Values.rabbitmq.auth.username (.Values.rabbitmq.auth.password | replace "+" "%2B" ) (print .Release.Name "-rabbitmq-headless") .Values.rabbitmq.service.port .Values.rabbitmq.resourceName | b64enc | quote }}
{{- end -}}

{{- define "databaseDsn" }}
{{- printf "pgsql://%s:%s@%s:%s/%s" .Values.postgresql.postgresqlUsername (.Values.postgresql.postgresqlPassword | replace "+" "%2B" ) (print .Release.Name "-postgresql-headless") .Values.postgresql.service.port .Values.postgresql.postgresqlDatabase | b64enc | quote }}
{{- end -}}
