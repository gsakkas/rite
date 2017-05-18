
let rec wwhile (f,b) =
  let rec helper (b',c') =
    match c' with
    | false  -> b'
    | true  -> let b' = b' + 1 in let c' = f b' in helper (b', c') in
  helper ((f b), (f b));;
