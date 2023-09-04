{{/*
Expand the name of the chart.
*/}}
{{- define "b2bglobal.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "b2bglobal.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "b2bglobal.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
b2bglobal labels
*/}}
{{- define "b2bglobal.labels" -}}
app.kubernetes.io/component: general
app.kubernetes.io/part-of: b2b
helm.sh/chart: {{ include "b2bglobal.chart" . }}
{{ include "b2bglobal.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "b2bglobal.selectorLabels" -}}
app.kubernetes.io/name: {{ include "b2bglobal.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}