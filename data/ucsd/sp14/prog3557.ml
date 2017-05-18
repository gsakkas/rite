
let pipe fs = let f a x = x a in let base = [] in List.fold_left f base fs;;

let _ = pipe [] 3;;
