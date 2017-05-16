
let pipe fs =
  let f a x combine a = x a in let base x = x in List.fold_left f base fs;;

let _ = pipe [] 3;;
