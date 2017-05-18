
let pipe fs =
  let f a x = match x with | a -> (fun x  -> x) | h::t -> h in
  let base = [] in List.fold_left f base fs;;
