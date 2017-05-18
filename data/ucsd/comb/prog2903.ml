
let rec wwhile (f,b) =
  let (f',b') = f b in if b' = true then wwhile (f, f') else f';;

let fixpoint (f,b) = wwhile ((let h x = ((f b), ((f b) != b)) in f), b);;
