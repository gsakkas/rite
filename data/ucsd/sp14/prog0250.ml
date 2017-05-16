
let f a b a = a * b;;

let pipe fs =
  let f a x = f (x a) in let base x = x in List.fold_left f base fs;;
