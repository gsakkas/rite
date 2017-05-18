
let rec wwhile (f,b) =
  let (a',b') = f b in if b' = true then wwhile (f, b') else a';;

let _ = let f x = let xx = (x * x) * x in (xx, (xx < 100)) in wwhile (f, 2);;
