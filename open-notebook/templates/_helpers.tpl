{{- define "open-notebook.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "open-notebook.labels" -}}
app: {{ include "open-notebook.fullname" . }}
release: {{ .Release.Name }}
chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
{{- end -}}

{{- define "open-notebook.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
{{- .Release.Name }}-{{ .Chart.Name }}
{{- else -}}
{{- .Values.serviceAccount.name -}}
{{- end -}}
{{- end -}}