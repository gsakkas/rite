
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec matchHeads x = x;;

let palindrome w = match explode w with | [] -> [] | h::t -> matchHeads w;;
