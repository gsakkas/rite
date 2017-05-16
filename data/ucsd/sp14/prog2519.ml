
let rec wwhile (f,b) =
  let f' = f b in
  match f' with | (b',false ) -> b' | (b',true ) -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile
    ((let whilesFun f' b' = let fOfB = f' b' in (b', (b' = fOfB)) in
      whilesFun (f, b)), b);;
