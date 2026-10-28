{%- set display_name = product.name | lower | replace('moda urbana outlet', '') | replace('moda urbana', '') | trim(' /-') -%}
{{- display_name | lower | capitalize -}}
