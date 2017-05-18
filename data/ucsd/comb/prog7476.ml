
let pipe fs =
  let f a x = let h::t = fs in a = (h x) in
  let base = 0 in List.fold_left f base fs;;
