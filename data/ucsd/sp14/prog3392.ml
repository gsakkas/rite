
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l = List.rev l;;

let palindrome w = if (explode w) = (listReverse w) then true else false;;
