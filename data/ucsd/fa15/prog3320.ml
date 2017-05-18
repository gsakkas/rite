
let pipe fs =
  let f a x = let h::t = fs in h a x in
  let base = 3 in List.fold_left f base fs;;
