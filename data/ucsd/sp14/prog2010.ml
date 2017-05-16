
let pipe fs =
  let f a x = a = (fun x  -> fun a  -> fun t  -> x (a t)) in
  let base x = x in List.fold_left f base fs;;
