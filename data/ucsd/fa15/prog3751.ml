
let sqsum xs =
  let f a x = match x with | [] -> 0 | _ -> a * a in
  let base = List.hd xs in List.fold_left f base xs;;
