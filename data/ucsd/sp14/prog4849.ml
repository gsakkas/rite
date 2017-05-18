
let pipe fs =
  let f a x = x a in
  let base = match fs with | (fn,n) -> n in List.fold_left f base fs;;
