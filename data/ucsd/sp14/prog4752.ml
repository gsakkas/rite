
let f x = let xx = (x * x) * x in (xx, (xx < 100));;

let (c,b) = f 8;;

let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let (x,y) = f 8;;

let _ =
  let fixpoint (f,b) = let y x = f b in (y, (b = (f b))) in wwhile (y, b);;
