
let pipe fs =
  let f a x = a (fun a  -> x a) in let base x = x in List.fold_left f base fs;;
