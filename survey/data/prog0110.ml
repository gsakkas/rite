let rec add xs =
  match xs with
  | []   -> 0
  | h::t -> h + t

let _ = add [1]
