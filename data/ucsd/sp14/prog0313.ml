
let rec listReverse l =
  let rec rev element =
    function | [] -> element | h::t -> rev (h :: element) t in
  rev [] l;;

let palindrome w = w = (listReverse w);;

let _ = palindrome "malayalam";;
