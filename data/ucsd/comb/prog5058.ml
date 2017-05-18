
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile
    (let g x = let calcfx = f x in (calcfx, (calcfx = x)) in (((g x), x), b));;
