
let rec helper (a,x) =
  match x with | [] -> 0 | h::t -> (h * h) + (helper (a, x));;

let sqsum xs =
  let f a x = helper (a, x) in
  let base = List.hd xs in List.fold_left f base xs;;
