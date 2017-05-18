
let rec wwhile (f,b) =
  let f' = f b in
  match f' with | (b',false ) -> b' | (b',true ) -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile
    ((let whilesFun f' = let fOfB = f' b in (fOfB, (fOfB = b)) in whilesFun f),
      b);;
