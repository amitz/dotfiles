-- YAML: schemas from SchemaStore.nvim (incl. .gitlab-ci.yml, docker-compose,
-- GitHub workflows), plus GitLab's !reference tags.
return {
  -- lspconfig also lists yaml.docker-compose / yaml.gitlab / yaml.helm-values, which
  -- nvim never detects (checkhealth warns). Those files are plain `yaml` here.
  filetypes = { 'yaml' },
  settings = {
    yaml = {
      customTags = { '!reference sequence', '!reference scalar', '!reference mapping' },
      schemaStore = { enable = false, url = '' }, -- use SchemaStore.nvim's list instead of downloading
      schemas = require('schemastore').yaml.schemas(),
      validate = true,
    },
  },
}
