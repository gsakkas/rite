
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile
    (let f' b' = let bb = f b in (bb, (bb = (f b))) in ((wwhile (f', b)), b));;
