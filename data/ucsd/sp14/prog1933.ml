
let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile
    ((let helper b = if b = (f b) then ((f b), false) else ((f b), true) in
      helper), b);;

let _ = let f x = let xx = (x * x) * x in (xx, (xx < 100)) in fixpoint (f, 1);;
