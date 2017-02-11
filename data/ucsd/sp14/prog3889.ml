
let pipe fs =
  let f a x = a x in
  let base = match fs with | 0 -> 0 | _ -> fs in List.fold_left f base fs;;
