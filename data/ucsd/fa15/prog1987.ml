
let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | buildX -> x
  | buildY -> y
  | buildSine -> sin (pi *. (eval e x y))
  | buildCosine -> cos (pi *. e)
  | buildAverage -> (e1 +. e2) /. 2
  | buildTimes -> e1 *. e2
  | buildThresh -> if a < b then a_less else b_less;;
