
let rec wwhile (f,b) =
  let y = f b in match y with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (f, b);;

let fixpoint (f,b) =
  let y = f b in
  match y with | aPrime -> if b = aPrime then b else fixpoint (f, aPrime);;
