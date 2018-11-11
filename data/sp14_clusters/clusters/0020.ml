LetG NonRec [AppG [EmptyG]] (LamG EmptyG)
let s =
  Random.State.make seed in
fun (x , y) ->
  x + Random.State.int s (y - x)
