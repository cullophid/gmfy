export class Task
  (action) ->
    @action = action

  fork: (err, succ) ->
    @action err, succ

  chain: (fn) ->
    new Task (reject, resolve) ~>
      @fork reject, (data) -> fn data .fork reject, resolve

  map: (fn) ->
    @chain (x) -> Task.of fn x

Task.of = (x) ->
  new Task (_, resolve) -> resolve x
