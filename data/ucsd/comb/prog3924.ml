
let pipe fs =
  let f a x = match x with | [] -> (fun b  -> b) in
  let base = 0 in List.fold_left f base fs;;
