
let rec wwhile (f,b) =
  match f b with | (h,t) -> if t = true then wwhile (f, h) else h;;

let fixpoint (f,b) =
  wwhile (match f b with | false  -> wwhile (f, b) | b -> (b, b));;
