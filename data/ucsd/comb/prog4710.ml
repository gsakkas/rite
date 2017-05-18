
let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (x, y) | false  -> x in
  (f, b) (b, true);;
