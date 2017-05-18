
let pipe fs =
  let f a x mb a = x a in let base x = x in List.fold_left f base fs;;

let _ = pipe [] 3;;
