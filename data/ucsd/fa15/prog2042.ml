
let rec fix t x = if x = (t x) then x else t x;;

let rec wwhile (f,b) =
  match f b with | (h,t) -> if t = true then wwhile (f, h) else h;;

let fixpoint (f,b) = wwhile ((fix b), b);;
