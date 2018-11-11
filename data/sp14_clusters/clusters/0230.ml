LetG NonRec [LamG EmptyG] (AppG [EmptyG,EmptyG])
let max' =
  fun a ->
    fun b ->
      if a < b then b else a in
max' 1.0 (min 1.0
              ((2.71 ** ((sin (pi *. eval (a , x , y)) +. cos (pi *. eval (b , x , y))) -. 1.0)) -. 1.0))
let max' =
  fun a ->
    fun b ->
      if a < b then b else a in
max' 1.0 (min 1.0
              ((2.71 ** ((sin (pi *. eval (a , x , y)) +. cos (pi *. eval (b , x , y))) -. 1.0)) -. 1.0))
let helper =
  fun x ->
    fun n ->
      if n < 1
      then accum
      else x :: accum in
helper x (n - 1)
let helper =
  fun x ->
    fun n ->
      if n < 1
      then accum
      else x :: accum in
helper x (n - 1)
