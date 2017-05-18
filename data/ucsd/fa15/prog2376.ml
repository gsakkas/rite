
let pipe fs =
  let f a x = match x with | [] -> [] | h::t -> h in
  let base = [] in List.fold_left f base fs;;

let _ = pipe [] 3;;
