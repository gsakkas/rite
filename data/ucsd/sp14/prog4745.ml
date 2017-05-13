
let pipe fs =
  let f a x = match x with | [] -> 0 | _ -> x a in
  let base = n in List.fold_left f base fs;;
