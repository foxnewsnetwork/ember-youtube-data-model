`import Ember from 'ember'`

class FunEx
  @reverse = (f) ->
    (args...)-> f.apply @, args.reverse()

  # Flips the order of the first 2 arguments of a function
  @flip = (f) ->
    (arg1, arg2, rest...) -> f.apply @, [arg2, arg1].concat rest

  @computed = ->
    [deps..., fun] = arguments
    ff = Ember.computed(fun)
    ff.property.apply ff, deps

  @volatile = (f) ->
    Ember.computed(f).volatile()

  @observed = ->
    [fields..., fun] = arguments
    fun.observes.apply fun, fields

  @isBlank = Ember.isBlank

  @isPresent = (x) -> not Ember.isBlank x

`export default FunEx`
