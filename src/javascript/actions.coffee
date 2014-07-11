Const = require("./constants");
actions =
  links:
    addLink: (link) ->
      @dispatch(Const.LINKS_ADD, link)
module.exports = actions
