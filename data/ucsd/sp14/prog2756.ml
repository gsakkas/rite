
let pipe fs =
  let f a x a x = a x in let base d = d in List.fold_left f base fs;;

let _ = pipe [] 3;;
