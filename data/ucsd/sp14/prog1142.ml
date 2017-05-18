
let rec wwhile (f,x) = let (x',b') = f x in if b' then wwhile (f, x') else x';;

let rec fixpoint (f,x) =
  let x' = f x in let g x = (f, (x' = x)) in wwhile (g, x);;
