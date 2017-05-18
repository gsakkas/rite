
let pipe fs =
  let f a x d c = x c in let base b = b in List.fold_left f base fs;;

let _ = pipe [] 3;;
