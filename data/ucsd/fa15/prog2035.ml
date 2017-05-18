
let rec wwhile (f,b) =
  match f b with | (h,t) -> if t = true then wwhile (f, h) else h;;

let fixpoint (f,b) =
  wwhile (if (wwhile (f, b)) = b then b else ((wwhile (f, b)), b));;
