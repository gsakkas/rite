
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec revexp (x,y) = match x with | [] -> y | h::t -> revexp (t, (h ^ y));;

let palindrome w = if w = (revexp ((explode w), "")) then true else false;;
