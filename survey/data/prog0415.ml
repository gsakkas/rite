(* `digitsOfInt n` returns `[]` if `n` is not positive, and otherwise
   returns the list of digits of `n` in the order in which they appear
   in `n`. *)

let rec digitsOfInt n =
  match n with
  | []   -> []
  | h::t -> let rest = digitsOfInt t in
            if h > 0 then h :: rest else rest

let _ = digitsOfInt 1
