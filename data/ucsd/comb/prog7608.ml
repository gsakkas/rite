
let pipe fs =
  let f a x = x a in
  let base = match fs with | (h::t,z) -> z in List.fold_left f base fs;;
