let rec digitsOfInt n =
  match n with
  | []   -> []
  | h::t -> let rest = digitsOfInt t in
            if h > 0 then h :: rest else rest

let _ = digitsOfInt 1
