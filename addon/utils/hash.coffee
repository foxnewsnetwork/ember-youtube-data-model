lll = (x) ->
  console.log x

merge = (obj) ->
  into: (target) ->
    for key, value of obj
      target[key] ?= value
    target

`export default merge`
`export {
  merge,
  lll
}`