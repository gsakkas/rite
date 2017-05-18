
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | head::tail -> (listReverse tail) @ [head];;

let palindrome w =
  if (explode w) = (explode (listReverse w)) then true else false;;
