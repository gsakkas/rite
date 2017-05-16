
let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let palindrome w = if w = (listReverse w) then true else false;;

let _ = palindrome "myxomatosis";;
