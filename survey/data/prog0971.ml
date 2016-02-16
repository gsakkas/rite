(* `pipe [f1;...;fn]` (where f1,...,fn are functions!)
   returns a function `f` such that for any `x`, we have
   `f x` returns `fn(...(f2(f1 x)))` *)
let pipe fs = 
  let f acc el = el acc in
  let base x = x in
    List.fold_left f base fs

let _ = pipe [(fun y -> y + y); (fun z -> z + 3)] 3
