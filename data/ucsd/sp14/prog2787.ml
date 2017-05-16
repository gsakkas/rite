
let pipe fs =
  let f a x d = a x d in
  let base p = p in List.fold_left f base (List.rev fs);;
