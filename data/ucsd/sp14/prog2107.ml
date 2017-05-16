
let sqsum xs =
  let rec f a x = match x with | [] -> a | h::t -> f (a + (h * h)) t in
  let base = 0 in List.fold_left f base xs;;

let _ = sqsum [1; 2; 3; 4];;
