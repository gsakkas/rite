
let pipe fs =
  let f a x = match a with | [] -> [] | h::t -> h x in
  let base = 3 in List.fold_left f base fs;;
