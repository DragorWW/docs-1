{{- define "gitlab.appConfig.gitaly" -}}
gitaly:
  client_path: /home/git/gitaly/bin
  token: "<%= File.read('/etc/gitlab/gitaly/gitaly_token') %>"
{{- end -}}

{{- define "gitlab.appConfig.repositories" -}}
repositories:
  storages: # You must have at least a `default` storage path.
{{ include "gitlab.gitaly.storages" . | indent 4 }}
{{- end -}}

{{- define "gitlab.configYaml.extra" -}}
extra:
  google_analytics_id: {{ .extra.googleAnalyticsId | quote }}
  piwik_url: {{ .extra.piwikUrl | quote }}
  piwik_site_id: {{ .extra.piwikSiteId | quote }}
{{- end -}}
