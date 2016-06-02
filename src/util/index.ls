# using util.ls means that we can easier switch standard lib
ramda = require 'ramda'
log = (key, value) -->
  console.log key, value
  value
chain = (fn , monad) -->
  if monad.chain then monad.chain fn
  else throw new Error 'object does not implement method `chain`'

first = (fn, list) -->
  for e in list
    if fn e then return that
  void

findNode = (fn, root) -->
  switch
    when fn root then root
    when !root.children then void
    when _ then first (findNode fn), root.children

module.exports = {
  ...ramda,
  log,
  chain,
  first,
  findNode
}
