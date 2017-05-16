
let rec wwhile (f,b) =
  let rec helper (b',c') =
    match c' with
    | false  -> b'
    | true  ->
        let b'' = if (f b') = true then b' + 1 else b' in
        let c'' = f b'' in helper (b'', c'') in
  helper (b, (f b));;

let _ = let f x = let xx = (x * x) * x in (xx, (xx < 100)) in wwhile (f, 2);;
