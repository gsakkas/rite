
let pipe fs =
  let f a x = x a in let base p = p in List.fold_left f base (List.rev fs);;

let _ = pipe [(fun x  -> x + x); (fun x  -> x + 4)] 3;;
