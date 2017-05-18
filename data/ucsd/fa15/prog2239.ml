
let pipe fs =
  let f a x = let c y = 2 in c in
  let base = let g y = y in g in List.fold_left f base fs;;

let pipe fs =
  let f a x = let c z = let a::x = fs in a (pipe x) in c in
  let base = let g y = y in g in List.fold_left f base fs;;

let _ = pipe [(fun x  -> x + x); (fun x  -> x + 3)] 3;;
