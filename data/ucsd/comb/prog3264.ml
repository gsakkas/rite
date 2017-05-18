
let pipe fs =
  let f a x y z = y z in let base b = b in List.fold_left f base fs;;

let _ = pipe [] 3;;
