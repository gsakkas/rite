
let pipe fs =
  let f a x = match x with | [] -> a | h::t -> t in
  let base x = x in List.fold_left f base fs;;
