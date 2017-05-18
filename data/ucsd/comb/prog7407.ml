
let rec wwhile (f,b) =
  let (b',c) = f b in if not c then b' else wwhile (f, b');;

let fixpoint (f,b) =
  wwhile ((match f b with | b -> b | _ -> wwhile (f, b)), b);;
