
let rec at a b = match a with | [] -> [b] | head::tail -> head :: (at tail b);;

let rec listReverse l =
  match l with | [] -> [] | head::tail -> at (listReverse tail) head;;

let palindrome w = w = (listReverse w);;

let _ = palindrome "malayalam";;
