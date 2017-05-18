
let pipe fs =
  let f a x f' a = x a in let base c = c in List.fold_left f base fs;;

let _ = pipe [] 3;;
