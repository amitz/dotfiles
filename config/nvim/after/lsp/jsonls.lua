-- JSON: schemas from SchemaStore.nvim (package.json, tsconfig.json, renovate.json, ...).
return {
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
      validate = { enable = true },
    },
  },
}
