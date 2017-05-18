
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | x::xs -> (listReverse xs) @ [x];;

let palindrome w = (explode w) == (listReverse (explode w));;

let _ =
  (palindrome "myxomatosis" explode "mam") == (listReverse (explode "mam"));;
