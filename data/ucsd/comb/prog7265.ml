
let pipe fs =
  let f a x = let b y = x a in b in
  let base = let c y = y in c in List.fold_left f base fs;;

let _ = pipe [(fun x  -> x + x); (fun x  -> x + 3)] 3;;
