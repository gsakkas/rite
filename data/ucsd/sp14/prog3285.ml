
let pipe fs =
  let f a x c d = x c in let base b = b in List.fold_left f base fs;;

let _ = pipe [] 3;;
