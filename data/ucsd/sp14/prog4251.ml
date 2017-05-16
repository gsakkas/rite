
let g x f = ((f x), ((f x) = x));;

let h q x y = q x y;;

let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile ((h g f b), b);;
