
let f x = let xx = (x * x) * x in (xx, (xx < 100));;

let (c,b) = f 8;;

let f b = b;;

let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let _ =
  3 = 3;
  (let fixpoint (f,b) = let f x = (b, (f b)) in b = (f b) in wwhile (f, b));;
