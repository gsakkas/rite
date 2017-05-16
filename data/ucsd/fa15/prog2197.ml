
let pipe fs num =
  let f a x = match x with | [] -> (fun d  -> a) | h::t -> h in
  let base = num in List.fold_left f base fs;;
