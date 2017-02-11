
let listReverse l =
  let rec reverseHelper acc =
    function | [] -> acc | h::t -> reverseHelper (h :: acc) t in
  reverseHelper [] l;;

let palindrome w = if w = (listReverse w) then true else false;;

let _ = palindrome "malayalam";;
