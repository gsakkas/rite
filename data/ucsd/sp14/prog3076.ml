
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | a::b -> (listReverse b) @ [a];;

let palindrome w =
  let wList = explode w in
  let wReverse = listReverse (explode w) in if true then wList;;
