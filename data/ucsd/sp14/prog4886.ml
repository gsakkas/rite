
let pipe fs =
  let f a x _ c = x c in let base b = b in List.fold_left f base fs;;

let _ = pipe [] 3;;
