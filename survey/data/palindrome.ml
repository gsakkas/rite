(* A palindrome is a word that reads the same from
   left-to-right and right-to-left.
   `palindrome w` returns `true` if the string
   is a palindrome and `false` otherwise *)

let listReverse l =
  let rec helper xs = function
    | [] -> xs
    | hd::tl -> helper (hd :: xs) tl
  in helper []

let palindrome (w : char list) =
  if (listReverse w) = w
  then true
  else false

let _ = palindrome ['a'; 'b']
