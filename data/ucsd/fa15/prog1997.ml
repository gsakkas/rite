
let pipe fs = let f a x x q = q in let base x = x in List.fold_left f base fs;;

let _ = pipe [] 3;;
