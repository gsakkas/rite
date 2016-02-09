let f x =
  let xx = x * x in
  (xx, (xx < 100))

let rec wwhile (f,b) =
  match f with
  | (x, false) -> x
  | (x, true)  -> wwhile (f, x)

let _ = wwhile (f, 2)
