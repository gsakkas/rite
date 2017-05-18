
let pipe fs =
  let f a x = a (fun a  -> x) in let base x = x in List.fold_left f base fs;;
