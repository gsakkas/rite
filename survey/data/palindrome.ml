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
