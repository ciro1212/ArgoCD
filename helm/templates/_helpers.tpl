{{/*
Expand the name of the chart.
*/}}
{{- define "falcon-controller.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "falcon-controller.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "falcon-controller.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "falcon-controller.labels" -}}
helm.sh/chart: {{ include "falcon-controller.chart" . }}
{{ include "falcon-controller.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "falcon-controller.selectorLabels" -}}
app.kubernetes.io/name: {{ include "falcon-controller.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}


{{/*
Common labels
*/}}
{{- define "falcon-controller.messageBus.labels" -}}
helm.sh/chart: {{ include "falcon-controller.chart" . }}
{{ include "falcon-controller.messageBus.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "falcon-controller.messageBus.selectorLabels" -}}
app.kubernetes.io/name: message-bus
app.kubernetes.io/instance: message-bus
{{- end }}


{{/*
Common labels
*/}}
{{- define "falcon-controller.receiver.labels" -}}
helm.sh/chart: {{ include "falcon-controller.chart" . }}
{{ include "falcon-controller.receiver.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "falcon-controller.receiver.selectorLabels" -}}
app.kubernetes.io/name: receiver
app.kubernetes.io/instance: receiver
{{- end }}


{{/*
Common labels
*/}}
{{- define "falcon-controller.afe.labels" -}}
helm.sh/chart: {{ include "falcon-controller.chart" . }}
{{ include "falcon-controller.afe.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "falcon-controller.afe.selectorLabels" -}}
app.kubernetes.io/name: afe
app.kubernetes.io/instance: afe
{{- end }}


{{/*
Common labels
*/}}
{{- define "falcon-controller.dfe.labels" -}}
helm.sh/chart: {{ include "falcon-controller.chart" . }}
{{ include "falcon-controller.dfe.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "falcon-controller.dfe.selectorLabels" -}}
app.kubernetes.io/name: dfe
app.kubernetes.io/instance: dfe
{{- end }}


{{/*
Common labels
*/}}
{{- define "falcon-controller.normalizer.labels" -}}
helm.sh/chart: {{ include "falcon-controller.chart" . }}
{{ include "falcon-controller.normalizer.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "falcon-controller.normalizer.selectorLabels" -}}
app.kubernetes.io/name: normalizer
app.kubernetes.io/instance: normalizer
{{- end }}



{/*
Common labels
*/}}
{{- define "falcon-controller.summarizationEngine.labels" -}}
helm.sh/chart: {{ include "falcon-controller.chart" . }}
{{ include "falcon-controller.summarizationEngine.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "falcon-controller.summarizationEngine.selectorLabels" -}}
app.kubernetes.io/name: summarizationEngine
app.kubernetes.io/instance: summarizationEngine
{{- end }}



{/*
Common labels
*/}}
{{- define "falcon-controller.cloudConnector.labels" -}}
helm.sh/chart: {{ include "falcon-controller.chart" . }}
{{ include "falcon-controller.cloudConnector.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "falcon-controller.cloudConnector.selectorLabels" -}}
app.kubernetes.io/name: cloudConnector
app.kubernetes.io/instance: cloudConnector
{{- end }}




{{/*
Create the name of the service account to use
*/}}
{{- define "falcon-controller.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "falcon-controller.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}



{{/*
Common labels
*/}}
{{- define "falcon-controller.bolaStore.labels" -}}
helm.sh/chart: {{ include "falcon-controller.chart" . }}
{{ include "falcon-controller.bolaStore.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "falcon-controller.bolaStore.selectorLabels" -}}
app.kubernetes.io/name: bola-store
app.kubernetes.io/instance: bola-store
{{- end }}


{{/*
Common labels
*/}}
{{- define "falcon-controller.bfe.labels" -}}
helm.sh/chart: {{ include "falcon-controller.chart" . }}
{{ include "falcon-controller.bfe.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "falcon-controller.bfe.selectorLabels" -}}
app.kubernetes.io/name: bfe
app.kubernetes.io/instance: bfe
{{- end }}
