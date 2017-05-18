
let pipe fs =
  let f a x g b = g b in let base x = x in List.fold_left f base fs;;

let _ = pipe [] 3;;
