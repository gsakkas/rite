
let pipe fs =
  let f a x = x a in
  let base = List.fold_left f (fun b  -> List.fold_left f b fs) fs in
  List.fold_left f base fs;;
