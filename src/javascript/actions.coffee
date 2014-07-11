Const = require("./constants");
actions =
  links:
    upVote: (link) ->
      @dispatch(Const.LINKS_UP_VOTE, link)
    addLink: (link) ->
      @dispatch(Const.LINKS_ADD, link)
module.exports = actions
