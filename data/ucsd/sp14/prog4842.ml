
let pipe fs =
  let f a x = match x with | [] -> 0 | _ -> 1 in
  let base = [] in List.fold_left f base fs;;
