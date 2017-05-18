
let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) | false  -> x in
  (f, b) (b, true);;
