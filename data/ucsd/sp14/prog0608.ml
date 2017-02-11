
let rec listReverse l =
  let rec rev element =
    function | [] -> element | h::t -> rev (h :: element) t in
  rev [] l;;

let palindrome w =
  let reverse = listReverse w in if reverse = w then true else false;;

let _ = palindrome "malayalam";;
