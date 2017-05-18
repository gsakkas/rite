
let pipe fs =
  let f a x = x a in let base = function | y -> y in List.fold_left f base;;

let _ = pipe [] 3;;
