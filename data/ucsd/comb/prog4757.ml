
let f x = let xx = (x * x) * x in (xx, (xx < 100));;

let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let (x,y) = f 8;;

let fixpoint (f,b) = let f x = (f, ((f b) = b)) in wwhile (f, x);;
