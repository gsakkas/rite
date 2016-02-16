(* `sqsum [x1;...;xn]` returns the integer
   `x1^2 + ... + xn^2` *)

let rec sqsum xs =
  match xs with
  | [] -> 0
  | h::t -> (sqsum t) @ (h * h)

let _ = sqsum [1]
