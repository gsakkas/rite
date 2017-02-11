
let pipe fs =
  let f a x p s a = x a in let base d = d in List.fold_left f base fs;;

let _ = pipe [] 3;;
