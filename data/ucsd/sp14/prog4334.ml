
let a = 20;;

let pipe fs =
  let f a x = x in let base p = a p in List.fold_left f base (List.rev fs);;
