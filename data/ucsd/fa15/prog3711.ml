
let pipe fs =
  let f a x b e = x a in let base c = c in List.fold_left f base fs;;

let _ = pipe [] 3;;
