
let rec listReverse l =
  let rec listReverseHelper l =
    function | [] -> l | h::t -> listReverseHelper (h :: l) t in
  listReverseHelper [] l;;

let palindrome w = if w = (listReverse w) then true else false;;

let _ = palindrome "malayalam";;
