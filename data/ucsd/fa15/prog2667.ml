
let pipe fs =
  let f a x = let h::t = x in h a t in
  let base = [] in List.fold_left f base fs;;
