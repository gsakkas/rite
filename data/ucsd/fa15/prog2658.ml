
let pipe fs =
  let f a x = let h::t = fs in h a in
  let base = 0 in List.fold_left f base fs;;

let _ = pipe [] 3;;
