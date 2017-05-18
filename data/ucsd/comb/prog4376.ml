
let pipe fs =
  let f a x g = a (x g) in
  let base = match fs with | [] -> 0 | h::t -> f (fun x  -> x) h in
  List.fold_left f base fs;;
