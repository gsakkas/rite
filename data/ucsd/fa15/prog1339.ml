
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let foo f b =
    let result = f b in
    if result = b then (result, false) else (result, true) in
  wwhile (foo, b);;
