
let x _ f = f;;

let pipe fs = let f a x = a x in let base = x in List.fold_left f base fs;;
