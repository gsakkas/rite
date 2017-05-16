
let rec wwhile (f,b) =
  match f b with | (b',true ) -> wwhile (f, b') | (b',false ) -> b';;

let fixpoint (f,b) =
  let (b',c) = ((f b), ((f b) <> b)) in wwhile ((b', c), b);;
